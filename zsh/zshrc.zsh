# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export DISABLE_AUTO_TITLE='true'

prompt_spotify_status() {
    local COLOR='%F{039}'
    local SPOTIFY_CLI=$(command -v spotify-cli)
    local NOW_PLAYING=`$SPOTIFY_CLI now-playing`
    echo $NOW_PLAYING | grep "?$" >/dev/null
    if [ $? -ne 0 ]; then
        local ARTIST=`echo $NOW_PLAYING | grep "spotify_artist_name" | cut -d'=' -f2`
        local SONG=`echo $NOW_PLAYING | grep "spotify_track_name" | cut -d'=' -f2`
        echo -n "%{$COLOR%}\uf025 $SONG - $ARTIST "
    else
    fi
}

prompt_pawprint() {
  echo -n " %{%F{197}%}\uf1b0"
}

prompt_docker() {
    local DIR=$(pwd)
    local COLOR='%F{039}'
    if [ -e "$DIR/Dockerfile" ]; then
        echo -n "%{$COLOR%} \uf13d "
    fi
}

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerline9k configuration
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(pawprint user nvm node_version dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\u256D\u2500"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uF101 "

# https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config#martmistss-configuration
POWERLEVEL9K_DIR_HOME_FOREGROUND="201"
POWERLEVEL9K_DIR_HOME_BACKGROUND="gray"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="201"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="gray"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="201"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="gray"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="gray"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="197"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="gray"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="orange"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="gray"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="blue"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="gray"
POWERLEVEL9K_PYENV_FOREGROUND="blue"
POWERLEVEL9K_PYENV_BACKGROUND="gray"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="gray"
POWERLEVEL9K_STATUS_BACKGROUND="gray"

# My additions
POWERLEVEL9K_NODE_VERSION_FOREGROUND="green"
POWERLEVEL9K_NODE_VERSION_BACKGROUND="gray"
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="039"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="GRAY"
POWERLEVEL9K_OS_ICON_FOREGROUND="039"
POWERLEVEL9K_PUBLIC_IP_FOREGROUND="197"
POWERLEVEL9K_PUBLIC_IP_BACKGROUND="gray"
POWERLEVEL9K_DOCKER_FOREGROUND="039"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

