#!/bin/bash
# 该脚本用来安装各类软件

# 使用未声明变量时退出
# set -u
# 遇到错误时退出
set -e

LINUX_CONFIG_PATH=$(dirname $(readlink -f $0))
PIP_SOURCE='-i https://pypi.douban.com/simple'

ins_nvim()
{
	sudo apt-get install -y neovim

	# TODO: 待测试
	# ubuntu 18以上版本会自动设置nvim为默认编辑器
	#sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	#sudo update-alternatives --config vi
	#sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	#sudo update-alternatives --config vim
	#sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	#sudo update-alternatives --config editor

	# install plug.vim
	sudo apt-get install -y curl
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install nvim config && plugin
	make -C $LINUX_CONFIG_PATH install-nvim
	# 安装插件
	#nvim +PlugInstall +qall
	nvim -c 'PlugInstall|qall'
	# install nvim plug config
	ins_nvim_plug_conf
}

ins_python()
{
	sudo apt-get install -y python3 python3-dev python3-pip
	make -C $LINUX_CONFIG_PATH install-pip
	sudo pip3 install -U pip $PIP_SOURCE
	sudo pip3 install virtualenv $PIP_SOURCE
	mkdir -p ~/.env
	virtualenv -p python3 ~/.env/py3
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
	sudo apt-get install -y autojump silversearcher-ag ripgrep fzf
	sudo apt-get install -y tmux
	# nvim
	sudo apt-get install -y exuberant-ctags
	# 神器jq: 格式化json显示，替换python -m json.tool
	# tig: 交互式的git
	sudo apt-get install -y jq tig mycli
}

ins_zsh_plug()
{
	ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
	# 该函数必须在zsh安装完后安装，由于该函数会生成.oh-my-zsh目录，导致ins_zsh无法正常安装
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

# 用于装完系统后安装各类工具
init()
{
	sudo apt update
	ins_python
	ins_nvim
	make -C $LINUX_CONFIG_PATH
	ins_other
	# zsh必须在最后安装，由于它会将终端切到zsh，从而中断脚本
	ins_zsh
}

# 安装用于nvim的python插件
ins_pytools()
{
	# for nvim
	pip install -U pip neovim jedi flake8 pep8 pylint $PIP_SOURCE

	# tools
	#pip install thefuck pipreqs mycli alembic ipdb
	pip install -U pipreqs ipdb ipython ranger $PIP_SOURCE
}

# 安装nvim插件配置
ins_nvim_plug_conf()
{
	py_snip=$LINUX_CONFIG_PATH/nvim/plugged/vim-snippets/UltiSnips/python.snippets
	py_snip_bak=$LINUX_CONFIG_PATH/nvim/plugged/vim-snippets/UltiSnips/python.snippets.bak
	diy_py_snip=$LINUX_CONFIG_PATH/nvim/python.snippets
	if [[ -z $(grep "# DIY" $py_snip) ]]; then
		cp $py_snip $py_snip_bak
	else
		cp $py_snip_bak $py_snip
	fi
	cat $diy_py_snip >> $py_snip
}


help()
{
	cat << EOF
Usage: ./install.sh [OPT]
OPT:
	init:                        执行ins_python, ins_nvim, ins_zsh, ins_other, make
	|- ins_python:               安装python以及虚拟环境
	|- ins_nvim:                 安装nvim以及相关插件
	   |- ins_nvim_plug_conf:    安装nvim插件配置
	|- ins_zsh:                  安装zsh

    # 以下工具需以上工具安装后自行安装
	ins_zsh_plug:       安装zsh的脚本，必须在安装zsh后执行，否则会阻碍oh-my-zsh的安装
	ins_pytools:        安装python工具，在安装python虚拟环境后安装
EOF
}

# main
if [[ -z $1 || $1 == '-h' || $1 == '--help' ]]; then
	help
else
	$1
fi

