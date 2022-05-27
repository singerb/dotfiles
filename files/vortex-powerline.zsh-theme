function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo ' '
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo "%F{015}%K{003} "`basename $VIRTUAL_ENV`"%k%f%F{003}%K{012} %k%f"
}

function hg_prompt_info_new {
    hg prompt --angle-brackets "\
%F{002}%K{008}%k%f%F{015}%K{002} <status|modified|unknown>%k%f\
<%F{015}%K{002}  <update>%k%f>\
%F{005}%K{002} %k%f%F{015}%K{005} <branch>%k%f\
%F{006}%K{005} %k%f%F{015}%K{006} <tags> %k%f\
<%F{003}%K{006} %k%f%F{014}%K{003} <patches|join( %F{015}%f )|pre_unapplied(%F{014})|post_unapplied(%f)|pre_applied(%F{015})|post_applied(%f)> %k%f>" 2>/dev/null
}

# PROMPT='%B%F{015}%K{005} %n %k%f%b%F{005}%K{006}%k%f%B%F{015}%K{006} %m %k%f%b%F{006}%K{002}%k%f%F{015}%K{002} ${${PWD/#$HOME/~}//\//  } %k%f%F{002}%f
# $(virtualenv_info)%F{001}%K{012}$(vi_mode_prompt_info)%k%f%F{015}%K{012} %D  %T %k%f%(?,%F{012}%K{002} %f%F{015}✓%f %F{002}%K{010}%f%k,%F{012}%K{001} %f%F{015}✕%f %F{001}%K{010}%f%k)%F{015}%K{010} $(prompt_char) %f%k%F{010}%K{008}%f%k '
PROMPT='%B%F{015}%K{005} %n %k%f%b%F{005}%K{006}%k%f%B%F{015}%K{006} %m %k%f%b%F{006}%K{002}%k%f%F{015}%K{002} ${${PWD/#$HOME/~}//\//  } %k%f%F{002}%f
$(virtualenv_info)%F{001}%K{012}$(vi_mode_prompt_info)%k%f%F{015}%K{012} %D  %T %k%f%(?,%F{012}%K{002} %f%F{015}✓%f %F{002}%K{010}%f%k,%F{012}%K{001} %f%F{015}✕%f %F{001}%K{010}%f%k)%F{015}%K{010} $(prompt_char) %f%k%F{010}%K{008}%f%k '

RPROMPT=$'$(hg_prompt_info_new)$(git_prompt_info)'

# TODO customize git prompt in powerline style
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
