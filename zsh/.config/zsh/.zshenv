

export XDG_CACHE_HOME=$HOME/.cache/
# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$XDG_CACHE_HOME/zsh/history

# Need to export this in /etc/zsh/zshenv
#export ZDOTDIR="$HOME/.config/zsh"
export ZSH_PLUGIN_DIR="$HOME/.local/share/zsh"
export EDITOR="nvim"

# show figure settings
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
#export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 # in WSL 2
export XDG_RUNTIME_DIR=/tmp/runtime-ryanlee
export RUNLEVEL=3
export LIBGL_ALWAYS_INDIRECT=1
. "$HOME/.cargo/env"
