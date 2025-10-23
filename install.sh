#!/bin/bash
# curl -L https://dtinth.github.io/comic-mono-font/ComicMono.ttf -o /Library/Fonts/ComicMono.ttf
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install zsh-autosuggestions zsh-syntax-highlighting awscli thefuck ripgrep catimg wget eza

echo "Creating symlinks..."
ln -sfv ~/.dotfiles/gitconfig ~/.gitconfig
ln -sfv ~/.dotfiles/zshrc ~/.zshrc
