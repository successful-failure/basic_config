#!/usr/bin/env bash

set -Eeuo pipefail

#######################################
# Utils
#######################################

info() {
  echo -e "\e[1;34m[INFO]\e[0m $1"
}

warn() {
  echo -e "\e[1;33m[WARN]\e[0m $1"
}

#######################################
# Paths
#######################################

VIM_DIR="$HOME/.vim"
AUTOLOAD_DIR="$VIM_DIR/autoload"
PLUGGED_DIR="$VIM_DIR/plugged"
BACKUP_DIR="$VIM_DIR/backup"

#######################################
# Directories
#######################################

info "Creating vim directories..."
mkdir -p \
  "$AUTOLOAD_DIR" \
  "$PLUGGED_DIR" \
  "$BACKUP_DIR" \
  "$VIM_DIR/colors"

#######################################
# vim-plug
#######################################

PLUG_VIM="$AUTOLOAD_DIR/plug.vim"

if [[ -f "$PLUG_VIM" ]]; then
  info "vim-plug already installed"
else
  info "Installing vim-plug..."
  curl -fsLo "$PLUG_VIM" \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#######################################
# vimrc
#######################################

if [[ -f "$HOME/.vimrc" ]]; then
  warn "Backing up existing .vimrc"
  cp "$HOME/.vimrc" "$HOME/.vimrc.bak.$(date +%s)"
fi

info "Copying vim configuration files..."
cp ./vimrc "$HOME/.vimrc"
cp ./vim.plug "$HOME/.vim.plug"

#######################################
# Plugins install
#######################################

info "Installing Vim plugins..."
vim +PlugInstall +qall

info "Vim setup completed successfully 🎉"

