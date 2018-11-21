source $HOME/antigen.zsh
#
# Antigen Theme
#

antigen theme evan

# Antigen Bundles

antigen bundle git
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

# For SSH, starting ssh-agent is annoying
#antigen bundle ssh-agent

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

#Virtualenvwrapper Config 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devspace
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

antigen apply


# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"

#
#Config for thefuck
#
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
export EDITOR=nvim
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

source $HOME/.aliases
source $HOME/.functions
export PATH="/usr/local/sbin:$PATH"
