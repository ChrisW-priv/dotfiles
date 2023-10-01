# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# python
alias python=python3
alias py=python3
alias activate='source ~/env/glob/bin/activate'
# present visual
alias open='gio open'
# clear screen
alias cl=clear
# C/c++ debuger
alias gdb='gdb -q'
# navigate to parent dir
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

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
# python venv module 
alias venv='source venv/bin/activate'
# tree ignore the venv directory 
alias tree="tree -I 'venv|__pycache__|.git'"

alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias flatseal='flatpak run com.github.tchx84.Flatseal'
alias discord='flatpak run com.discordapp.Discord'
alias obsidian='flatpak run md.obsidian.Obsidian'
alias firefox='flatpak run org.mozilla.firefox'
