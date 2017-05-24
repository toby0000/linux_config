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
export TERM=xterm-256color
export HISTTIMEFORMAT='%F %T'       # set time format of history record
export HISTCONTROL=ignoredups       # history record ignoredups repeat cmd

alias fn='find -name'
alias fd='find -type d -name'
alias ff='find -type f -name'
alias fgrep='find -name "*.[c|h]" -o -name "*.cpp" -o -name "*.java" | xargs grep --color -Hn'
alias vi='nvim'
alias vim='nvim'
alias ls='ls --hide="*.pyc" --color'

# nvim
VIMRUNTIME="$(nvim -e --cmd 'echo $VIMRUNTIME|quit' 2>&1)"

alias py2='source ~/.env/py2/bin/activate'
alias py3='source ~/.env/py3/bin/activate'
alias web='py2 && cd ~/cnns/cid && python manager.py start'

# config_local
[[ -f config_local.sh ]] && source config_local.sh
