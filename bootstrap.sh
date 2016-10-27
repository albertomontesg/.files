# ZSH and Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zsh_alias ~/
cp .zshrc ~/
cp terminal/gitster.zsh-theme ~/.oh-my-zsh/custom/themes/

# TMUX
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf ~/

# Atom
cp atom/config.cson ~/.atom/
apm i --packages-file atom/packages.list
