
# Append to .bashrc
cat << EOF >> ~/.bashrc
if [ -f ~/.jeromebashrc.sh ]; then
  . ~/.jeromebashrc.sh
fi
EOF

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

. ~/scripts/nvim.sh
. ~/scripts/tmux.sh
. ~/scripts/fonts.sh

