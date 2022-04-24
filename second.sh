#!/bin/bash
#============================================================
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: cnbbx
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/LEDE/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/OpenWrt/LEDE/g' package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /cnbbx build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/argonne/g' feeds/luci/modules/luci-base/root/etc/config/luci

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="cnbbx"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"cnbbx"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
