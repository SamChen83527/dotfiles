# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

setopt auto_cd
# Fix no matches found * 
setopt no_nomatch

# Useful Functions
source "$ZDOTDIR/zsh-functions"

zsh_add_file "zsh-completion"
zsh_add_file "zsh-prompt"
zsh_add_file "zsh-aliases"

# Themes
zsh_add_theme "eastwood"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-completions"

sources=(
  'colored-man-pages'
  'bd'
  'extract'
  'exa'
)

for s in "${sources[@]}"; do
  source $ZDOTDIR/plugins/${s}.zsh
done

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# show figure settings
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
#export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 # in WSL 2
export XDG_RUNTIME_DIR=/tmp/runtime-ryanlee
export RUNLEVEL=3
export LIBGL_ALWAYS_INDIRECT=1
# export BROWSER='/mnt/c/Program Files/Google/Chrome/Application/chrome.exe'
