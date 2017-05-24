all: common python zsh nvim dotfiles

common:
	apt-get update
	apt-get install -y curl

python:
	apt-get install -y python python-dev python-pip python3 python3-pip python3-dev
	pip3 install -U pip3
	pip install -U pip
	pip install virtualenv
	mkdir -p ~/.env
	virtualenv -p python ~/.env/py2
	virtualenv -p python3 ~/.env/py3
	requirements='neovim ipython jedi'
	source ~/.env/py2/bin/activate
	pip install -U pip
	pip install -U ${requirments}
	source ~/.env/py3/bin/activate
	pip install -U pip
	pip install -U ${requirments}

zsh:
	apt-get install -y zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	
nvim:
	apt-get install -y software-properties-common
	add-apt-repository ppa:neovim-ppa/stable
	apt-get update
	apt-get install -y neovim
	update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	update-alternatives --config v
	update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	update-alternatives --config vim
	update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	update-alternatives --config editor
	pip install neovim
	pip3 install neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -c 'PlugInstall'

dotfiles: install-nvim install-zsh install-git install-bin

install-bin:
	rm -rf ~/bin
	ln -s `pwd`/bin ~/bin

install-nvim:
	rm -rf ~/.config/nvim
	ln -s `pwd`/nvim ~/.config/nvim

install-zsh:
	rm -rf ~/.zshrc
	ln -s `pwd`/.zshrc ~/.zshrc

install-git:
	rm -rf ~/.gitconfig
	ln -s `pwd`/.gitconfig ~/.gitconfig

web_env:
	apt-get install -y redis-server nginx mysql-server mysql-client libmysqlclient-dev
