#!/usr/bin/env bash
#
# Optimize PNG images in the documentation
# Uses optipng for lossless compression and pngquant for lossy (optional)
#
# Usage:
#   ./scripts/optimize_images.sh [--lossy] [--dry-run] [path]
#
# Options:
#   --lossy    Use pngquant for additional lossy compression (smaller but may affect quality)
#   --dry-run  Show what would be done without making changes
#   path       Specific path to optimize (default: docs/)
#

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
LOSSY=false
DRY_RUN=false
TARGET_PATH="build/html/"
TOTAL_SAVED=0
FILES_PROCESSED=0
FILES_OPTIMIZED=0

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --lossy)
            LOSSY=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        *)
            TARGET_PATH="$1"
            shift
            ;;
    esac
done

# Check for required tools
check_tools() {
    local missing=()

    if ! command -v optipng &> /dev/null; then
        missing+=("optipng")
    fi

    if [[ "$LOSSY" == true ]] && ! command -v pngquant &> /dev/null; then
        missing+=("pngquant")
    fi

    if [[ ${#missing[@]} -gt 0 ]]; then
        echo -e "${RED}Error: Missing required tools: ${missing[*]}${NC}"
        echo "Install with:"
        echo "  nix develop  # Tools are included in the dev shell"
        echo "  # or"
        echo "  sudo apt-get install ${missing[*]}"
        exit 1
    fi
}

# Format bytes to human readable
format_bytes() {
    local bytes=$1
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( bytes / 1024 ))KB"
    else
        echo "$(( bytes / 1048576 ))MB"
    fi
}

# Optimize a single PNG file
optimize_png() {
    local file="$1"
    local original_size
    local new_size
    local saved

    original_size=$(stat -c%s "$file")

    if [[ "$DRY_RUN" == true ]]; then
        echo -e "${BLUE}[DRY-RUN]${NC} Would optimize: $file ($(format_bytes $original_size))"
        return
    fi

    # Create backup
    cp "$file" "${file}.bak"

    # Lossy compression with pngquant (if enabled)
    if [[ "$LOSSY" == true ]]; then
        pngquant --quality=65-80 --skip-if-larger --force --output "$file" "$file" 2>/dev/null || true
    fi

    # Lossless compression with optipng
    optipng -o2 -quiet "$file" 2>/dev/null || true

    new_size=$(stat -c%s "$file")

    if [[ $new_size -ge $original_size ]]; then
        # Restore backup if no improvement
        mv "${file}.bak" "$file"
        echo -e "${YELLOW}[SKIP]${NC} $file (no improvement)"
    else
        rm "${file}.bak"
        saved=$((original_size - new_size))
        TOTAL_SAVED=$((TOTAL_SAVED + saved))
        FILES_OPTIMIZED=$((FILES_OPTIMIZED + 1))
        local percent=$((100 - (new_size * 100 / original_size)))
        echo -e "${GREEN}[OK]${NC} $file: $(format_bytes $original_size) → $(format_bytes $new_size) (${percent}% smaller)"
    fi

    FILES_PROCESSED=$((FILES_PROCESSED + 1))
}

# Main
main() {
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  PNG Image Optimizer for QGIS Documentation${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "Target path: ${YELLOW}$TARGET_PATH${NC}"
    echo -e "Mode: ${YELLOW}$(if [[ "$LOSSY" == true ]]; then echo "Lossy (pngquant + optipng)"; else echo "Lossless (optipng only)"; fi)${NC}"
    if [[ "$DRY_RUN" == true ]]; then
        echo -e "${YELLOW}DRY RUN - No changes will be made${NC}"
    fi
    echo ""

    check_tools

    # Find and process PNG files
    local png_files
    png_files=$(find "$TARGET_PATH" -type f -name "*.png" -not -path "*/build/*" -not -path "*/venv/*" 2>/dev/null | sort)

    local total_files
    total_files=$(echo "$png_files" | grep -c "." || echo "0")

    if [[ "$total_files" -eq 0 ]]; then
        echo -e "${YELLOW}No PNG files found in $TARGET_PATH${NC}"
        exit 0
    fi

    echo -e "Found ${BLUE}$total_files${NC} PNG files to process..."
    echo ""

    while IFS= read -r file; do
        [[ -n "$file" ]] && optimize_png "$file"
    done <<< "$png_files"

    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "  ${GREEN}Summary${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "  Files processed: ${BLUE}$FILES_PROCESSED${NC}"
    echo -e "  Files optimized: ${GREEN}$FILES_OPTIMIZED${NC}"
    echo -e "  Total saved:     ${GREEN}$(format_bytes $TOTAL_SAVED)${NC}"
    echo ""
}

main
