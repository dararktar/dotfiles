if ! [[ "$PATH" =~ "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH

export DOTFILES=$HOME/Dotfiles
