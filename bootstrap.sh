CURRENT_DIR=$(pwd)

# ZSH and Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s $CURRENT_DIR/terminal/zsh_alias ~/.zsh_alias
ln -s $CURRENT_DIR/terminal/zshrc ~/.zshrc
ln -s $CURRENT_DIR/terminal/theme/gitster.zsh-theme ~/.oh-my-zsh/custom/themes/

# TMUX
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/.files/tmux.conf ~/.tmux.conf

# Atom
for file in $CURRENT_DIR/atom/*{!.list} ; do
    ln -s $CURRENT_DIR/atom/$file ~/.atom/$file
done
apm i --packages-file atom/packages.list

# Git
ln -s $CURRENT_DIR/git/gitconfig ~/.gitconfig
ln -s $CURRENT_DIR/git/gitignore ~/.gitignore

# Brew and Cask
