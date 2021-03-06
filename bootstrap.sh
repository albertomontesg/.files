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
    printf "$1 (y/n): "
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
echo "\nInstalling shell dotfiles"
terminal_files=(tmux.conf zshrc zsh_alias zsh_exports zsh_functions)
for file in ${terminal_files[@]} ; do
    link_file terminal/$file ~/.$file
done

# Install terminal themes
echo "\nInstalling terminal themes"
for themefile in terminal/themes/*.zsh-theme ; do
    link_file $themefile ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/$(basename "$themefile")
done

# Install tmux theme
echo "\nInstalling tmux themes"
for themefile in terminal/themes/*.tmuxtheme ; do
    link_file $themefile ~/.tmux/themes/$(basename "$themefile")
done

# Install Zsh Syntax highlighting and autocomplete
echo "\nInstalling zsh and tmux plugins"
ZSH_SYNTAX_HIGHLIGHTING_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ZSH_SYNTAX_HIGHLIGHTING_REPO="https://github.com/zsh-users/zsh-syntax-highlighting.git"
ZSH_AUTOSUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ZSH_AUTOSUGGESTIONS_REPO="git://github.com/zsh-users/zsh-autosuggestions"
install_clone_repo $ZSH_SYNTAX_HIGHLIGHTING_REPO $ZSH_SYNTAX_HIGHLIGHTING_DIR "Zsh Syntaz Highlighting"
install_clone_repo $ZSH_AUTOSUGGESTIONS_REPO $ZSH_AUTOSUGGESTIONS_DIR "Zsh Autosuggestions"

# Install Tmux Plugin Manager
[ ! -d ~/.tmux/plugins ] && mkdir -p ~/.tmux/plugins
install_clone_repo https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm ~/.tmux/plugins

# Install kwm files
# [ ! -d ~/.kwm ] && mkdir ~/.kwm
# kwm_files=(kwmrc rules spaces)
# for file in ${kwm_files[@]} ; do
#     link_file kwm/$file ~/.kwm/$file
# done
# link_file khd/khdrc ~/.khdrc
link_file kwm/chunkwmrc ~/.chunkwmrc

# Atom files
echo "\nInstalling Atom files and packages"
for file in atom/* ; do
    link_file $file ~/.atom/$(basename $file)
done
ask_for_confirmation "Do you want to install Atom packages?"
if answer_is_yes; then
    apm i --packages-file ~/.atom/packages.list
fi
rm ~/.atom/packages.list

# Git
echo "\nLinking Git files"
link_file git/gitconfig ~/.gitconfig
link_file git/gitignore ~/.gitignore

# Binaries
echo "\nInstalling custom binaries"
binaries=(ssh-key tunnel serve eachdir git-jump pdf-reduce-size brew-update)
for bin in ${binaries[@]} ; do
    link_file bin/$bin /usr/local/bin/$bin
done

# Brew and Cask
echo "\nInstalling packages and apps"
# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
ask_for_confirmation "Do you want to install Brew packages?"
if answer_is_yes; then
    brew bundle --file=install/Brewfile
fi

# System setup
system/setup.sh
