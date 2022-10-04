# Script setup
if [[ $BASH_SOURCE = */* ]]; then
    scriptdit=${BASH_SOURCE%/*}/
else
    scriptdir=./
fi
cd $HOME


# Editors

## Emacs
### install emacs
sudo pacman -S emacs-nativecomp
### install doom emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

## NeoVim
### install NeoVim
sudo pacman -S neovim
curl -sLf https://spacevim.org/install.sh | bash


# Terminal emulator

## Kitty
sudo pacman -S kitty

## Starship prompt
curl -sS https://starship.rs/install.sh | sh
echo "eval \"$(starship init bash)\"" >> $HOME/.bashrc

## Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Tools

## General
sudo pacman -S exa bat fd ripgrep ripgrep-all make

## VSCode
sudo pacman -S flatpak libpamac-flatpak-plugin
flatpak install com.visualstudio.code


# Programming languages

## Haskell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

## Scala (sacala-cli)
curl -sSLf https://virtuslab.github.io/scala-cli-packages/scala-setup.sh | sh

## Python

# Window manager

## xMonad
mkdir -p $HOME/.xmonad
cd $HOME/.xmonad

git clone --branch v0.17.0 https://github.com/xmonad/xmonad
git clone --branch v0.17.0 https://github.com/xmonad/xmonad-contrib

echo "packages: */*.cabal" > cabal.project

cabal update
cabal install --package-env=$HOME/.xmonad --lib xmonad xmonad-contrib
cabal install --package-env=$HOME/.xmonad xmonad

cd $HOME
mkdir -p $hOME/.config/plasma-workspace/env
echo "export KDEWM=$HOME/.cabal/bin/xmonad" > set_window_manager.sh


# General configuration

## Swap CapsLock and Esc
## Symlink to config files
cd ${scriptdir}
ln -sf ./.aliases $HOME/.aliases
ln -sf ./.zshrc $HOME/.zshrc
ln -sf ./xmonad.hs $HOME/.xmonad/xmonad.hs
ln -sf ./.tmux.conf $HOME/.tmux.conf
ln -sf ./.doom.d $HOME/.doom.d
