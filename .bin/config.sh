#TODO:
LINUX_CONFIG_PATH=

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

# install commond
ins()
{
	choose=$1

	case $choose in
		all)
			echo -e 'ins common!'
			ins common
			echo -e 'ins python!'
			ins python
			echo -e 'ins nvim!'
			ins nvim
			echo -e 'ins zsh!'
			ins zsh
		common)
			sudo apt-get update
			sudo apt-get install -y autojump fzf curl
			;;
		zsh)
			sudo apt-get -y zsh
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
			make -C $LINUX_CONFIG_PATH install-zsh
			;;
		python)
			sudo apt-get install -y python python-dev python-pip python3 python3-pip python3-dev
			sudo pip3 install -U pip
			sudo pip install virtualenv
			mkdir -p ~/.env
			virtualenv -p python ~/.env/py2
			virtualenv -p python3 ~/.env/py3
			;;
		nvim)
			if [[ -z $(which nvim) ]]; then
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
			fi
			pip install neovim
			pip3 install neovim
			curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
				https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			nvim -c 'PlugInstall'
			;;
		dotfiles)
			make -C $LINUX_CONFIG_PATH
			;;
		web)
			sudo apt-get install -y redis-server nginx mysql-server mysql-client libmysqlclient-dev
			;;
		*)
			echo 'pls input args!'
			;;
	esac
}

py()
{
	choose=$1
	case $choose in
		env)
			requirements='neovim ipython jedi'
			pip install -U pip
			pip install -U ${requirments}
			;;
		web)
			requirements='requests sqlalchemy pymysql'
			pip install -U ${requirments}
			;;
		flask)
			#TODO
			;;
		django)
			#TODO
			;;
		*)
			echo 'pls input args!'
			;;
	esac
}
