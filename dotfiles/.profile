export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.rvm/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools"
