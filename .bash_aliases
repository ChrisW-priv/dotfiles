# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# User defined:

# python
alias python=python3
alias py=python3
# present visual
alias folder='gio open .'
alias open='gio open'
# clear screen
alias cl=clear
# C/c++ debuger
alias gdb='gdb -q'
# navigate to parent dir
alias ..='cd ..'
alias ...='cd ../..'
# Git
alias gc='git commit -m'
alias ga='git add'
alias gs='git status'
# TMUX
alias ta='tmux a -t'
alias tn='tmux new -s'
alias tls='tmux ls'
alias tk='tmux kill-session -t'
# history
alias hg='history | grep '
# nvim start
alias nv='nvim .' 
# tmux-sessioniser
bind '"\C-f": "tmux-sessionizer\n"'
# python venv module 
alias venv='source venv/bin/activate'
# tree ignore the venv directory 
alias tree='tree -I venv'

# end of user defined alias

alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
