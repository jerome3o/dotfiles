
# Append to .bashrc
cat << EOF >> ~/.bashrc
if [ -f ~/.jeromebashrc.sh ]; then
  . ~/.jeromebashrc.sh
fi
EOF

DISTRO=$(lsb_release -si)

PACKAGES="curl git htop neofetch neovim python3 python3-pip python3-venv ranger ripgrep tmux wget"

case "$DISTRO" in
  Ubuntu)
    sudo apt update
    sudo apt install -y $PACKAGES
    ;;
  Arch)
    sudo pacman -Syu
    sudo pacman -S --noconfirm $PACKAGES 
    ;;
  *)
    echo "Unknown distro: $DISTRO"
    ;;
esac

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

. ~/scripts/nvim.sh
. ~/scripts/tmux.sh
. ~/scripts/fonts.sh

