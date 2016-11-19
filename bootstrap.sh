CURRENT_DIR=$(pwd)

# # ZSH and Oh My Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# ln -s $CURRENT_DIR/terminal/zsh_alias ~/.zsh_alias
# ln -s $CURRENT_DIR/terminal/zshrc ~/.zshrc
# ln -s $CURRENT_DIR/terminal/theme/gitster.zsh-theme ~/.oh-my-zsh/custom/themes/
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#
# # TMUX
# mkdir -p ~/.tmux/plugins
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# ln -s ~/.files/tmux.conf ~/.tmux.conf
#
# # Atom
# for file in $CURRENT_DIR/atom ; do
#     ln -s $CURRENT_DIR/atom/$file ~/.atom/$file
# done
# apm i --packages-file atom/packages.list
#
# # Git
# ln -s $CURRENT_DIR/git/gitconfig ~/.gitconfig
# ln -s $CURRENT_DIR/git/gitignore ~/.gitignore

# Binaries
for file in $CURRENT_DIR/bin/* ; do
    ln -s $CURRENT_DIR/bin/$file /usr/local/bin/$file
done

# Brew and Cask
