#!/bin/bash
set -e

# setup git-aware-bash
echo "==========================="
echo "Installing git-aware-prompt"
echo "==========================="
if [[ ! -d ~/.bash ]]; then
    mkdir ~/.bash
    (
        cd ~/.bash
        if [[ ! -d git-aware-prompt ]]; then
            git clone --depth=1 git://github.com/jimeh/git-aware-prompt.git
            echo 'export GITAWAREPROMPT=~/.bash/git-aware-prompt' >> ~/.bashrc
            echo 'source "${GITAWAREPROMPT}/main.sh"' >> ~/.bashrc
            echo 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.bashrc
        fi
    )
fi

echo "==============="
echo "Installing tmux"
echo "==============="
sudo apt-get install -y tmux

echo "================================="
echo "Installing nautilus-open-terminal"
echo "================================="
sudo apt-get install -y nautilus-open-terminal

echo "===================="
echo "Installing vim-gnome"
echo "===================="
sudo apt-get -y install vim-gnome

echo "======================"
echo "Installing vim plugins"
echo "======================"
mkdir -p ~/.vim/bundle
git clone --depth=1 git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth=1 git://github.com/ih4cku/dotfiles.git ~/dotfiles
cp ~/dotfiles/vimrc ~/.vimrc
cp ~/dotfiles/tmux.conf ~/.tmux.conf
vim +PluginInstall +qall

# build YouCompleteMe
(
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
)

# install ag
echo "============="
echo "Installing ag"
echo "============="
apt-get install -y silversearcher-ag

