#!/bin/bash

set -euo pipefail

# Clear
rm -f $HOME/.zshrc
rm -f $HOME/.zprofile
rm -rf $HOME/.config/zsh
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/doom
rm -rf $HOME/.config/gnome
rm -rf $HOME/.config/gnome
rm -rf $HOME/.config/systemd
rm -rf $HOME/.config/distrobox

# Stow
stow --target=$HOME zsh
stow --target=$HOME nvim
stow --target=$HOME doom
stow --target=$HOME gnome
stow --target=$HOME gnome
stow --target=$HOME systemd
stow --target=$HOME distrobox

# Oh my zsh + plugins
rm -rf $HOME/.local/share/oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.local/share/oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $HOME/.local/share/oh-my-zsh/custom/plugins/zsh-completions

# Fonts

rm -rf $HOME/.local/share/fonts/SauceCodePro
mkdir -p $HOME/.local/share/fonts/SauceCodePro
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.tar.xz -o /tmp/SauceCodePro.tar.xz
tar -xf /tmp/SauceCodePro.tar.xz -C $HOME/.local/share/fonts/SauceCodePro
rm /tmp/SauceCodePro.tar.xz

if [[ ! -f /run/.toolboxenv ]]; then

  # Clear font cache
  fc-cache -f -v

  # Apply gnome dconf
  dconf load / < $HOME/.config/gnome/settings.dconf

fi

