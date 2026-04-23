#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR=$(pwd)

echo "--------------------------------------------------"
echo "Setting up Vim Hard Mode for Codespaces..."
echo "--------------------------------------------------"

# Remove any existing .vimrc to prevent conflicts
rm -rf ~/.vimrc

# Create a symbolic link
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc

if [ -f ~/.vimrc ]; then
    echo "SUCCESS: .vimrc linked to home directory."
else
    echo "ERROR: Linking failed."
    exit 1
fi

echo "Setup complete! Open Vim and run :PlugInstall if needed."