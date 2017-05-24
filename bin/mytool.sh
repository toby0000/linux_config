#!/bin/bash

# common
# set -o vi
export TERM=xterm-256color
export HISTTIMEFORMAT='%F %T'       # set time format of history record
export HISTCONTROL=ignoredups       # history record ignoredups repeat cmd

if [[ $(which autojump) =~ 'not found' ]]; then
    source ~/bin/z.sh
fi
alias fn='find -name'
alias fd='find -type d -name'
alias ff='find -type f -name'
alias fgrep='find -name "*.[c|h]" -o -name "*.cpp" -o -name "*.java" | xargs grep --color -Hn'
alias vi='nvim'
alias vim='nvim'
alias ls='ls --hide="*.pyc" --color'

# vim
VIMRUNTIME="$(nvim -e --cmd 'echo $VIMRUNTIME|quit' 2>&1)"

alias py2='source ~/env/py27/bin/activate'
alias web='py2 && cd ~/cnns/cid && python manager.py start'
webstop()
{
    ps aux | ag python\ manager.py\ start | ag -v ag\  | awk '{print $2}' | while read pid
    do
        echo kill $pid
        kill $pid
        sleep 1
        kill $pid
    done

}
alias webr='webstop && sleep 0.5 && web'

# start python2 env
py2
