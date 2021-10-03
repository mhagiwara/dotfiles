# Use Emacs-style keybind
bindkey -e

# Use escape sequence
setopt prompt_subst

# Customize prompt

# Show git branch name on the right

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

local RED=$'%{\e[1;31m%}'
local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local MAGENTA=$'%{\e[1;35m%}'
local CYAN=$'%{\e[1;36m%}'
local DEFAULT=$'%{\e[m%}%b'

PROMPT=$CYAN'$USER@$HOST%% '$DEFAULT
RPROMPT=$GREEN'[%~]'$BLUE\$vcs_info_msg_0_$DEFAULT


LS_COLORS='di=00;36:ln=00;31:ex=00'
export LS_COLORS

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

# Don't add duplicate command lines to history
setopt hist_ignore_dups

# Enable prompt colors
autoload -U colors
colors

# Enable default auto completion
autoload -U compinit
compinit

# Use Emacs-style key binds for completion
zstyle ':completion:*:default' menu select=1

# Case insensitive auto completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Push when cd
setopt auto_pushd

# cd by typing directory names
setopt auto_cd

# Don't add duplicate directory when pushd
setopt pushd_ignore_dups

# Wait before rm *
setopt rmstar_wait

# Share history between sessions
setopt share_history

alias -g G='| grep'
alias -g L='| less'
alias -g ipy='ipython'
alias -g J='| jq . | less'
alias -g s='source .pyenv/bin/activate'

alias -g ll='ls -alhF'
alias -g l='ls -alhF'
alias -g lc='wc -l'

alias -g gs="git status"
alias -g gc="git checkout"
alias -g gb="git branch"
alias -g gd="git diff"
alias -g gl="git log"
alias -g gca="git commit -a"
alias -g gcaa="git commit -a --amend"
alias -g glg="git log --decorate --graph --oneline"
alias -g gpom="git push origin main"
