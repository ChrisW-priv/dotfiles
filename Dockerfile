# use arch as OS of choice -> maybe debian in the future??
from archlinux

# update the system
run pacman -Syu --noconfirm

run pacman -S\
    zsh\
    tmux\
    neovim\
    fzf\
    ripgrep\
    git\
    github-cli\
    gcc\
    make\
    python-pip\
    xclip\
    --noconfirm

env HOME=/home/chris
env XDG_CONFIG_HOME=${HOME}/.config
env XDG_DATA_HOME=${HOME}/.local/share
env ZDOTDIR=${XDG_CONFIG_HOME}/zsh

workdir ${HOME}

copy nvim/.config/nvim/after ${XDG_CONFIG_HOME}/nvim/after
copy nvim/.config/nvim/lua ${XDG_CONFIG_HOME}/nvim/lua
copy nvim/.config/nvim/init.lua ${XDG_CONFIG_HOME}/nvim/

copy zsh/.zshrc ${ZDOTDIR}/
copy tmux/.tmux.conf .
copy ./git/.gitconfig .
copy ./bash/.bash_aliases .

CMD ["tail", "-f", "/dev/null"]

