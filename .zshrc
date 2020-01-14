source $HOME/antigen.zsh
#
# Antigen Theme
#
#antigen theme geometry-zsh/geometry

#POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
#antigen theme bhilburn/powerlevel9k powerlevel9k
#POWERLEVEL9K_DISABLE_RPROMPT=true
#POWERLEVEL9K_COLOR_SCHEME='dark'
#POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir virtualenv vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv aws)
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
antigen theme evan

# Antigen Bundles

antigen bundle git
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle rupa/z
antigen bundle bhilburn/powerlevel9k
antigen bundle colorize


# Python Plugins
antigen bundle pip
antigen bundle python

#antigen bundle docker
#Virtualenvwrapper Config 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devspace
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
#export VIRTUAL_ENV_DISABLE_PROMPT=0

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
    #iTerm is only used on OSX
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

antigen apply

#Save History 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed
# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"


#Config for thefuck
eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias FUCK)"
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/gabe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias vim='nvim'
export EDITOR=vim

ulimit -S -n 1024

source $HOME/.aliases
source $HOME/.functions
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/devspace/flutter/bin"
#Go config
export GOPATH="${HOME}"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

#Ruby config
export GEM_HOME=~/.gem
export GEM_PATH=~/.gem/bin
export PATH="$PATH:${GEM_PATH}"

#ZSH Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(rbenv init -)"
