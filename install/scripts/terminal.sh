
# Append to .bashrc
cat << EOF >> ~/.bashrc
if [ -f ~/.jeromebashrc.sh ]; then
  . ~/.jeromebashrc.sh
fi
EOF

DISTRO=$(lsb_release -si)

PACKAGES="curl git htop neofetch python3 python3-pip python3-venv ranger ripgrep tmux wget jq"

case "$DISTRO" in
  Ubuntu)
    sudo apt update
    sudo apt install -y $PACKAGES fd-find
    ;;
  Debian)
    sudo apt update
    sudo apt install -y $PACKAGES fd-find
    ;;
  Arch)
    sudo pacman -Syu
    sudo pacman -S --noconfirm $PACKAGES fd
    ;;
  *)
    echo "Unknown distro: $DISTRO"
    ;;
esac

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

. ~/scripts/nvim.sh
. ~/scripts/tmux.sh
. ~/scripts/fonts.sh
. ~/scripts/fzf.sh
