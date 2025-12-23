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

error() {
  echo -e "\e[1;31m[ERROR]\e[0m $1"
  exit 1
}

#######################################
# Checks
#######################################

if ! command -v pacman &>/dev/null; then
  error "This script is intended for Arch-based systems (EndeavourOS)."
fi

#######################################
# System update
#######################################

info "Updating system..."
sudo pacman -Syu --noconfirm

#######################################
# Packages
#######################################

tools=(
  git
  tree
  ctags
  fzf
  bat
  curl
  xclip
  wget
  vim
  btop
)

info "Installing tools..."

for tool in "${tools[@]}"; do
  if pacman -Qi "$tool" &>/dev/null; then
    info "$tool already installed"
  else
    info "Installing $tool"
    sudo pacman -S --noconfirm "$tool"
  fi
done

#######################################
# Zsh plugins
#######################################

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
PLUGINS_DIR="$ZSH_CUSTOM/plugins"

info "Installing zsh plugins..."

declare -A zsh_plugins=(
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting"
)

for plugin in "${!zsh_plugins[@]}"; do
  if [[ -d "$PLUGINS_DIR/$plugin" ]]; then
    info "$plugin already exists"
  else
    git clone "${zsh_plugins[$plugin]}" "$PLUGINS_DIR/$plugin"
  fi
done

#######################################
# Zshrc
#######################################

if [[ -f "$HOME/.zshrc" ]]; then
  warn "Backing up existing .zshrc"
  cp "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%s)"
fi

info "Copying .zshrc"
cp ./zshrc "$HOME/.zshrc"

#######################################
# Git config
#######################################

info "Configuring git..."
git config --global init.defaultBranch main

info "Setup completed successfully 🎉"

