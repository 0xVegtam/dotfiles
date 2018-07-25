# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/gabe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias FUCK)"
export EDITOR=vim

source ~/.antigen.zsh


#
# Antigen Theme
#

antigen theme evan
antigen apply
#
# Antigen Bundles
#

antigen bundle git
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

# For SSH, starting ssh-agent is annoying
#antigen bundle ssh-agent

# Node Plugins
antigen bundle coffee
antigen bundle node
antigen bundle npm

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

antigen bundle jdavis/zsh-files
eval $(thefuck --alias)
