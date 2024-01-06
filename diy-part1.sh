#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
if [[ -e $CONFIG_FILE_MT798X ]]; then
   echo "RAX3000M feeds configuration"
   if [ ${REPO_URL}==*"mt798x"* ];then
      #Get easymesh from lede_luci for immortal-mt798x
      echo 'src-git lede_luci https://github.com/coolsnowwolf/luci.git' >>feeds.conf.default
   fi
elif [[ $CONFIG_FILE = *"x86_64"* ]]; then
   echo "X86_64 feeds configuration"
else
   echo "Use default feeds"
fi

echo 'src-git OpenClash https://github.com/vernesong/OpenClash;master' >>feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >>feeds.conf.default
#echo 'src-git speedtest https://github.com/sirpdboy/netspeedtest.git' >>feeds.conf.default

#echo 'src-git lede_pakcages https://github.com/coolsnowwolf/packages.git' >>feeds.conf.default
#echo 'src-git easymesh https://github.com/ntlf9t/luci-app-easymesh.git'>>feeds.conf.default
#echo 'src-git batman_adv https://github.com/onemarcfifty/luci-proto-batman-adv.git' >>feeds.conf.default

#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git lede_luci https://github.com/coolsnowwolf/luci.git>>feeds.conf.default
#echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main'>>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git OpenClash https://github.com/vernesong/OpenClash;master' >>feeds.conf.default

cat feeds.conf.default

