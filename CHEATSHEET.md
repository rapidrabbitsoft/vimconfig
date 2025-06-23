# Vim Configuration Cheatsheet

## 🚀 Quick Start
1. Run `./install.sh` to install
2. Open Vim: `vim`
3. Install plugins: `:PlugInstall`
4. Restart Vim

## ⌨️ Essential Key Mappings

### Leader Key: `<Space>`

| Key | Action |
|-----|--------|
| `<Space>w` | Quick save |
| `<Space>q` | Quick quit |
| `<Space>n` | Toggle file explorer |
| `<Space>f` | Fuzzy find files |
| `<Space>g` | Fuzzy find in files |
| `<Space>h` | Toggle search highlighting |
| `<Space><` | Resize window smaller |
| `<Space>>` | Resize window larger |

### Window Navigation
| Key | Action |
|-----|--------|
| `<Ctrl-h>` | Move to left window |
| `<Ctrl-j>` | Move to bottom window |
| `<Ctrl-k>` | Move to top window |
| `<Ctrl-l>` | Move to right window |

### Search & Navigation
| Key | Action |
|-----|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `*` | Search for word under cursor |
| `#` | Search for word under cursor (backward) |

## 🔌 Plugin Commands

### Package Management
| Command | Action |
|---------|--------|
| `:PlugInstall` | Install plugins |
| `:PlugUpdate` | Update plugins |
| `:PlugClean` | Remove unused plugins |
| `:PlugStatus` | Show plugin status |

### File Explorer (NERDTree)
| Command | Action |
|---------|--------|
| `:NERDTreeToggle` | Toggle file explorer |
| `:NERDTree` | Open file explorer |
| `:NERDTreeClose` | Close file explorer |

### Fuzzy Finder (FZF)
| Command | Action |
|---------|--------|
| `:Files` | Find files |
| `:Rg` | Search in files |
| `:Buffers` | Switch buffers |
| `:History` | Command history |

### Git (Fugitive)
| Command | Action |
|---------|--------|
| `:Gstatus` | Git status |
| `:Gdiff` | Git diff |
| `:Gblame` | Git blame |
| `:Glog` | Git log |

## 🎨 Visual Features

### Indent Guides
- Automatically shows indent guides
- Helps visualize code structure

### Git Gutter
- Shows Git changes in the gutter
- `+` for added lines
- `-` for deleted lines
- `~` for modified lines

### Status Line (Airline)
- Shows current mode, file name, line info
- Git branch information
- File encoding and type

## 📝 Text Editing

### Commentary
| Key | Action |
|-----|--------|
| `gcc` | Comment/uncomment line |
| `gc{motion}` | Comment/uncomment motion |

### Surround
| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Surround motion with char |
| `ds{char}` | Delete surrounding char |
| `cs{old}{new}` | Change surrounding char |

### Auto Pairs
- Automatically closes brackets, quotes, etc.
- Press `<Ctrl-v>` to insert literal character

## 🎯 Pro Tips

### Quick File Operations
```vim
:edit filename    " Open file
:saveas filename  " Save as new file
:split filename   " Split and open file
:vsplit filename  " Vertical split and open file
```

### Buffer Management
```vim
:ls               " List buffers
:bnext            " Next buffer
:bprev            " Previous buffer
:bd               " Delete buffer
```

### Window Management
```vim
:sp               " Split horizontally
:vsp              " Split vertically
:close            " Close window
:only             " Close other windows
```

### Tab Management
```vim
:tabnew           " New tab
:tabclose         " Close tab
:tabnext          " Next tab
:tabprev          " Previous tab
```

## 🔧 Customization

### Add New Plugin
1. Add to `.vimrc`:
   ```vim
   Plug 'username/plugin-name'
   ```
2. Run `:PlugInstall`

### Custom Key Mapping
Add to `.vimrc`:
```vim
nnoremap <leader>c :SomeCommand<CR>
```

### Change Color Scheme
```vim
colorscheme scheme-name
```

## 🐛 Common Issues

### Plugin Not Working
1. Run `:PlugInstall`
2. Restart Vim
3. Check plugin documentation

### FZF Not Found
```bash
# macOS
brew install fzf

# Ubuntu/Debian
sudo apt-get install fzf

# CentOS/RHEL
sudo yum install fzf
```

### Performance Issues
1. Remove unused plugins
2. Run `:PlugClean`
3. Check for large files

---

**Remember**: The leader key is `<Space>` and most custom commands start with it! 