mkdir -p ~/source/
git clone https://github.com/universal-ctags/ctags.git ~/source/ctags
cd ~/source/ctags
./autogen.sh
./configure --prefix=/where/you/want # defaults to /usr/local
make
sudo make install # may require extra privileges depending on where to install
cd -
