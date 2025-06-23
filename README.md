# Clean & Minimalist Vim Configuration

A clean, modern, and minimalist Vim configuration designed for developers who want a powerful yet simple editing experience.

## ✨ Features

- **Clean & Minimalist**: Focus on essential features without bloat
- **Easy Installation**: One-command setup with automatic plugin installation
- **Smart Cleanup**: Automatically detects and removes old configurations
- **Modern Package Manager**: Uses vim-plug for easy plugin management
- **Beautiful UI**: Gruvbox color scheme with airline status bar
- **Fuzzy Finding**: Fast file and content search with FZF
- **Git Integration**: Built-in Git support with visual indicators
- **Smart Indentation**: Automatic indentation guides and smart indenting
- **Essential Plugins**: Carefully selected plugins for productivity

## 🚀 Quick Installation

### Option 1: Automatic Installation (Recommended)

```bash
# Clone this repository
git clone <your-repo-url>
cd vimconfig

# Run the installer (automatically cleans old configs)
chmod +x install.sh
./install.sh
```

The installer will:
- ✅ Check for existing Vim configurations
- ✅ Create backups of old configurations
- ✅ Remove old configurations (with your permission)
- ✅ Install the new clean configuration
- ✅ Set up vim-plug package manager
- ✅ Install FZF for fuzzy finding

### Option 2: Manual Cleanup First

If you want to clean up old configurations separately:

```bash
# Run the cleanup tool
chmod +x cleanup.sh
./cleanup.sh
```

Then install the new configuration:

```bash
# Run the installer
./install.sh
```

### Option 3: Manual Installation

```bash
# Copy the configuration
cp .vimrc ~/.vimrc

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create necessary directories
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo
```

## 🧹 Cleanup Tools

### Automatic Cleanup (During Installation)
The `install.sh` script automatically detects and offers to remove:
- `~/.vimrc` and related files
- `~/.vim/` directory
- `~/.config/nvim/` (Neovim configs)
- `~/.nvim/` (Neovim configs)
- `~/.viminfo` and other Vim files
- Previous backup directories

### Standalone Cleanup Tool
The `cleanup.sh` script provides more control:

```bash
./cleanup.sh
```

Options:
1. **Remove all configurations** (with backup)
2. **Remove specific configurations** (selective)
3. **Create backups only** (don't remove)
4. **Cancel** (do nothing)

### Backup Locations
All backups are stored in:
```
~/.vim_backup_YYYYMMDD_HHMMSS/
```

You can restore configurations later if needed.

## 📦 Included Plugins

| Plugin | Purpose |
|--------|---------|
| **vim-plug** | Package manager |
| **gruvbox** | Beautiful color scheme |
| **nerdtree** | File explorer |
| **fzf** | Fuzzy finder |
| **vim-fugitive** | Git integration |
| **vim-airline** | Status line |
| **vim-commentary** | Easy commenting |
| **vim-surround** | Surround text with brackets/quotes |
| **auto-pairs** | Auto-close brackets/quotes |
| **vim-indent-guides** | Visual indent guides |
| **vim-gitgutter** | Git change indicators |
| **vim-polyglot** | Enhanced syntax highlighting |

## ⌨️ Key Mappings

### Leader Key
The leader key is set to `<Space>` for easy access.

### File Operations
- `<Space>w` - Quick save
- `<Space>q` - Quick quit
- `<Space>n` - Toggle file explorer (NERDTree)

### Navigation
- `<Space>f` - Fuzzy find files
- `<Space>g` - Fuzzy find in files
- `<Ctrl-h/j/k/l>` - Move between windows
- `<Space><` / `<Space>>` - Resize windows

### Search
- `<Space>h` - Toggle search highlighting
- `/` - Search forward
- `?` - Search backward
- `n` - Next search result
- `N` - Previous search result

### Plugin Commands
- `:PlugInstall` - Install plugins
- `:PlugUpdate` - Update plugins
- `:PlugClean` - Remove unused plugins
- `:NERDTreeToggle` - Toggle file explorer
- `:Files` - Fuzzy find files
- `:Rg` - Search in files

## 🎨 Customization

### Color Scheme
The configuration uses the Gruvbox color scheme. You can change it by modifying the colorscheme line in `.vimrc`:

```vim
colorscheme gruvbox
```

### Adding Plugins
To add new plugins, add them to the plugin section in `.vimrc`:

```vim
call plug#begin('~/.vim/plugged')

" Your new plugin
Plug 'username/plugin-name'

call plug#end()
```

Then run `:PlugInstall` to install the new plugin.

### Key Mappings
You can customize key mappings by adding them to the "Key Mappings" section in `.vimrc`.

## 🔧 Plugin Management

### Installing Plugins
1. Add plugins to `.vimrc` in the `call plug#begin()` section
2. Run `:PlugInstall` in Vim
3. Restart Vim

### Updating Plugins
```vim
:PlugUpdate
```

### Removing Plugins
1. Remove the plugin line from `.vimrc`
2. Run `:PlugClean`
3. Restart Vim

## 📁 Directory Structure

```
~/.vim/
├── autoload/          # vim-plug and other autoload scripts
├── plugged/           # Installed plugins
├── backup/            # Backup files
├── swap/              # Swap files
└── undo/              # Undo files
```

## 🐛 Troubleshooting

### Plugins Not Loading
1. Make sure vim-plug is installed: `ls ~/.vim/autoload/plug.vim`
2. Run `:PlugInstall` to install missing plugins
3. Restart Vim

### FZF Not Working
1. Install FZF: `brew install fzf` (macOS) or `sudo apt-get install fzf` (Ubuntu)
2. Restart Vim

### Color Scheme Issues
1. Make sure the plugin is installed: `:PlugInstall`
2. Check if your terminal supports 256 colors
3. Try a different color scheme

### Performance Issues
1. Remove unused plugins from `.vimrc`
2. Run `:PlugClean` to remove unused plugin files
3. Check for large files in your project

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [vim-plug](https://github.com/junegunn/vim-plug) - Excellent package manager
- [Gruvbox](https://github.com/morhetz/gruvbox) - Beautiful color scheme
- [FZF](https://github.com/junegunn/fzf) - Fast fuzzy finder
- All the plugin authors who make Vim awesome!

---

**Happy coding! 🚀** 