
# Append to .bashrc
cat << EOF >> ~/.bashrc
if [ -f ~/.jeromebashrc.sh ]; then
  . ~/.jeromebashrc.sh
fi
EOF

. ~/scripts/nvim.sh
. ~/scripts/tmux.sh
. ~/scripts/fonts.sh

