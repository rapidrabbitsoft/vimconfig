#!/bin/bash
# Vim Configuration - Quick Install
# Usage: curl -fsSL https://raw.githubusercontent.com/rapidrabbitsoft/vimconfig/main/quick-install.sh | bash

echo "🚀 Installing Vim Configuration..."
[ ! -x "$(command -v vim)" ] && echo "❌ Vim not found. Install vim first." && exit 1

# Download and install
curl -fsSL https://raw.githubusercontent.com/rapidrabbitsoft/vimconfig/main/.vimrc -o ~/.vimrc
curl -fsSL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim --create-dirs
mkdir -p ~/.vim/{plugged,backup,swap,undo}

# Install FZF if available
command -v brew &> /dev/null && brew install fzf 2>/dev/null || true

echo "✅ Installation complete!"
echo "📖 Next: vim → :PlugInstall → restart vim"
echo "🔗 Docs: https://github.com/rapidrabbitsoft/vimconfig" 