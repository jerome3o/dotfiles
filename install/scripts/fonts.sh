mkdir -p ~/.fonts/
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Ubuntu/Medium/complete/Ubuntu%20Medium%20Nerd%20Font%20Complete.ttf
mv Ubuntu\ Medium\ Nerd\ Font\ Complete.ttf ~/.fonts/
fc-cache -f -v
