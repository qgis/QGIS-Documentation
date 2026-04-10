#!/usr/bin/env bash
#
# Check that image references in RST files point to existing files
# Used by pre-commit to catch broken image references before commit
#

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

errors=0
checked=0
repo_dir=$(git rev-parse --show-toplevel)

for file in "$@"; do
    if [[ ! -f "$file" ]]; then
        continue
    fi

    dir=$(dirname "$file")

    # Extract image paths from RST directives
    # Patterns: .. image:: path, .. figure:: path
    while IFS= read -r img_path; do
        if [[ -z "$img_path" ]]; then
            continue
        fi

        ((checked++)) || true

        # Handle absolute paths (from repo root)
        if [[ "$img_path" == /* ]]; then
            full_path="${repo_dir}${img_path}"
        else
            full_path="$dir/$img_path"
        fi

        # Normalize path
        full_path=$(realpath -m "$full_path" 2>/dev/null || echo "$full_path")

        if [[ ! -f "$full_path" ]]; then
            echo -e "${RED}ERROR${NC}: Missing image in $file"
            echo "       Referenced: $img_path"
            echo "       Expected at: $full_path"
            ((errors++)) || true
        fi
    done < <(grep -oP '(?:image|figure)::\s*\K[^\s]+' "$file" 2>/dev/null || true)
done

if [[ $errors -gt 0 ]]; then
    echo ""
    echo -e "${RED}Found $errors missing image(s) in $checked reference(s)${NC}"
    exit 1
fi

if [[ $checked -gt 0 ]]; then
    echo -e "${GREEN}All $checked image references valid${NC}"
fi

exit 0
