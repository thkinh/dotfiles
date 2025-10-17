#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

echo "Restoring dotfiles..."

# Bash
ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/bash/.bash_logout" "$HOME/.bash_logout"
ln -sf "$DOTFILES_DIR/bash/.profile" "$HOME/.profile"

# Vim
if [ -d "$HOME/.vim" ] || [ -L "$HOME/.vim" ]; then
  rm -rf "$HOME/.vim"
fi
ln -sf "$DOTFILES_DIR/vim" "$HOME/.vim"

# Git
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

#Tmux
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.config/tmux/tmux.conf"

echo "Done! You may want to reload your shell or restart the system."
