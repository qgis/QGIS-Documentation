#!/usr/bin/env bash
#
# Benchmark build performance: single-core vs optimized multi-core
#
# Usage:
#   ./scripts/benchmark_build.sh [options]
#
# Options:
#   --full          Run full benchmark (clean builds, multiple runs)
#   --quick         Quick benchmark (single run each, no clean)
#   --runs N        Number of runs for averaging (default: 3)
#   --lang LANG     Language to build (default: en)
#   --output FILE   Save results to file
#

set -euo pipefail

# Set locale for Sphinx
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Defaults
RUNS=3
LANG="en"
FULL_BENCHMARK=false
QUICK_BENCHMARK=false
OUTPUT_FILE=""
CPU_CORES=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --full)
            FULL_BENCHMARK=true
            shift
            ;;
        --quick)
            QUICK_BENCHMARK=true
            RUNS=1
            shift
            ;;
        --runs)
            RUNS="$2"
            shift 2
            ;;
        --lang)
            LANG="$2"
            shift 2
            ;;
        --output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        --help|-h)
            head -15 "$0" | tail -n +2 | sed 's/^#//'
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            exit 1
            ;;
    esac
done

# Results storage
declare -a SINGLE_CORE_TIMES
declare -a MULTI_CORE_TIMES

print_header() {
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

print_subheader() {
    echo ""
    echo -e "${CYAN}───────────────────────────────────────────────────────────────${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}───────────────────────────────────────────────────────────────${NC}"
}

# Get system info
get_system_info() {
    echo -e "${BOLD}System Information:${NC}"
    echo -e "  CPU Cores:     ${YELLOW}$CPU_CORES${NC}"

    if [[ -f /proc/cpuinfo ]]; then
        cpu_model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)
        echo -e "  CPU Model:     ${YELLOW}$cpu_model${NC}"
    fi

    mem_total=$(free -h 2>/dev/null | awk '/^Mem:/{print $2}' || echo "unknown")
    echo -e "  Total Memory:  ${YELLOW}$mem_total${NC}"

    # Count RST files
    rst_count=$(find docs -name "*.rst" 2>/dev/null | wc -l)
    echo -e "  RST Files:     ${YELLOW}$rst_count${NC}"

    # Count images
    img_count=$(find docs -name "*.png" -o -name "*.jpg" 2>/dev/null | wc -l)
    echo -e "  Image Files:   ${YELLOW}$img_count${NC}"
    echo ""
}

# Clean build directory
clean_build() {
    rm -rf "build/html/$LANG" "build/doctrees" 2>/dev/null || true
}

# Run a timed build - returns only the numeric duration on the last line
run_build() {
    local jobs="$1"
    local label="$2"

    echo -e "  Running: ${CYAN}$label${NC} (SPHINXOPTS=\"-j $jobs\")..." >&2

    local start_time=$(date +%s.%N)

    # Use sphinx-build directly to control parallelism
    # Allow warnings (they don't mean the build failed for benchmarking purposes)
    sphinx-build -b html -j "$jobs" "." "build/html/$LANG" > "build/benchmark_${jobs}.log" 2>&1
    local exit_code=$?

    local end_time=$(date +%s.%N)
    local duration=$(echo "$end_time - $start_time" | bc)

    # Check if build actually produced output (even with warnings)
    if [[ -f "build/html/$LANG/index.html" ]] || grep -q "build finished" "build/benchmark_${jobs}.log" 2>/dev/null; then
        echo -e "  ${GREEN}✓ Completed in ${duration}s${NC}" >&2
        printf "%s" "$duration"
    else
        echo -e "  ${RED}✗ Build failed - check build/benchmark_${jobs}.log${NC}" >&2
        printf "0"
    fi
}

# Calculate statistics
calc_stats() {
    local -n arr=$1
    local sum=0
    local min=${arr[0]}
    local max=${arr[0]}

    for val in "${arr[@]}"; do
        sum=$(echo "$sum + $val" | bc)
        if (( $(echo "$val < $min" | bc -l) )); then
            min=$val
        fi
        if (( $(echo "$val > $max" | bc -l) )); then
            max=$val
        fi
    done

    local avg=$(echo "scale=2; $sum / ${#arr[@]}" | bc)
    echo "$avg $min $max"
}

# Main benchmark
print_header "QGIS Documentation Build Benchmark"

get_system_info

echo -e "${BOLD}Benchmark Configuration:${NC}"
echo -e "  Language:      ${YELLOW}$LANG${NC}"
echo -e "  Runs:          ${YELLOW}$RUNS${NC}"
echo -e "  Mode:          ${YELLOW}$(if $FULL_BENCHMARK; then echo "Full (with clean)"; elif $QUICK_BENCHMARK; then echo "Quick"; else echo "Standard"; fi)${NC}"
echo ""

# Warm-up build (to populate caches)
if [[ "$QUICK_BENCHMARK" != true ]]; then
    print_subheader "Warm-up Build"
    echo "  Running initial build to warm caches..."
    make LANG="$LANG" SPHINXOPTS="-j auto" html > /dev/null 2>&1 || true
fi

# Single-core benchmark
print_subheader "Single-Core Benchmark (baseline)"
for ((i=1; i<=RUNS; i++)); do
    echo -e "\n${BOLD}Run $i of $RUNS${NC}"

    if $FULL_BENCHMARK; then
        clean_build
    fi

    time_taken=$(run_build "1" "Single core (-j 1)")
    SINGLE_CORE_TIMES+=("$time_taken")
done

# Multi-core benchmark
print_subheader "Multi-Core Benchmark (optimized)"
for ((i=1; i<=RUNS; i++)); do
    echo -e "\n${BOLD}Run $i of $RUNS${NC}"

    if $FULL_BENCHMARK; then
        clean_build
    fi

    time_taken=$(run_build "auto" "All cores (-j auto)")
    MULTI_CORE_TIMES+=("$time_taken")
done

# Calculate results
print_header "Results"

read -r single_avg single_min single_max <<< $(calc_stats SINGLE_CORE_TIMES)
read -r multi_avg multi_min multi_max <<< $(calc_stats MULTI_CORE_TIMES)

# Calculate speedup
speedup=$(echo "scale=2; $single_avg / $multi_avg" | bc)
time_saved=$(echo "scale=2; $single_avg - $multi_avg" | bc)
percent_faster=$(echo "scale=1; (1 - $multi_avg / $single_avg) * 100" | bc)

echo -e "${BOLD}Single-Core Build (-j 1):${NC}"
echo -e "  Average:       ${YELLOW}${single_avg}s${NC}"
if [[ $RUNS -gt 1 ]]; then
    echo -e "  Min:           ${single_min}s"
    echo -e "  Max:           ${single_max}s"
fi
echo ""

echo -e "${BOLD}Multi-Core Build (-j auto, $CPU_CORES cores):${NC}"
echo -e "  Average:       ${GREEN}${multi_avg}s${NC}"
if [[ $RUNS -gt 1 ]]; then
    echo -e "  Min:           ${multi_min}s"
    echo -e "  Max:           ${multi_max}s"
fi
echo ""

echo -e "${BOLD}Improvement:${NC}"
echo -e "  Speedup:       ${GREEN}${speedup}x faster${NC}"
echo -e "  Time Saved:    ${GREEN}${time_saved}s${NC}"
echo -e "  Improvement:   ${GREEN}${percent_faster}%${NC}"
echo ""

# Visual comparison
print_subheader "Visual Comparison"

# Normalize to 50 chars max
max_time=$single_avg
bar_scale=$(echo "scale=4; 50 / $max_time" | bc)

single_bar_len=$(echo "scale=0; $single_avg * $bar_scale" | bc | cut -d. -f1)
multi_bar_len=$(echo "scale=0; $multi_avg * $bar_scale" | bc | cut -d. -f1)

single_bar=$(printf '█%.0s' $(seq 1 $single_bar_len))
multi_bar=$(printf '█%.0s' $(seq 1 $multi_bar_len))

echo -e "Single-core: ${RED}${single_bar}${NC} ${single_avg}s"
echo -e "Multi-core:  ${GREEN}${multi_bar}${NC} ${multi_avg}s"
echo ""

# Efficiency calculation
efficiency=$(echo "scale=1; ($speedup / $CPU_CORES) * 100" | bc)
echo -e "${BOLD}Parallel Efficiency:${NC} ${YELLOW}${efficiency}%${NC} (ideal: 100%)"
echo ""

# Save results if requested
if [[ -n "$OUTPUT_FILE" ]]; then
    cat > "$OUTPUT_FILE" << EOF
# QGIS Documentation Build Benchmark Results
# Generated: $(date -Iseconds)

## System
- CPU Cores: $CPU_CORES
- RST Files: $(find docs -name "*.rst" 2>/dev/null | wc -l)
- Language: $LANG
- Runs: $RUNS

## Results

| Metric | Single-Core | Multi-Core |
|--------|-------------|------------|
| Average | ${single_avg}s | ${multi_avg}s |
| Min | ${single_min}s | ${multi_min}s |
| Max | ${single_max}s | ${multi_max}s |

## Improvement
- **Speedup**: ${speedup}x
- **Time Saved**: ${time_saved}s
- **Percent Faster**: ${percent_faster}%
- **Parallel Efficiency**: ${efficiency}%

## Raw Data
Single-core times: ${SINGLE_CORE_TIMES[*]}
Multi-core times: ${MULTI_CORE_TIMES[*]}
EOF
    echo -e "Results saved to: ${CYAN}$OUTPUT_FILE${NC}"
fi

print_header "Benchmark Complete"
