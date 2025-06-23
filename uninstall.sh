#!/bin/bash

# ============================================================================
# Vim Configuration Uninstaller
# ============================================================================

echo "🗑️  Uninstalling Vim Configuration..."

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

# Check if .vimrc exists
if [ ! -f ~/.vimrc ]; then
    print_warning "No .vimrc found. Nothing to uninstall."
    exit 0
fi

# Show what will be removed
echo ""
echo "The following will be removed:"
echo "  - ~/.vimrc"
echo "  - ~/.vim/plugged/ (all plugins)"
echo "  - ~/.vim/autoload/plug.vim (vim-plug)"
echo ""

if ! confirm "Are you sure you want to uninstall the Vim configuration?"; then
    print_status "Uninstallation cancelled."
    exit 0
fi

# Backup .vimrc before removal
print_status "Creating backup of current .vimrc..."
cp ~/.vimrc ~/.vimrc.backup.$(date +%Y%m%d_%H%M%S)
print_success "Backup created"

# Remove .vimrc
print_status "Removing .vimrc..."
rm ~/.vimrc
print_success ".vimrc removed"

# Remove vim-plug
if [ -f ~/.vim/autoload/plug.vim ]; then
    print_status "Removing vim-plug..."
    rm ~/.vim/autoload/plug.vim
    print_success "vim-plug removed"
fi

# Remove plugins directory
if [ -d ~/.vim/plugged ]; then
    print_status "Removing plugins..."
    rm -rf ~/.vim/plugged
    print_success "Plugins removed"
fi

# Remove other vim directories if they're empty
for dir in ~/.vim/backup ~/.vim/swap ~/.vim/undo; do
    if [ -d "$dir" ] && [ -z "$(ls -A $dir)" ]; then
        print_status "Removing empty directory: $dir"
        rmdir "$dir"
    fi
done

# Remove .vim directory if it's empty
if [ -d ~/.vim ] && [ -z "$(ls -A ~/.vim)" ]; then
    print_status "Removing empty .vim directory..."
    rmdir ~/.vim
fi

print_success "Uninstallation complete! 🎉"
echo ""
echo "Your Vim configuration has been removed."
echo "A backup of your .vimrc was created before removal."
echo ""
echo "To restore your previous configuration, copy the backup:"
echo "  cp ~/.vimrc.backup.* ~/.vimrc" 