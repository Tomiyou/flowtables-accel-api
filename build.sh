# Ubuntu 22.04 docker container
sudo apt install gawk python3-distutils file rsync unzip

# Clone Openwrt
git clone https://git.openwrt.org/openwrt/openwrt.git
git checkout v23.05.2

# Update packages
./scripts/feeds update -a
./scripts/feeds install -a

# Config
make menuconfig
# choose:
# - choose turris omnia target
# - enable conntrack package
# - enable nft-bridge package

