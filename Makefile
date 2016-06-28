.PHONY: all prezto vim dockervim deinvim bash tmux

all:


prezto:
	bash ./etc/init/install_prezto.sh

vim:
	ln -s ${PWD}/.vim ${HOME}/
	ln -s ${PWD}/.vimrc ${HOME}/.vimrc
	mkdir ${HOME}/.vim/swap
	mkdir ${HOME}/.vim/backup
	mkdir ${HOME}/.vim/dict

vim-setup_for_docker:deinvim vim
	/bin/bash -c 'mv .vim/rc/plugin/90-check_install.vim .vim/rc/plugin/90-check_install.vim.back'
	/bin/bash -c 'vim -c ":silent! call dein#install() | :q"'
	/bin/bash -c 'mv .vim/rc/plugin/90-check_install.vim.back .vim/rc/plugin/90-check_install.vim'

deinvim:
	/bin/bash ./etc/init/install_deinvim.sh

bash:
	ln -s ${PWD}/.bashrc ${HOME}/.bashrc

tmux:
	ln -s ${PWD}/.tmux.conf ${HOME}/.tmux.conf
