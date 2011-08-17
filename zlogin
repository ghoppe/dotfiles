# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt PROMPT_SUBST

# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
# Courtesy of http://sebastiancelis.com/2009/11/16/zsh-prompt-git-users/
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

# prompt
export PS1='[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%1~%{$reset_color%}] '

# load thoughtbot/dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '
# PROMPT=$'%{${fg[cyan]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%} '
