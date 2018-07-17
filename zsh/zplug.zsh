# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZPLUG_HOME=/usr/local/opt/zplug

if [[ ! -d "$ZPLUG_HOME" ]]; then
    brew install zplug
fi

source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# zplug "dracula/zsh", as:theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "~/.oh-my-zsh/custom", from:local, use:'(*).zsh'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

