#!/bin/bash

# ============================================================================
# Vim Configuration Installer
# ============================================================================

echo "🚀 Installing Clean & Minimalist Vim Configuration..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to confirm action
confirm() {
    read -p "$1 (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

# Check if Vim is installed
if ! command -v vim &> /dev/null; then
    print_error "Vim is not installed. Please install Vim first."
    echo "On macOS: brew install vim"
    echo "On Ubuntu/Debian: sudo apt-get install vim"
    echo "On CentOS/RHEL: sudo yum install vim"
    exit 1
fi

print_success "Vim is installed: $(vim --version | head -n1)"

# ============================================================================
# Detect and Remove Old Configurations
# ============================================================================

print_status "Checking for existing Vim configurations..."

# List of common Vim configuration files and directories
vim_configs=(
    "~/.vimrc"
    "~/.vim"
    "~/.config/nvim"
    "~/.nvim"
    "~/.viminfo"
    "~/.vimrc.local"
    "~/.vimrc.before"
    "~/.vimrc.after"
    "~/.vim/init.vim"
    "~/.vim/vimrc"
)

# Check for existing configurations
found_configs=()
for config in "${vim_configs[@]}"; do
    if [ -e "$config" ]; then
        found_configs+=("$config")
    fi
done

# Show found configurations
if [ ${#found_configs[@]} -gt 0 ]; then
    print_warning "Found existing Vim configurations:"
    for config in "${found_configs[@]}"; do
        echo "  - $config"
    done
    echo ""
    
    if confirm "Do you want to remove all existing Vim configurations? (This will create backups)"; then
        print_status "Creating backups and removing old configurations..."
        
        # Create backup directory
        backup_dir="$HOME/.vim_backup_$(date +%Y%m%d_%H%M%S)"
        mkdir -p "$backup_dir"
        
        # Backup and remove each configuration
        for config in "${found_configs[@]}"; do
            if [ -e "$config" ]; then
                print_status "Backing up and removing: $config"
                
                # Create backup
                if [ -d "$config" ]; then
                    # It's a directory
                    cp -r "$config" "$backup_dir/"
                    rm -rf "$config"
                else
                    # It's a file
                    cp "$config" "$backup_dir/"
                    rm "$config"
                fi
                
                print_success "Removed: $config"
            fi
        done
        
        print_success "All old configurations backed up to: $backup_dir"
        echo "You can restore them later if needed."
        echo ""
    else
        print_status "Keeping existing configurations. Installation will proceed with new config."
        echo ""
    fi
else
    print_success "No existing Vim configurations found. Clean installation."
fi

# ============================================================================
# Installation
# ============================================================================

# Create necessary directories
print_status "Creating Vim directories..."
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo

# Copy the new .vimrc
print_status "Installing new .vimrc..."
cp .vimrc ~/.vimrc
print_success "Vim configuration installed!"

# Install vim-plug
print_status "Installing vim-plug package manager..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
print_success "vim-plug installed!"

# Install FZF (required for fuzzy finding)
if ! command -v fzf &> /dev/null; then
    print_status "Installing FZF (fuzzy finder)..."
    if command -v brew &> /dev/null; then
        brew install fzf
    elif command -v apt-get &> /dev/null; then
        sudo apt-get install fzf
    elif command -v yum &> /dev/null; then
        sudo yum install fzf
    else
        print_warning "FZF not installed. Please install it manually for fuzzy finding functionality."
        echo "Visit: https://github.com/junegunn/fzf#installation"
    fi
else
    print_success "FZF already installed"
fi

print_success "Installation complete! 🎉"
echo ""
echo "Next steps:"
echo "1. Open Vim: vim"
echo "2. Install plugins: :PlugInstall"
echo "3. Restart Vim to see all features"
echo ""
echo "Key mappings:"
echo "  <Space>w  - Quick save"
echo "  <Space>q  - Quick quit"
echo "  <Space>n  - Toggle file explorer"
echo "  <Space>f  - Fuzzy find files"
echo "  <Space>g  - Fuzzy find in files"
echo "  <Space>h  - Toggle search highlighting"
echo ""
echo "Enjoy your new Vim setup! 🚀" 