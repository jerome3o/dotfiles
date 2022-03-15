# KVM

# Install reqs
sudo apt -y install \
    bridge-utils \
    cpu-checker \
    libvirt-clients \
    libvirt-daemon \
    qemu \
    qemu-kvm \
    virt-manager \
    virt-viewer

# Check it's ok
kvm-ok

# check libvirt is running
ps -ef | grep libvirt

usermod -aG libvirt jerome
usermod -aG kvm jerome

