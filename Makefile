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
