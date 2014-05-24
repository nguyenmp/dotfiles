wget --output-document ~/git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
ln -s ${PWD##*/}/.vimrc ~/.vimrc
ln -s ${PWD##*/}/.bashrc ~/.bashrc
ln -s ${PWD##*/}/.gitconfig ~/.gitconfig
ln -s ${PWD##*/}/.tmux.conf ~/.tmux.conf
