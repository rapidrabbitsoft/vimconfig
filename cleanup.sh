#!/bin/bash

# ============================================================================
# Vim Configuration Cleanup Script
# ============================================================================

echo "🧹 Vim Configuration Cleanup Tool"

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
    "~/.vimrc.backup.*"
    "~/.vim_backup_*"
)

print_status "Scanning for Vim configurations..."

# Check for existing configurations
found_configs=()
for config in "${vim_configs[@]}"; do
    # Expand the glob pattern
    for expanded_config in $config; do
        if [ -e "$expanded_config" ]; then
            found_configs+=("$expanded_config")
        fi
    done
done

# Show found configurations
if [ ${#found_configs[@]} -gt 0 ]; then
    print_warning "Found existing Vim configurations:"
    for config in "${found_configs[@]}"; do
        if [ -d "$config" ]; then
            echo "  📁 $config (directory)"
        else
            echo "  📄 $config (file)"
        fi
    done
    echo ""
    
    echo "Options:"
    echo "1. Remove all configurations (with backup)"
    echo "2. Remove only specific configurations"
    echo "3. Just create backups (don't remove)"
    echo "4. Cancel"
    echo ""
    
    read -p "Choose an option (1-4): " choice
    
    case $choice in
        1)
            if confirm "Remove ALL existing Vim configurations? (This will create backups)"; then
                print_status "Creating backups and removing all configurations..."
                
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
                
                print_success "All configurations backed up to: $backup_dir"
                echo "You can restore them later if needed."
            else
                print_status "Cleanup cancelled."
            fi
            ;;
        2)
            echo ""
            echo "Select configurations to remove (enter numbers separated by spaces):"
            for i in "${!found_configs[@]}"; do
                echo "  $((i+1)). ${found_configs[$i]}"
            done
            echo ""
            read -p "Enter selection: " selections
            
            # Create backup directory
            backup_dir="$HOME/.vim_backup_$(date +%Y%m%d_%H%M%S)"
            mkdir -p "$backup_dir"
            
            # Process selections
            for selection in $selections; do
                index=$((selection-1))
                if [ $index -ge 0 ] && [ $index -lt ${#found_configs[@]} ]; then
                    config="${found_configs[$index]}"
                    if confirm "Remove $config?"; then
                        print_status "Backing up and removing: $config"
                        
                        if [ -d "$config" ]; then
                            cp -r "$config" "$backup_dir/"
                            rm -rf "$config"
                        else
                            cp "$config" "$backup_dir/"
                            rm "$config"
                        fi
                        
                        print_success "Removed: $config"
                    fi
                fi
            done
            
            print_success "Selected configurations backed up to: $backup_dir"
            ;;
        3)
            print_status "Creating backups only..."
            
            # Create backup directory
            backup_dir="$HOME/.vim_backup_$(date +%Y%m%d_%H%M%S)"
            mkdir -p "$backup_dir"
            
            # Backup each configuration
            for config in "${found_configs[@]}"; do
                if [ -e "$config" ]; then
                    print_status "Backing up: $config"
                    
                    if [ -d "$config" ]; then
                        cp -r "$config" "$backup_dir/"
                    else
                        cp "$config" "$backup_dir/"
                    fi
                    
                    print_success "Backed up: $config"
                fi
            done
            
            print_success "All configurations backed up to: $backup_dir"
            ;;
        4)
            print_status "Cleanup cancelled."
            ;;
        *)
            print_error "Invalid option. Cleanup cancelled."
            ;;
    esac
else
    print_success "No existing Vim configurations found. Nothing to clean up."
fi

echo ""
print_status "Cleanup complete!" 