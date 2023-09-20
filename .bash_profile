# Source outside files
files_to_source=("$HOME/.bash_aliases" )

for file_to_source in ${files_to_source[@]}
do
    if [ -f "$file_to_source" ];
    then
        source "$file_to_source"
    else
        echo "File Not Found: $file_to_source"
        # ... additional error handlings
    fi
done

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# change default terminal look
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# tmux-sessioniser
bind '"\C-f": "tmux-sessionizer\n"'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# set keyboard to be colemak with esc<=>caps
setxkbmap pl -variant colemak
xmodmap -e "clear Lock" -e "keycode 66 = Escape"
xmodmap -e "clear Lock" -e "keycode 9 = Caps_Lock"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features 
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=/usr/local/bin/vim:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/scripts/:$PATH
