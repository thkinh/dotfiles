#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles/config"

echo "Restoring dotfiles..."

# Bash
ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/bash/.bash_logout" "$HOME/.bash_logout"
ln -sf "$DOTFILES_DIR/bash/.profile" "$HOME/.profile"

# Vim
ln -sf "$DOTFILES_DIR/vim/.vim" "$HOME/.vim"
ln -sf "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

# Git
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"


echo "Done! You may want to reload your shell or restart the system."
