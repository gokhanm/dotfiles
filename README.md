# dotfiles

## On a new machine

 ```sh

# install all brew dependencies
brew bundle

# copy dotfiles
make

# add fish bin path into trusted shells for mac
sudo vim /etc/shells

# make fish the new default
chsh -s /usr/local/bin/fish

# setup vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# open vim and install all plugins
:PlugInstall

# hyper-gruvbox theme installation
hyper i hyper-gruvbox
 ```
