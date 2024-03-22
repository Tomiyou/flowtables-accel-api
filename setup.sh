

sudo ip netns add turris_lan0
sudo ip link set enxa0a3f0aa75f5 netns turris_lan0
sudo ip netns exec turris_lan0 ip addr add 192.168.80.1/24 dev enxa0a3f0aa75f5
sudo ip netns exec turris_lan0 ip link set enxa0a3f0aa75f5 up

sudo ip netns add turris_lan4
sudo ip link set enx000ec669d86c netns turris_lan4
sudo ip netns exec turris_lan4 ip addr add 192.168.1.51/24 dev enx000ec669d86c
sudo ip netns exec turris_lan4 ip link set enx000ec669d86c up

sudo ip netns exec turris_lan0 bash
sudo ip netns exec turris_lan4 bash


# Turris WAN 80.1
sudo ip netns add turris_wan
sudo ip link set enxa0a3f0aa75f5 netns turris_wan
sudo ip netns exec turris_wan ip addr add 192.168.80.1/24 dev enxa0a3f0aa75f5
sudo ip netns exec turris_wan ip link set enxa0a3f0aa75f5 up






brctl delif br-lan lan0
brctl addif br-lan eth2
ip addr add 192.168.80.10/24 dev lan0

