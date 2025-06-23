#!/bin/bash

# ============================================================================
# Vim Configuration - One-Line Installer
# ============================================================================
# 
# Usage: curl -fsSL https://raw.githubusercontent.com/rapidrabbitsoft/vimconfig/main/install-vim.sh | bash
# Or: wget -qO- https://raw.githubusercontent.com/rapidrabbitsoft/vimconfig/main/install-vim.sh | bash

set -e

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

echo "🚀 Installing Clean & Minimalist Vim Configuration..."
echo "Repository: https://github.com/rapidrabbitsoft/vimconfig"
echo ""

# Check if Vim is installed
if ! command -v vim &> /dev/null; then
    print_error "Vim is not installed. Please install Vim first."
    echo "On macOS: brew install vim"
    echo "On Ubuntu/Debian: sudo apt-get install vim"
    echo "On CentOS/RHEL: sudo yum install vim"
    exit 1
fi

print_success "Vim is installed: $(vim --version | head -n1)"

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

print_status "Downloading Vim configuration..."

# Download the .vimrc file
curl -fsSL -o .vimrc https://raw.githubusercontent.com/rapidrabbitsoft/vimconfig/main/.vimrc

# Download the install script for additional setup
curl -fsSL -o install.sh https://raw.githubusercontent.com/rapidrabbitsoft/vimconfig/main/install.sh

# Make install script executable
chmod +x install.sh

# Run the full installation
print_status "Running installation..."
./install.sh

# Clean up
cd - > /dev/null
rm -rf "$TEMP_DIR"

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
echo "Documentation: https://github.com/rapidrabbitsoft/vimconfig"
echo "Enjoy your new Vim setup! 🚀" 