CURRENT_DIR=$(pwd)

# Prepare a backup folder in case exists current files
[ ! -f $CURRENT_DIR/backup ] && mkdir -p $CURRENT_DIR/backup


link_file() {
    # This function tries to link a file from source to a target. If the file already exists
    # and is a link, then force the new link. If it is a file, then move the original to the
    # backup folder and then do the symbolic linking
    sourceFile=$CURRENT_DIR/$1
    targetFile=$2
    if [ -d "sourceFile" ]; then
        exit
    fi
    if [ ! -e "$targetFile" ]; then
        ln -fs "$sourceFile" "$targetFile"
        echo "Linked $targetFile → $sourceFile"
    elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
        echo "Already linked $targetFile → $sourceFile"
    else
        [ ! -d backup/$(dirname $1) ] && mkdir -p backup/$(dirname $1)
        mv $targeFile $CURRENT_DIR/backup/$1
        echo "Saved a backup of $targetFile in backup/$1"
        ln -fs "$sourceFile" "$targetFile"
        echo "Linked $targetFile → $sourceFile"
    fi
}

install_clone_repo() {
    # In case that the installation consist into cloning a repo, first look if the repo exists.
    # If so, pull the latest commit, if not, clone it from origin
    repo=$1
    dir=$2
    name=$3
    currentDir=$(pwd)
    if [ -d "$dir" ]; then
        cd "$dir"
        git pull
        cd "$currentDir"
        echo "Update $name"
    else
        git clone $repo $dir
        echo "Install $name"
    fi
}

ask_for_confirmation() {
    echo "$1 (y/n) "
    read -n 1
    printf "\n"
}

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}


# ZSH and Oh My Zsh and TMUX
if [ $(basename $ZSH) != ".oh-my-zsh" ]; then
    echo "Not installed Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Installed"
fi
# Move all terminal files
terminal_files=(tmux.conf zshrc zsh_alias zsh_exports zsh_functions)
for file in ${terminal_files[@]} ; do
    link_file terminal/$file ~/.$file
done
# Install terminal themes
for themefile in terminal/themes/*.zsh-theme ; do
    link_file $themefile ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/$(basename "$themefile")
done
# Install Zsh Syntax highlighting and autocomplete
ZSH_SYNTAX_HIGHLIGHTING_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ZSH_SYNTAX_HIGHLIGHTING_REPO="https://github.com/zsh-users/zsh-syntax-highlighting.git"
ZSH_AUTOSUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ZSH_AUTOSUGGESTIONS_REPO="git://github.com/zsh-users/zsh-autosuggestions"
install_clone_repo $ZSH_SYNTAX_HIGHLIGHTING_REPO $ZSH_SYNTAX_HIGHLIGHTING_DIR "Zsh Syntaz Highlighting"
install_clone_repo $ZSH_AUTOSUGGESTIONS_REPO $ZSH_AUTOSUGGESTIONS_DIR "Zsh Autosuggestions"
# Install Tmux Plugin Manager
[ ! -d ~/.tmux/plugins ] && mkdir -p ~/.tmux/plugins
install_clone_repo https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm ~/.tmux/plugins


# Atom files
for file in atom/* ; do
    link_file $file ~/.atom/$(basename $file)
done
ask_for_confirmation "Do you want to install Atom packages?"
if answer_is_yes; then
    apm i --packages-file ~/.atom/packages.list
fi
rm ~/.atom/packages.list

# Git
link_file git/gitconfig ~/.gitconfig
link_file git/gitignore ~/.gitignore

# Binaries
binaries=(ssh-key tunnel)
for bin in ${binaries[@]} ; do
    link_file bin/$bin /usr/local/bin/$bin
done

# Brew and Cask
ask_for_confirmation "Do you want to install Brew packages?"
if answer_is_yes; then
    sh install/brew.sh
fi
ask_for_confirmation "Do you want to install Cask apps?"
if answer_is_yes; then
    sh install/cask.sh
fi
