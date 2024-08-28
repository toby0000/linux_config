#!/bin/bash
# 该脚本用来安装各类软件

# 使用未声明变量时退出
# set -u
# 遇到错误时退出
set -e

LINUX_CONFIG_PATH=$(dirname $(readlink -f $0))
PIP_SOURCE='-i https://pypi.douban.com/simple'

ins_python()
{
	make -C $LINUX_CONFIG_PATH install-pip
	# sudo pip3 install -U pip $PIP_SOURCE
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
}

ins_zsh()
{
	# 注意：在init函数中， 该函数必须在最后执行，由于执行完终端会切换到zsh，从而终端脚本
	sudo apt-get install -y zsh
	make -C $LINUX_CONFIG_PATH install-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

ins_fzf()
{
       if [[ -e ~/.fzf  ]]; then
               (cd ~/.fzf; git pull)
       else
               git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
       fi
       sudo ~/.fzf/install
}

ins_other()
{
	# common
	sudo apt-get install -y vim openssh-client openssh-server lrzsz
	# tools
	sudo apt-get install -y autojump ripgrep fzf
	sudo apt-get install -y tmux
	# 神器jq: 格式化json显示，替换python -m json.tool
	# tig: 交互式的git
	sudo apt-get install -y jq tig mycli
}

ins_zsh_plug()
{
	ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
	# 该函数必须在zsh安装完后安装，由于该函数会生成.oh-my-zsh目录，导致ins_zsh无法正常安装
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

# 用于装完系统后安装各类工具
init()
{
	sudo apt update
	ins_python
	make -C $LINUX_CONFIG_PATH
	ins_other
	# zsh必须在最后安装，由于它会将终端切到zsh，从而中断脚本
	ins_zsh
}

help()
{
	cat << EOF
Usage: ./install.sh [OPT]
OPT:
	init:                        执行ins_python, ins_zsh, ins_other, make
	|- ins_python:               安装python以及虚拟环境
	|- ins_zsh:                  安装zsh

    # 以下工具需以上工具安装后自行安装
	ins_zsh_plug:       安装zsh的脚本，必须在安装zsh后执行，否则会阻碍oh-my-zsh的安装
	ins_fzf:            安装fzf
EOF
}

# main
if [[ -z $1 || $1 == '-h' || $1 == '--help' ]]; then
	help
else
	$1
fi

