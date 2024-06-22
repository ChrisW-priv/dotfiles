# use arch as OS of choice -> maybe debian in the future??
from archlinux

# update the system
run pacman -Syu --noconfirm

run pacman -S\
    zsh\
    tmux\
    neovim\
    git\
    github-cli\
    gcc\
    make\
    python-pip\
    xclip\
    --noconfirm

env XDG_CONFIG_HOME=/home/chris/.config/
env XDG_DATA_HOME=/home/chris/.config/
env ZDOTDIR=/home/chris/.config/zsh/
env HOME=/home/chris/

workdir /home/chris

copy nvim/.config/nvim/after /home/chris/.config/nvim/after
copy nvim/.config/nvim/lua /home/chris/.config/nvim/lua
copy nvim/.config/nvim/init.lua /home/chris/.config/nvim/

copy zsh/.zshrc .config/zsh/
copy tmux/.tmux.conf .
copy ./git/.gitconfig .
copy ./bash/.bash_aliases .

CMD ["tail", "-f", "/dev/null"]

