#/bin/sh

set -e

echo "Create files/dirs"
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

echo "Installing pluggins managers..."
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Instalando vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
    echo "Instalando vundle-vim..." 
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Copy vimrc/vim.plug file"
cp ./vimrc ~/.vimrc
cp ./vim.plug ~/.vim.plug
cp ./vim.vundle ~/.vim.vundle

vim +PlugInstall +qall
vim +PluginInstall +qall

