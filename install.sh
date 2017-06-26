#!/bin/bash
# 该脚本用来安装各类软件

LINUX_CONFIG_PATH=$(dirname $(readlink -f $0))

ins_nvim()
{
	sudo apt-get install -y software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install -y neovim

	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --config editor

	# install plug.vim
	sudo apt-get install -y curl
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install nvim config && plugin
	make -C $LINUX_CONFIG_PATH install-nvim
	nvim -c 'PlugInstall'
}

ins_python()
{
	sudo apt-get install -y python python-dev python-pip
	sudo apt-get install -y python3 python-dev python3-pip
	make -C $LINUX_CONFIG_PATH install-pip
	sudo pip install -U pip
	sudo pip install virtualenv
	mkdir -p ~/.env
	virtualenv -p python ~/.env/py2
	virtualenv -p python3 ~/.env/py3
}

ins_zsh()
{
	sudo apt-get install -y zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	make -C $LINUX_CONFIG_PATH install-zsh
}

ins_fzf()
{
	if [[ -e ~/.fzf ]]; then
		(cd ~/.fzf; git pull)
	else
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	fi
	sudo ~/.fzf/install
}

# 用于装完系统后安装各类工具
init()
{
	ins_python
	ins_nvim
	ins_zsh
	ins_fzf
	make -C $LINUX_CONFIG_PATH
}

# 安装用于nvim的python插件
ins_py_nvim()
{
	pip install -U pip neovim jedi flake8 pep8 pylint
	if [[ -n $(python -V 2>&1 | grep -P '2\.7\.') ]]; then
		pip install ipython==5.4.1
	else
		pip install ipython
	fi
}

help()
{
	cat << EOF
Usage: ./install [OPT]
OPT:
	ins_python : 安装python以及虚拟环境
	ins_nvim   : 安装nvim以及相关插件
	ins_zsh    : 安装zsh
	ins_fzf    : 安装fzf
	init       : 执行ins_python, ins_nvim, ins_zsh, ins_fzf, make
	ins_py_nvim: 安装nvim的python插件
EOF
}

# main
if [[ -z $1 || $1 == '-h' || $1 == '--help' ]]; then
	help
else
	$1
fi

