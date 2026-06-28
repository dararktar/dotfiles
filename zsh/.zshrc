for function in $HOME/.config/zsh/functions/*; do
  source $function
done

for config in $HOME/.config/zsh/configs/*; do
  . $config
done

[[ -f ~/.config/zsh/aliases ]] && source ~/.config/zsh/aliases

autoload -Uz compinit && compinit

export ZSH="$HOME/.local/share/oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-completions
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

if [[ -f /run/.toolboxenv ]]; then
  PROMPT=$'\n📦 📦 📦 %{$fg_bold[blue]%}[$CONTAINER_ID]\n%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}'
  PROMPT+=' $(git_prompt_info)'
fi

