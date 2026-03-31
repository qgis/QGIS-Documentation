#!/usr/bin/env bash
#
# Build all language versions of QGIS Documentation in parallel
#
# Usage:
#   ./scripts/build_all_languages.sh [options]
#
# Options:
#   --pull          Pull translations from Transifex first
#   --html          Build HTML only (default)
#   --pdf           Build PDF only
#   --full          Build both HTML and PDF
#   --jobs N        Number of parallel jobs (default: number of CPU cores)
#   --languages L   Comma-separated list of languages (default: all configured)
#   --clean         Clean build directory before building
#   --dry-run       Show what would be done without executing
#

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Default values
PULL_TRANSLATIONS=false
BUILD_HTML=true
BUILD_PDF=false
CLEAN_FIRST=false
DRY_RUN=false
JOBS=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)

# Languages from Makefile (excluding en for translation pull)
ALL_LANGUAGES="en de es fr it ja ko nl pt_BR pt_PT ru zh_Hans"
LANGUAGES=""

# Timing
START_TIME=$(date +%s)

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --pull)
            PULL_TRANSLATIONS=true
            shift
            ;;
        --html)
            BUILD_HTML=true
            BUILD_PDF=false
            shift
            ;;
        --pdf)
            BUILD_HTML=false
            BUILD_PDF=true
            shift
            ;;
        --full)
            BUILD_HTML=true
            BUILD_PDF=true
            shift
            ;;
        --jobs)
            JOBS="$2"
            shift 2
            ;;
        --languages)
            LANGUAGES="$2"
            shift 2
            ;;
        --clean)
            CLEAN_FIRST=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --help|-h)
            head -20 "$0" | tail -n +2 | sed 's/^#//'
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            exit 1
            ;;
    esac
done

# Use all languages if not specified
if [[ -z "$LANGUAGES" ]]; then
    LANGUAGES="$ALL_LANGUAGES"
fi

# Convert to array
IFS=' ,' read -ra LANG_ARRAY <<< "$LANGUAGES"

print_header() {
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

print_status() {
    echo -e "${CYAN}[$1/${#LANG_ARRAY[@]}]${NC} $2"
}

log_file() {
    echo "build/logs/$1.log"
}

# Ensure log directory exists
mkdir -p build/logs

print_header "QGIS Documentation Multi-Language Build"

echo -e "Configuration:"
echo -e "  Languages:    ${YELLOW}${LANG_ARRAY[*]}${NC}"
echo -e "  Parallel jobs: ${YELLOW}$JOBS${NC}"
echo -e "  Pull translations: ${YELLOW}$PULL_TRANSLATIONS${NC}"
echo -e "  Build HTML:   ${YELLOW}$BUILD_HTML${NC}"
echo -e "  Build PDF:    ${YELLOW}$BUILD_PDF${NC}"
echo -e "  Clean first:  ${YELLOW}$CLEAN_FIRST${NC}"
if [[ "$DRY_RUN" == true ]]; then
    echo -e "  ${YELLOW}DRY RUN - No actual builds will be performed${NC}"
fi
echo ""

# Clean if requested
if [[ "$CLEAN_FIRST" == true ]]; then
    print_header "Cleaning Build Directory"
    if [[ "$DRY_RUN" == true ]]; then
        echo "Would run: make springclean"
    else
        make springclean
    fi
fi

# Pull translations
if [[ "$PULL_TRANSLATIONS" == true ]]; then
    print_header "Pulling Translations from Transifex"

    # Build language list for tx (excluding en, replacing zh_Hans with zh-Hans)
    TX_LANGS=""
    for lang in "${LANG_ARRAY[@]}"; do
        if [[ "$lang" != "en" ]]; then
            tx_lang="${lang//_/-}"  # Replace underscore with dash for Transifex
            if [[ -n "$TX_LANGS" ]]; then
                TX_LANGS="$TX_LANGS,$tx_lang"
            else
                TX_LANGS="$tx_lang"
            fi
        fi
    done

    if [[ -n "$TX_LANGS" ]]; then
        echo -e "Pulling languages: ${YELLOW}$TX_LANGS${NC}"
        if [[ "$DRY_RUN" == true ]]; then
            echo "Would run: tx pull -f --parallel --mode onlytranslated -l $TX_LANGS"
        else
            tx pull -f --parallel --mode onlytranslated -l "$TX_LANGS" || {
                echo -e "${YELLOW}Warning: Some translations may have failed to pull${NC}"
            }
        fi
    fi
fi

# Function to build a single language
build_language() {
    local lang=$1
    local format=$2
    local log=$(log_file "${lang}_${format}")

    echo -e "${CYAN}Building $format for $lang...${NC}"

    if [[ "$DRY_RUN" == true ]]; then
        echo "Would run: make LANG=$lang $format > $log 2>&1"
        return 0
    fi

    if make LANG="$lang" "$format" > "$log" 2>&1; then
        echo -e "${GREEN}✓ $lang ($format) completed${NC}"
        return 0
    else
        echo -e "${RED}✗ $lang ($format) failed - see $log${NC}"
        return 1
    fi
}

export -f build_language log_file
export DRY_RUN GREEN RED CYAN YELLOW NC

# Build HTML in parallel
if [[ "$BUILD_HTML" == true ]]; then
    print_header "Building HTML Documentation (Parallel)"

    if command -v parallel &> /dev/null; then
        # Use GNU parallel if available
        printf '%s\n' "${LANG_ARRAY[@]}" | parallel -j "$JOBS" --progress build_language {} html
    else
        # Fallback to xargs
        printf '%s\n' "${LANG_ARRAY[@]}" | xargs -P "$JOBS" -I {} bash -c 'build_language "$@"' _ {} html
    fi

    # Summary
    echo ""
    echo -e "${GREEN}HTML builds completed${NC}"
    echo "Output directories:"
    for lang in "${LANG_ARRAY[@]}"; do
        if [[ -d "build/html/$lang" ]]; then
            size=$(du -sh "build/html/$lang" 2>/dev/null | cut -f1)
            echo -e "  build/html/$lang ${CYAN}($size)${NC}"
        fi
    done
fi

# Build PDF in parallel
if [[ "$BUILD_PDF" == true ]]; then
    print_header "Building PDF Documentation (Parallel)"

    if command -v parallel &> /dev/null; then
        printf '%s\n' "${LANG_ARRAY[@]}" | parallel -j "$JOBS" --progress build_language {} pdf
    else
        printf '%s\n' "${LANG_ARRAY[@]}" | xargs -P "$JOBS" -I {} bash -c 'build_language "$@"' _ {} pdf
    fi

    # Summary
    echo ""
    echo -e "${GREEN}PDF builds completed${NC}"
    echo "Output directories:"
    for lang in "${LANG_ARRAY[@]}"; do
        if [[ -d "build/pdf/$lang" ]]; then
            count=$(find "build/pdf/$lang" -name "*.pdf" 2>/dev/null | wc -l)
            echo -e "  build/pdf/$lang ${CYAN}($count PDFs)${NC}"
        fi
    done
fi

# Final summary
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
MINUTES=$((DURATION / 60))
SECONDS=$((DURATION % 60))

print_header "Build Complete"

echo -e "Total time: ${GREEN}${MINUTES}m ${SECONDS}s${NC}"
echo -e "Languages built: ${GREEN}${#LANG_ARRAY[@]}${NC}"
echo ""

# Show any failures
FAILED=()
for lang in "${LANG_ARRAY[@]}"; do
    for format in html pdf; do
        log=$(log_file "${lang}_${format}")
        if [[ -f "$log" ]] && grep -q "error\|Error\|ERROR" "$log" 2>/dev/null; then
            FAILED+=("$lang ($format)")
        fi
    done
done

if [[ ${#FAILED[@]} -gt 0 ]]; then
    echo -e "${RED}Failed builds:${NC}"
    for fail in "${FAILED[@]}"; do
        echo -e "  ${RED}✗ $fail${NC}"
    done
    echo ""
    echo "Check logs in build/logs/ for details"
fi
