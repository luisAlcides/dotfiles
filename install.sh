#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y git python3-pip python3-dev libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev libdbus-1-dev
sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev
sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
sudo apt install -y xclip
sudo apt install -y gnome-tweaks
sudo apt install -y gnome-shell-extension-manager
sudo apt install -y python3.12-venv
sudo apt install -y lsd bat
sudo apt install -y libxcb-cursor-dev
curl -sS https://starship.rs/install.sh | sh

#kitty

mkdir -p ~/.local/bin
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
~/.local/kitty.app/bin/kitty
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/kitty

mkdir -p ~/.local/share/icons/hicolor/256x256/apps
mkdir -p ~/.local/share/applications
cp ~/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png ~/.local/share/icons/hicolor/256x256/apps/
gtk-update-icon-cache ~/.local/share/icons/hicolor

#Nodejs
wget https://nodejs.org/dist/v20.16.0/node-v20.16.0-linux-x64.tar.xz
tar -xvf node-v20.16.0-linux-x64.tar.xz
sudo mv node-v20.16.0-linux-x64 /usr/local/node-v20.16.0
sudo ln -s /usr/local/node-v20.16.0/bin/node /usr/local/bin/node
sudo ln -s /usr/local/node-v20.16.0/bin/npm /usr/local/bin/npm
sudo ln -s /usr/local/node-v20.16.0/bin/npx /usr/local/bin/npx

export PATH=$HOME/.local/bin:$PATH

# conf
sudo apt install -y zsh-syntax-highlighting
sudo apt install -y zsh-autosuggestions
sudo mv /home/heracle/Documents/* /usr/share/fonts
sudo cp -r /home/heracle/dotfiles/sudo-plugin /usr/share
cp -r /home/heracle/dotfiles/kitty /home/heracle/.config
cp -r /home/heracle/dotfiles/.zshrc /home/heracle
cp /home/heracle/dotfiles/starship.toml /home/heracle/.config

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

git clone https://github.com/LazyVim/starter ~/.config/nvim
cp -r /home/heracle/dotfiles/nvim /home/heracle/.config

chsh -s $(which zsh)
sudo chsh -s $(which zsh)

sudo ln -s /home/heracle/.zshrc /root/.zshrc

ssh-keygen -t rsa -b 4096 -C "luisalcidesblandon@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git config --global user.name "luisAlcides"
git config --global user.email "luisalcidesblandon@gmail.com"
cat ~/.ssh/id_rsa.pub