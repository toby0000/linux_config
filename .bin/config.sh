#!/bin/bash

MY_BIN_PATH=$(cd $(dirname $0) && pwd)

color()
{
    set -x
    echo -e '\e[1;40m black \e[m'
    echo -e '\e[1;41m red \e[m'
    echo -e '\e[1;42m green \e[m'
    echo -e '\e[1;43m yellow \e[m'
    echo -e '\e[1;44m blue \e[m'
    echo -e '\e[1;45m magenta \e[m'
    echo -e '\e[1;46m cyan \e[m'
    echo -e '\e[1;47m white \e[m'
    set +x
}


# common
# set -o vi
export PATH=~/.bin:$PATH
export TERM=xterm-256color
export HISTTIMEFORMAT='%F %T'       # set time format of history record
export HISTCONTROL=ignoredups       # history record ignoredups repeat cmd

alias fn='find -name'
alias fd='find -type d -name'
alias ff='find -type f -name'
alias fgrep='find -name "*.[c|h]" -o -name "*.cpp" -o -name "*.java" | xargs grep --color -Hn'

# nvim config
if which nvim > /dev/null 2>&1; then
	alias vi='nvim'
	alias vim='nvim'
fi

# python config
alias ls='ls --hide="*.pyc" --color'
alias py2='source ~/.env/py2/bin/activate'
alias py3='source ~/.env/py3/bin/activate'
# pip必须在virtualenv环境下执行
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export PIP_REQUIRE_VIRTUALENV=true
gpip() {
	PIP_REQUIRE_VIRTUALENV="" pip "$@"

}

# nvim
VIMRUNTIME="$(nvim -e --cmd 'echo $VIMRUNTIME|quit' 2>&1)"

# local_config
CONFIG_LOCAL=local_config.sh
[[ -f $MY_BIN_PATH/$CONFIG_LOCAL ]] && source $CONFIG_LOCAL

# thefuck config (need exec after py2 or py3 )
if which thefuck > /dev/null 2>&1; then
	eval $(thefuck --alias)
	alias f='fuck'
fi
