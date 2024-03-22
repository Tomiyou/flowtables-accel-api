nft flush ruleset

# NAT
nft add table nat
nft -- add chain nat prerouting { type nat hook prerouting priority -100 \; }
nft add chain nat postrouting { type nat hook postrouting priority 100 \; }
nft add rule nat postrouting oifname "eth2" masquerade

# Flowtable
nft add table ip filter
nft add flowtable ip filter f { hook ingress priority 0\; devices = { eth2, lan0, lan1, lan2, lan3, lan4, phy0-ap0, phy1-ap0 }\; counter\; flags offload\; }
nft add chain ip filter forward { type filter hook forward priority 0\; }
nft add rule ip filter forward ip protocol tcp flow add @f

# Bridge
nft add table bridge filter
nft add chain bridge filter forward '{type filter hook forward priority 0; }'
nft add rule bridge filter forward ct protocol tcp counter

nft add rule bridge filter forward ether type ip counter
nft add rule bridge filter forward ether type ip tcp dport 5201 drop

nft list ruleset



nft add table bridge filter
nft add flowtable bridge filter x { hook ingress priority 0\; devices = { lan0, lan4, phy1-ap0, phy-ap0 }\; }
nft add chain bridge filter forward { type filter hook forward priority 0\; }
nft add rule bridge filter forward bridge protocol tcp flow add @x





# Reload flowtables .ko
rmmod nft_flow_offload
rmmod nf_flow_table_ipv6
rmmod nf_flow_table_ipv4
rmmod nf_flow_table_inet
rmmod nf_flow_table

insmod nf_flow_table.ko
modprobe nf_flow_table_inet
modprobe nf_flow_table_ipv4
modprobe nf_flow_table_ipv6
modprobe nft_flow_offload
