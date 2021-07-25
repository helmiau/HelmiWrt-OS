#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Set Argon theme to light on first boot
uci set argon.@global[0].mode='light'

# Set hostname to HelmiWrt
uci set system.@system[0].hostname='HelmiWrt'

# Set Timezone to Asia/Jakarta
uci set system.@system[0].timezone='WIB-7'
uci set system.@system[0].zonename='Asia/Jakarta'

# Set default language to Auto
uci set luci.main.lang='auto'
sed -i "s/'zh_cn'/'auto'/g" /etc/config/luci
# uci set luci.main.lang=en
# sed -i "s/'zh_cn'/'en'/g" /etc/config/luci

#uci commit
uci commit

# Disable autostart by default for some packages
cd /etc/rc.d
rm -f S98udptools || true

# Add shadowsocksr shortcut
chmod +x /bin/ssr-rst
chmod +x /bin/ssr-start
chmod +x /bin/ssr-stop

# Added neofetch on oh-my-zsh
if grep -q neofetch "/root/.oh-my-zsh/custom/example.zsh"; then
    echo "neofetch available, then skip"
else
	echo "neofetch" > /root/.oh-my-zsh/custom/example.zsh
fi

# Vmess creator shortcut
chmod +x /bin/vmess

# Add ram checker from wegare123
# run "ram" using terminal to check ram usage
chmod +x /bin/ram

# Add fix download file.php for xderm and libernet
# run "fixphp" using terminal for use
chmod +x /bin/fixphp

# Add IP Address Info Checker
# run "myip" using terminal for use
chmod +x /bin/myip

exit 0
