# autostart tmux
#if [ "$TMUX" = "" ]; then tmux; fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# autocomplete command line switches for aliases
setopt completealiases

setopt autocd
autoload -U colors && colors        # needed for colored prompt

# arch command not found hook
if [[ -s '/usr/share/doc/pkgfile/command-not-found.zsh' ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
elif [[ -s '/etc/zsh_command_not_found' ]]; then
    source /etc/zsh_command_not_found
fi

# add autocomplete
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias tree='tree -C'
alias vi='vim'
alias view='vim -R'
alias lsd='ls -d */'
alias copy='xclip -sel clip <'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# starship prompt
eval "$(starship init zsh)"
