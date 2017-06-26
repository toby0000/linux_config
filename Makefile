dotfiles: install-bin install-nvim install-zsh install-git \
	install-pip install-ins

install-bin:
	rm -rf ~/.bin
	ln -s `pwd`/.bin ~/.bin

install-nvim:
	rm -rf ~/.config/nvim
	ln -s `pwd`/nvim ~/.config/nvim

install-zsh:
	rm -rf ~/.zshrc
	ln -s `pwd`/.zshrc ~/.zshrc

install-git:
	rm -rf ~/.gitconfig
	ln -s `pwd`/.gitconfig ~/.gitconfig

install-pip:
	rm -rf ~/.pip
	ln -s `pwd`/.pip ~/.pip

install-ins:
	rm -rf `pwd`/.bin/install.sh
	ln -s `pwd`/install.sh `pwd`/.bin/install.sh
