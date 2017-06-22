#!/usr/bin/env sh

LINUX_CONFIG_PATH=$(readlink -f $0)

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
	sudo apt-get -y install curl
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install nvim config && plugin
	make -C $LINUX_CONFIG_PATH install-nvim
	nvim -c 'PlugInstall'
}

ins_python()
{
	sudo apt-get install python python-dev python-pip
	sudo apt-get install python3 python-dev python3-pip
	make -C $LINUX_CONFIG_PATH install-pip
	sudo pip install -U pip
	sudo pip install virtualenv
	mkdir -p ~/.env
	virtualenv -p python ~/.env/py2
	virtualenv -p python3 ~/.env/py3
}

ins_zsh()
{
	sudo apt-get -y zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	make -C $LINUX_CONFIG_PATH install-zsh
}

init()
{
	ins_python
	ins_nvim
	ins_zsh
	make -C $LINUX_CONFIG_PATH
}

ins_py_nvim()
{
	pip install -U pip, neovim, ipython, jedi, flake8, pep8, pylint
}

# main
$1
