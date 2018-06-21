# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export DISABLE_AUTO_TITLE='true'

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerline9k configuration
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user nvm dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time_joined os_icon)

# https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config#martmistss-configuration
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_BACKGROUND="201"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="201"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="201"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="black"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="red"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="197"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="black"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="red"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="cyan"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="black"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
POWERLEVEL9K_STATUS_BACKGROUND="black"

# My additions
POWERLEVEL9K_NODE_VERSION_FOREGROUND="black"
POWERLEVEL9K_NODE_VERSION_BACKGROUND="green"
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="039"
POWERLEVEL9K_OS_ICON_FOREGROUND="clear"
POWERLEVEL9K_OS_ICON_BACKGROUND="039"
POWERLEVEL9K_PUBLIC_IP_FOREGROUND="black"
POWERLEVEL9K_PUBLIC_IP_BACKGROUND="197"
POWERLEVEL9K_NVM_BACKGROUND="green"
POWERLEVEL9K_NVM_FOREGROUND="black"

POWERLEVEL9K_TIME_BACKGROUND="cyan"
POWERLEVEL9K_TIME_FOREGROUND="black"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  nvm
  node
  yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
fi

# added by travis gem
[ -f "${HOME}/.travis/travis.sh" ] && source "${HOME}/.travis/travis.sh"
