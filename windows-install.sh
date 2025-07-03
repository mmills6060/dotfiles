#!/bin/bash

# Windows App Installation Script
# This script installs all the apps listed in the readme.md file using Windows Package Manager (winget)

echo "🚀 Starting Windows App Installation Script"
echo "=========================================="

# Check if running on Windows
if [[ "$OSTYPE" != "msys" && "$OSTYPE" != "cygwin" ]]; then
    echo "❌ This script is designed for Windows. Please run it in Git Bash, WSL, or PowerShell."
    exit 1
fi

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if winget is available
check_winget() {
    if command_exists winget; then
        echo "✅ Windows Package Manager (winget) is available"
        return 0
    else
        echo "❌ Windows Package Manager (winget) is not available"
        echo "Please install it from the Microsoft Store or enable it in Windows Features"
        return 1
    fi
}

# Function to install an app using winget
install_app() {
    local app_name=$1
    local package_id=$2
    
    if ! command_exists winget; then
        echo "❌ winget is not available. Cannot install $app_name"
        return 1
    fi
    
    echo "📥 Installing $app_name..."
    if winget install --id "$package_id" --accept-source-agreements --accept-package-agreements; then
        echo "✅ $app_name installed successfully!"
    else
        echo "❌ Failed to install $app_name"
    fi
}

# Function to install Node.js
install_nodejs() {
    if ! command_exists winget; then
        echo "❌ winget is not available. Cannot install Node.js"
        return 1
    fi
    
    echo "📥 Installing Node.js..."
    if winget install --id OpenJS.NodeJS --accept-source-agreements --accept-package-agreements; then
        echo "✅ Node.js installed successfully!"
        
        # Refresh environment variables
        export PATH="$PATH:/c/Program Files/nodejs"
        
        # Get versions
        if command_exists node; then
            echo "📊 Node.js version: $(node --version)"
        fi
        if command_exists npm; then
            echo "📦 npm version: $(npm --version)"
        fi
    else
        echo "❌ Failed to install Node.js"
    fi
}

# Function to install WSL
install_wsl() {
    echo "📥 Installing Windows Subsystem for Linux (WSL)..."
    if ! command_exists wsl; then
        if winget install --id Microsoft.WSL --accept-source-agreements --accept-package-agreements; then
            echo "✅ WSL installed successfully!"
            echo "Please restart your computer to complete the WSL installation."
        else
            echo "❌ Failed to install WSL via winget, trying alternative method..."
            powershell -Command "wsl --install"
            echo "✅ WSL installation initiated. Please restart your computer to complete the installation."
        fi
    else
        echo "✅ WSL is already installed"
    fi
}

# Main installation process
main() {
    echo "🔍 Checking system requirements..."
    
    # Check if winget is available
    if ! check_winget; then
        echo "❌ Cannot continue without winget. Please install it first."
        exit 1
    fi
    
    echo ""
    echo "📋 Installing applications..."
    echo "============================"
    
    # Install GUI applications
    install_app "Google Chrome" "Google.Chrome"
    install_app "Cursor" "Cursor.Cursor"
    install_app "Visual Studio Code" "Microsoft.VisualStudioCode"
    install_app "Spotify" "Spotify.Spotify"
    install_app "Chrome Remote Desktop" "Google.ChromeRemoteDesktop"
    install_app "Alacritty" "Alacritty.Alacritty"
    
    # Install Node.js
    install_nodejs
    
    # Install WSL
    install_wsl
    
    echo ""
    echo "📋 Installing CLI Tools..."
    echo "========================="
    
    # Install CLI tools with winget
    install_app "Git" "Git.Git"
    install_app "GitHub CLI" "GitHub.cli"
    install_app "Yarn" "Yarn.Yarn"
    install_app "Neovim" "Neovim.Neovim"
    
    echo ""
    echo "📋 Installing additional CLI tools..."
    echo "===================================="
    
    # Install fzf (fuzzy finder)
    echo "📥 Installing fzf..."
    if winget install --id junegunn.fzf --accept-source-agreements --accept-package-agreements; then
        echo "✅ fzf installed successfully!"
    else
        echo "❌ Failed to install fzf"
    fi
    
    # Install neofetch
    echo "📥 Installing neofetch..."
    if winget install --id neofetch.neofetch --accept-source-agreements --accept-package-agreements; then
        echo "✅ neofetch installed successfully!"
    else
        echo "❌ Failed to install neofetch"
    fi
    
    # Install lazygit
    echo "📥 Installing lazygit..."
    if winget install --id JesseDuffield.LazyGit --accept-source-agreements --accept-package-agreements; then
        echo "✅ lazygit installed successfully!"
    else
        echo "❌ Failed to install lazygit"
    fi
    
    # Install poetry
    echo "📥 Installing poetry..."
    if winget install --id Python.Poetry --accept-source-agreements --accept-package-agreements; then
        echo "✅ poetry installed successfully!"
    else
        echo "❌ Failed to install poetry"
    fi
    
    echo ""
    echo "🎉 Installation completed!"
    echo "========================="
    
    # Configure applications with dotfiles
    echo ""
    echo "🔧 Configuring applications with dotfiles..."
    echo "============================================"
    
    # Get the current directory (dotfiles location)
    DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    
    # Create necessary directories
    echo "📁 Creating configuration directories..."
    mkdir -p "$HOME/.config/nvim"
    mkdir -p "$HOME/.config/tmux"
    mkdir -p "$HOME/.config/alacritty"
    
    # Configure Neovim
    echo "📝 Configuring Neovim..."
    if [ -f "$DOTFILES_DIR/nvim/init.lua" ]; then
        cp "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/"
        echo "✅ Neovim configuration copied"
    else
        echo "❌ Neovim init.lua not found in dotfiles"
    fi
    
    # Configure tmux
    echo "📝 Configuring tmux..."
    if [ -f "$DOTFILES_DIR/tmux/.tmux.conf" ]; then
        cp "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
        echo "✅ tmux configuration copied"
    else
        echo "❌ tmux configuration not found in dotfiles"
    fi
    
    # Configure Alacritty
    echo "📝 Configuring Alacritty..."
    if [ -f "$DOTFILES_DIR/alacritty/alacritty.yml" ]; then
        cp "$DOTFILES_DIR/alacritty/alacritty.yml" "$HOME/.config/alacritty/"
        echo "✅ Alacritty configuration copied"
    else
        echo "❌ Alacritty configuration not found in dotfiles"
    fi
    
    # Copy Alacritty themes if they exist
    if [ -d "$DOTFILES_DIR/alacritty/themes" ]; then
        cp -r "$DOTFILES_DIR/alacritty/themes" "$HOME/.config/alacritty/"
        echo "✅ Alacritty themes copied"
    fi
    
    # Install Neovim plugins
    echo "📦 Installing Neovim plugins..."
    if command_exists nvim; then
        nvim --headless -c "PackerSync" -c "qa"
        echo "✅ Neovim plugins installed"
    else
        echo "⚠️  Neovim not found, plugins will be installed on first run"
    fi
    
    echo ""
    echo "📝 Post-installation notes:"
    echo "- WSL requires a system restart to complete installation"
    echo "- Some apps may need manual configuration after installation"
    echo "- You may need to sign in to Chrome, Spotify, and Cursor"
    echo "- Neovim plugins have been installed automatically"
    echo ""
    echo "🔧 Additional setup recommendations:"
    echo "- Configure your shell (oh-my-zsh) in WSL"
    echo "- Set up your dotfiles in WSL"
    echo "- Install tmux, ranger, and other Linux-specific tools in WSL"
    echo "- Configure fzf for fuzzy finding"
    echo "- Set up GitHub CLI authentication: gh auth login"
    echo "- Install taskwarrior-tui and gotop in WSL"
    echo "- Test your Neovim setup: nvim --version"
    echo "- Test your tmux setup: tmux new-session -d -s test && tmux kill-session -t test"
    echo "- Test your Alacritty setup: alacritty --version"
}

# Run the main function
main
