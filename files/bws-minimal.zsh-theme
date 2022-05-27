export REPORTTIME=2
setopt prompt_subst
# source ~/.zsh/git-prompt/zshrc.sh
if [ $SSH_CONNECTION ]; then SSH="%n@%m"; else SSH=""; fi
PROMPT='%(?..$fg[red]%?%{$reset_color%}
)%(!.$fg[red]ROOT%{$reset_color%}@%B%m%b.$SSH)$fg[cyan]%#%{$reset_color%} '
RPROMPT='%~'

