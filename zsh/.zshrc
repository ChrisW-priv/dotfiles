source ~/.bash_aliases

PS1='%F{green}%n@%m%F{white}:%F{blue}%~'$'\n'$'%F{white} > '
bindkey -v

setopt nomatch extendedglob

# Setup plugin manager
PLUGIN_FOLDER="$HOME/.config/zsh/plugins"
function zsh_add_plugin() {
	PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
	if [ -d "$PLUGIN_FOLDER/$PLUGIN_NAME" ]; then
		source "$PLUGIN_FOLDER/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
		source "$PLUGIN_FOLDER/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
	else
		git clone "https://github.com/$1.git" "$PLUGIN_FOLDER/$PLUGIN_NAME"
	fi
}
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# Enable completion and use Tab for word comletion
bindkey '^I' expand-or-complete
autoload -Uz compinit && compinit
bindkey "^N" autosuggest-accept
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

HISTFILE=~/.zhistory
setopt APPEND_HISTORY
HISTSIZE=2000
SAVEHIST=2000

bindkey -s '^F' 'tmux-sessionizer\n'
bindkey -s '^H' 'history | fzf\n'

# function zle-keymap-select () {
# 	case $KEYMAP in 
# 		vicmd) echo -ne '\e[1 q' ;; 		# block
# 		viins|main) echo -ne '\e[5 q' ;; 	# beam
# 	esac
# }
# 
# zle -N zle-keymap-select
# zle-line-init() {
# 	zle -K viins
# 	echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# 
