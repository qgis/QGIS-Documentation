#!/usr/bin/env bash

set -e

# Activate development configuration
echo dev >environment.txt

function dev-help {
    echo "USAGE:"
    echo
    echo "- Get list of available hosts:"
    echo
    echo "     nix eval .#all-hosts"
    echo
    echo "- Run host in VM:"
    echo
    echo "     nix run .#<hostname>-vm"
    echo "     (set '--option sandbox relaxed --builders \"\"' for Django hosts)"
    echo
    echo "- Run test:"
    echo
    echo "     nix build .#checks.x86_64-linux.<hostname>"
    echo "     (set '--option sandbox relaxed --builders \"\"' for Django hosts)"
    echo
    echo "- Launch interactive test environment:"
    echo
    echo "     nix run .#checks.x86_64-linux.<hostname>.driverInteractive -- --interactive"
    echo "     start_all()"
}

function setup_gum {
    # Choose
    export GUM_CHOOSE_CURSOR_FOREGROUND="#F1C069"
    export GUM_CHOOSE_HEADER_FOREGROUND="#F1C069"
    export GUM_CHOOSE_ITEM_FOREGROUND="#F1C069"
    export GUM_CHOOSE_SELECTED_FOREGROUND="#F1C069"
    export GUM_CHOOSE_HEIGHT=20
    export GUM_CHOOSE_CURSOR="👉️"
    export GUM_CHOOSE_HEADER="Choose one:"
    export GUM_CHOOSE_CURSOR_PREFIX="❓️"
    export GUM_CHOOSE_SELECTED_PREFIX="👍️"
    export GUM_CHOOSE_UNSELECTED_PREFIX="⛔️"
    export GUM_CHOOSE_SELECTED=""
    export GUM_CHOOSE_TIMEOUT=30
    # Style
    export FOREGROUND="#F1C069"
    export BACKGROUND="#1F1F1F"
    export BORDER="rounded"
    export BORDER_BACKGROUND="#1F1F1F"
    export BORDER_FOREGROUND="#F1C069"
    export HEIGHT=3
    export WIDTH=80
    export MARGIN=1
    export PADDING=2
    # Confirm
    export GUM_CONFIRM_PROMPT_FOREGROUND="#F1C069"
    export GUM_CONFIRM_SELECTED_FOREGROUND="#F1C069"
    export GUM_CONFIRM_UNSELECTED_FOREGROUND="#F1C069"
    export GUM_CONFIRM_TIMEOUT=30s
    # Input
    export GUM_INPUT_PLACEHOLDER="-----------"
    export GUM_INPUT_PROMPT=">"
    export GUM_INPUT_CURSOR_MODE="blink"
    export GUM_INPUT_WIDTH=40
    export GUM_INPUT_HEADER="💬"
    export GUM_INPUT_TIMEOUT=30s
    export GUM_INPUT_PROMPT_FOREGROUND="#F1C069"
    export GUM_INPUT_CURSOR_FOREGROUND="#F1C069"
    export GUM_INPUT_HEADER_FOREGROUND="#F1C069"
    # Spin
    export GUM_SPIN_SPINNER_FOREGROUND="#F1C069"
    export GUM_SPIN_TITLE_FOREGROUND="#F1C069"
    # Table
    export GUM_TABLE_BORDER_FOREGROUND="#F1C069"
    export GUM_TABLE_CELL_FOREGROUND="#F1C069"
    export GUM_TABLE_HEADER_FOREGROUND="#F1C069"
    export GUM_TABLE_SELECTED_FOREGROUND="#F1C069"
    # Filter
    export GUM_FILTER_INDICATOR="👉️"
    export GUM_FILTER_SELECTED_PREFIX="💎"
    export GUM_FILTER_UNSELECTED_PREFIX=""
    export GUM_FILTER_HEADER="Chooser"
    export GUM_FILTER_PLACEHOLDER="."
    export GUM_FILTER_PROMPT="Select an option:"
    export GUM_FILTER_TIMEOUT=30s
    export GUM_FILTER_INDICATOR_FOREGROUND="#F1C069"
    export GUM_FILTER_SELECTED_PREFIX_FOREGROUND="#F1C069"
    export GUM_FILTER_UNSELECTED_PREFIX_FOREGROUND="#F8E3BD"
    export GUM_FILTER_HEADER_FOREGROUND="#F1C069"
    export GUM_FILTER_TEXT_FOREGROUND="#F1C069"
    export GUM_FILTER_CURSOR_TEXT_FOREGROUND="#F1C069"
    export GUM_FILTER_MATCH_FOREGROUND="#F1C069"
    export GUM_FILTER_PROMPT_FOREGROUND="#F1C069"
}

function prompt_to_continue {
    echo ""
    echo "Press any key to continue..."
    read -n 1 -s -r keystroke
    echo "$keystroke Continuing..."
    clear
}

function main_menu {
    gum style "🏠️ QGIS NixOS :: Main Menu"
    choice=$(
        gum choose \
            "🐚 Bash shell" \
            "🐠 Fish shell" \
            "🚀 List hosts" \
            "💻️ Run host in VM" \
            "💻️ Run test" \
            "💻️ Run interactive test" \
            "📃 VSCodium IDE" \
            "🎬️ Make history video" \
            "💡 About" \
            "🛑 Exit"
    )

    case $choice in
        "🐚 Bash shell")
            echo "Dropping you to a bash shell, you can return to this menu at any time by typing:"
            echo ""
            echo "exit"
            echo ""
            dev-help
            /usr/bin/env bash
            main_menu
            ;;
        "🐠 Fish shell")
            echo "Dropping you to a fish shell, you can return to this menu at any time by typing:"
            echo ""
            echo "exit"
            echo ""
            dev-help
            /usr/bin/env fish
            main_menu
            ;;
        "🚀 List hosts")
            hosts=$(nix eval .#all-hosts --json | jq -r '.[]')
            gum style --border double --padding "1 2" --margin "1" \
                --align center --width 50 "Available hosts"
            echo "$hosts" | gum style --padding "0 2" --align left
            prompt_to_continue
            main_menu
            ;;
        "💻️ Run host in VM")
            gum style "💻️ Run host in VM"
            selected_host=$(gum filter "Select a host:" $(nix eval .#all-hosts --json | jq -r '.[]'))
            nix run --option sandbox relaxed --builders "" .#"$selected_host"-vm
            prompt_to_continue
            main_menu
            ;;
        "💻️ Run test")
            gum style "💻️ Run test"
            selected_host=$(gum filter "Select a host:" $(nix eval .#all-hosts --json | jq -r '.[]'))
            nix build --option sandbox relaxed --builders "" .#checks.x86_64-linux."$selected_host"
            prompt_to_continue
            main_menu
            ;;
        "💻️ Run interactive test")
            gum style "🖥️ Run interactive test"
            selected_host=$(gum filter "Select a host:" $(nix eval .#all-hosts --json | jq -r '.[]'))
            nix run --option sandbox relaxed --builders "" .#checks.x86_64-linux."$selected_host".driverInteractive -- --interactive
            # start_all()
            prompt_to_continue
            main_menu
            ;;
        "📃 VSCodium IDE")
            echo "Opening a codium (free version of VSCode) session.:"
            echo ""
            prompt_to_continue
            ./flake/vscode.sh &
            main_menu
            ;;
        "🎬️ Make history video")
            echo "🎬️ Making a video of your history."
            gource --seconds-per-day 0.1 --time-scale 4 --auto-skip-seconds 1 \
                --key --file-idle-time 0 --max-files 0 --max-file-lag 0.1 \
                --title "Project History" --bloom-multiplier 0.5 --bloom-intensity 0.5 \
                --background 000000 --hide filenames,mouse,progress \
                --output-ppm-stream - \
                | ffmpeg -probesize 50M -analyzeduration 100M -y -r 60 -f image2pipe -vcodec ppm -i - \
                    -vf scale=1280:-1 -vcodec libx264 -preset fast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 history.mp4
            # Convert to animated gif
            ffmpeg -i history.mp4 -vf "fps=10,scale=1280:-1:flags=lanczos" -loop 0 img/history.gif
            prompt_to_continue
            main_menu
            ;;
        "💡 About")
            # Convert the image to ASCII and pass it directly to gum
            # Generate ASCII art
            chafa ./scripts/qgis-icon-128x128.png --size=10x10

            # Display ASCII art and message using gum
            $(echo "$QGIS_ASCII")
            echo "QGIS System Administration scripts"
            echo "(c) QGIS.org, 2024, 2025"
            echo "Credits: Lova Andriarimalala, Ivan Mincik, Tim Sutton"
            prompt_to_continue
            main_menu
            ;;
        "🛑 Exit")
            echo "  Exiting, you can return to this menu at any time by typing:"
            echo ""
            echo "nix develop"
            prompt_to_continue
            exit 1
            ;;
        *) echo "Invalid choice. Please select again." ;;
    esac
}

setup_gum
main_menu
