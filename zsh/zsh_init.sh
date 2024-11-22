#!/usr/bin/env bash

set -e

echo "System update..."
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

tools=(
    git
	tree
	universal-ctags
	fzf
	batcat
    curl
	xclip
    wget
    vim
    btop
)

echo "Installing tools..."
for tool in "${tools[@]}"; do
    if ! command -v $tool &> /dev/null; then
        echo "Installing $tool..."
        sudo apt install -y $tool
    else
        echo "$tool already install."
    fi
done

echo "Cloning dependencies..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Copy zshrc"
cp ./zshrc ~/.zshrc 

echo "Git config..."

echo "Set default branch main"
git config --global init.defaultBranch main


