sudo apt-get update
sudo apt-get -y install default-jre
sudo update-alternatives --config java
sudo wget -O /usr/local/bin/RuneLite.jar https://github.com/runelite/launcher/releases/download/1.6.2/RuneLite.jar
sudo chmod 755 /usr/local/bin/RuneLite.jar
sudo wget -O /usr/local/share/RuneLite.png https://github.com/runelite/runelite/raw/master/runelite-client/src/main/resources/runelite.png

sudo tee /usr/share/applications/runelite.desktop > /dev/null <<EOT
[Desktop Entry]
Encoding=UTF-8
Type=Application
Exec=java -jar /usr/local/bin/RuneLite.jar
Name=RuneLite
Comment=RuneLite launcher
Icon=/usr/local/share/RuneLite.png
Categories=Game
EOT
