#!/bin/bash
# 该脚本用来安装各类软件

# 使用未声明变量时退出
# set -u
# 遇到错误时退出
set -e

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
	# install nvim plug config
	ins_nvim_plug_conf
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
	# 注意：在init函数中， 该函数必须在最后执行，由于执行完终端会切换到zsh，从而终端脚本
	sudo apt-get install -y zsh
	make -C $LINUX_CONFIG_PATH install-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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

ins_other()
{
	# common
	sudo apt-get install -y vim openssh-client openssh-server lrzsz
	# zsh plugin
	sudo apt-get install -y autojump silversearcher-ag
	# nvim
	sudo apt-get install -y exuberant-ctags
}

ins_zsh_plug()
{
	# 该函数必须在zsh安装完后安装，由于该函数会生成.oh-my-zsh目录，导致ins_zsh无法正常安装
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

# 用于装完系统后安装各类工具
init()
{
	ins_python
	ins_nvim
	ins_fzf
	ins_other
	make -C $LINUX_CONFIG_PATH
	# zsh必须在最后安装，由于它会将终端切到zsh，从而中断脚本
	ins_zsh
}

# 安装用于nvim的python插件
ins_pytools()
{
	# for nvim
	pip install -U pip neovim jedi flake8 pep8 pylint

	# tools
	pip install thefuck pipreqs mycli alembic, ipdb
	if [[ -n $(python -V 2>&1 | grep -P '2\.7\.') ]]; then
		pip install ipython==5.4.1
	else
		pip install ipython
	fi
}

# 安装nvim插件配置
ins_nvim_plug_conf()
{
	py_snip=$LINUX_CONFIG_PATH/nvim/plugged/vim-snippets/UltiSnips/python.snippets
	py_snip_bak=$LINUX_CONFIG_PATH/nvim/plugged/vim-snippets/UltiSnips/python.snippets.bak
	diy_py_snip=$LINUX_CONFIG_PATH/nvim/python.snippets
	if [[ -z $(grep "# DIY" $py_snip) ]]; then
		cp $py_snip $py_snip_bak
		cat $diy_py_snip >> $py_snip
	fi
}

help()
{
	cat << EOF
Usage:            ./install [OPT]
OPT:
	ins_python:         安装python以及虚拟环境
	ins_nvim:           安装nvim以及相关插件
	ins_zsh:            安装zsh
	ins_fzf:            安装fzf
	init:               执行ins_python, ins_nvim, ins_zsh, ins_fzf, ins_other, make
	ins_zsh_plug:       安装zsh的脚本，必须在安装zsh后执行，否则会阻碍oh-my-zsh的安装
	ins_pytools:        安装python工具，在安装python虚拟环境后安装
	ins_nvim_plug_conf: 安装nvim插件配置
EOF
}

# main
if [[ -z $1 || $1 == '-h' || $1 == '--help' ]]; then
	help
else
	$1
fi

