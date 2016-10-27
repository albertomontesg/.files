cp .zsh_alias ~/
cp .zshrc ~/
mkdir ~/.tmux
cp .tmux.conf ~/

# Atom
cp atom/config.cson ~/.atom/
apm i --packages-file atom/packages.list
