#!/bin/bash
#=============================================================
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: cnbbx
#=============================================================

sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default

sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

sed -i '$a src-git mepackages https://github.com/zhoujinshi/luci-packages' feeds.conf.default
