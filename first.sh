#!/bin/bash
#=============================================================
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: cnbbx
#=============================================================

sed -i '$a src-git luciCnbbx https://github.com/kenzok8/openwrt-packages' feeds.conf.default

sed -i '$a src-git luciSmall https://github.com/cnbbx/luci-small' feeds.conf.default

sed -i '$a src-git luciPackages https://github.com/cnbbx/luci-packages' feeds.conf.default
