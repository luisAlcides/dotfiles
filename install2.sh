#!/bin/bash

set -e
echo "🚀 Iniciando instalación completa para ciencia de datos + entorno Linux personalizado"

# -------------------------
# 🧱 Actualizar sistema
# -------------------------
sudo apt update -y && sudo apt upgrade -y

# -------------------------
# 🔧 Paquetes esenciales
# -------------------------
sudo apt install -y \
  git curl wget unzip build-essential cmake \
  python3-pip python3-venv python3-dev \
  libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev \
  libxkbcommon-dev libdbus-1-dev libasound2-dev libpulse-dev \
  libxcb-cursor-dev libx11-xcb-dev libgl1-mesa-dev \
  bat lsd htop tree ncdu xclip zsh zsh-syntax-highlighting zsh-autosuggestions \
  gnome-tweaks gnome-shell-extension-manager \
  libreoffice xdotool

# -------------------------
# 🐍 Ciencia de datos
# -------------------------
pip3 install --upgrade pip
pip3 install numpy pandas matplotlib seaborn plotly scikit-learn \
            jupyterlab ipywidgets statsmodels \
            openpyxl xlrd xlsxwriter sqlalchemy psycopg2-binary \
            jupyter_contrib_nbextensions

# -------------------------
# 📘 Jupyter extensiones
# -------------------------
jupyter contrib nbextension install --user
jupyter nbextension enable codefolding/main

# -------------------------
# 🐘 PostgreSQL + pgcli
# -------------------------
sudo apt install -y postgresql postgresql-contrib
pip3 install pgcli

# -------------------------
# 🐳 Docker (opcional pero recomendado)
# -------------------------
sudo apt install -y ca-certificates gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker "$USER"

# -------------------------
# 🧠 Neovim + LazyVim
# -------------------------
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage && sudo mv nvim.appimage /usr/local/bin/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# -------------------------
# 🐱 Kitty terminal
# -------------------------
mkdir -p ~/.local/bin
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/kitty

# -------------------------
# ⭐ Starship Prompt
# -------------------------
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# -------------------------
# 🧠 Node.js LTS
# -------------------------
wget https://nodejs.org/dist/v20.16.0/node-v20.16.0-linux-x64.tar.xz
tar -xf node-v20.16.0-linux-x64.tar.xz
sudo mv node-v20.16.0-linux-x64 /usr/local/node-v20.16.0
sudo ln -s /usr/local/node-v20.16.0/bin/node /usr/local/bin/node
sudo ln -s /usr/local/node-v20.16.0/bin/npm /usr/local/bin/npm
sudo ln -s /usr/local/node-v20.16.0/bin/npx /usr/local/bin/npx
rm node-v20.16.0-linux-x64.tar.xz

# -------------------------
# 🎨 Temas GTK + Iconos
# -------------------------
sudo apt install -y papirus-icon-theme

# Temas adicionales (puedes cambiar desde Gnome Tweaks)
mkdir -p ~/.themes ~/.icons

# Nordic
git clone https://github.com/EliverLara/Nordic ~/.themes/Nordic

# Orchis
git clone https://github.com/vinceliuice/Orchis-theme
cd Orchis-theme && ./install.sh && cd .. && rm -rf Orchis-theme

# WhiteSur
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme
cd WhiteSur-gtk-theme && ./install.sh && cd .. && rm -rf WhiteSur-gtk-theme

# -------------------------
# ⚙️ ZSH configuración
# -------------------------
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
cp /home/$USER/dotfiles/.zshrc /home/$USER/
cp /home/$USER/dotfiles/starship.toml /home/$USER/.config/

# -------------------------
# 🔐 SSH + Git config
# -------------------------
ssh-keygen -t rsa -b 4096 -C "luisalcidesblandon@gmail.com" -f ~/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

git config --global user.name "luisAlcides"
git config --global user.email "luisalcidesblandon@gmail.com"

echo "🔑 Clave pública SSH:"
cat ~/.ssh/id_rsa.pub

echo "✅ Instalación completada. Reinicia para aplicar algunos cambios como Docker y Zsh."
