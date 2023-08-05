# kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# make sure this is ok
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# then install
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


# helm

wget https://get.helm.sh/helm-v3.12.2-linux-amd64.tar.gz
tar -zxvf helm-v3.12.2-linux-amd64.tar.gz
rm helm-v3.12.2-linux-amd64.tar.gz
mv linux-amd64/helm ~/.local/bin/
rm -rf linux-amd64


# k9s

wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
mkdir k9s_Linux_amd64
tar -zxvf k9s_Linux_amd64.tar.gz -C k9s_Linux_amd64
chmod +x k9s_Linux_amd64/k9s
mkdir ~/.local/bin/
mv k9s_Linux_amd64/k9s ~/.local/bin/

rm k9s_Linux_amd64.tar.gz
rm -rf k9s_Linux_amd64/


# kubeseal

wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.23.0/kubeseal-0.23.0-linux-amd64.tar.gz
tar -xvzf kubeseal-0.23.0-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
rm kubeseal kubeseal-0.23.0-linux-amd64.tar.gz
