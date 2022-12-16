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
sed -i 's/OpenWrt/Cnbbx/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/OpenWrt/Cnbbx/g' package/base-files/files/bin/config_generate

# Cancel power on and disable WIFI
sed -i '/set wireless.radio${devidx}.disabled/d' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/argonne/g' feeds/luci/modules/luci-base/root/etc/config/luci

# Modify aria2
sed -i 's/+ariang//g'  feeds/luci/applications/luci-app-aria2/Makefile

# Rom Size
echo '# Rom Size' >> .config
echo 'CONFIG_TARGET_KERNEL_PARTSIZE=64' >> .config
echo 'CONFIG_TARGET_ROOTFS_PARTSIZE=800' >> .config

# Modify the version number
echo '# Image Configurations' >> .config
echo 'CONFIG_IMAGEOPT=y' >> .config
echo 'CONFIG_VERSIONOPT=y' >> .config
echo "CONFIG_VERSION_NUMBER='Cnbbx build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt R22.03'" >> .config
echo 'CONFIG_VERSION_DIST="Cnbbx"' >> .config
echo 'CONFIG_VERSION_FILENAMES=y' >> .config
echo 'CONFIG_VERSION_HOME_URL="http://youku.i.cnbbx.com/"' >> .config

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="Cnbbx"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"Cnbbx"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config 
