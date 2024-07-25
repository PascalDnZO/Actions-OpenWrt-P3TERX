(echo "dnzo"; sleep 1; echo "dnzo") | passwd > /dev/null

# Configure LAN
uci set network.lan.ipaddr="192.168.11.1"
uci commit network

# configure AP radio0 atau 2.4GHz
uci set wireless.@wifi-device[0].disabled='0'
uci set wireless.@wifi-device[0].channel='11'
uci set wireless.@wifi-device[0].country='US'
uci set wireless.@wifi-iface[0].encryption='psk2'
uci set wireless.@wifi-iface[0].ssid="DnZO_wrt"
uci set wireless.@wifi-iface[0].key="internet1"
uci commit wireless


# ubah hostname dan zone time
uci del system.ntp.enabled
uci del system.ntp.enable_server
uci set system.@system[0].log_proto='udp'
uci set system.@system[0].conloglevel='8'
uci set system.@system[0].cronloglevel='5'
uci set system.@system[0].hostname='DnZO-store'
uci set system.@system[0].zonename='Asia/Jakarta'
uci set system.@system[0].timezone='WIB-7'
uci commit system

#uncheck rebind protection
uci del dhcp.@dnsmasq[0].rebind_localhost
uci del dhcp.@dnsmasq[0].nonwildcard
uci del dhcp.@dnsmasq[0].boguspriv
uci del dhcp.@dnsmasq[0].filterwin2k
uci del dhcp.@dnsmasq[0].nonegcache
uci set dhcp.@dnsmasq[0].rebind_protection='0'
uci commit dhcp

uci add dhcp domain
uci set dhcp.@domain[0].name='welcome2.wifi.id'
uci set dhcp.@domain[0].ip='10.233.16.13'
uci add dhcp domain
uci set dhcp.@domain[1].name='logout.wifi.id'
uci set dhcp.@domain[1].ip='10.233.16.13'
uci add dhcp domain
uci set dhcp.@domain[2].name='welcome3.wifi.id'
uci set dhcp.@domain[2].ip='118.98.34.148'
uci commit dhcp
