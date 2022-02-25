# Configure Sound / Alsa

To get sound playing through the front and back headphone jacks simultaneously

From terminal run `alsamixer`, navigate to Auto-Mute (you may not be able to see it initially if the terminal isn't maximised), and set to disabled.


# Go

Install go  (based off https://go.dev/doc/install)

This is here and not in the script because I think it depends on the CPU

```
wget https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
rm go1.17.7.linux-amd64.tar.gz
```