mkdir -p ~/.fonts/
mkdir -p ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Ubuntu/Medium/complete/Ubuntu%20Medium%20Nerd%20Font%20Complete.ttf
cp Ubuntu\ Medium\ Nerd\ Font\ Complete.ttf ~/.fonts/
cp Ubuntu\ Medium\ Nerd\ Font\ Complete.ttf ~/.local/share/fonts/
rm Ubuntu\ Medium\ Nerd\ Font\ Complete.ttf 

fc-cache -f -v
