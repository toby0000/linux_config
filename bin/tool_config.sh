#!/bin/bash

# platform
PLATFORM=macan

# android build config 
# you also can set LUNCH_CONFIG=aosp_cranberry-userdebug
LUNCH_CONFIG=7

# kernel build config
KERNEL_CONFIG=.config_macan_SMP_android_dts

# utopia build config
UTOPIA_MBOOT_CONFIG=.config_macan_nos_arm32_softfloat_static_mboot
UTOPIA_SN_CONFIG=.config_macan_linux_arm_hardfloat_dynamic_general 

# mboot build config
MBOOT_PATH=~/mboot
MBOOT_CONFIG=.config.macan.android.104b.rom_emmc.tee

# supernova build config
SN_PATH=~/supernova
SN_CONFIG=build_Macan_104B_ROM_EMMC_TVOS_DVB_URSA6.sh

# tftp path
TFTP_PATH=/tftpboot

# update_git_from_rtc config
RTC_SN_PATH=
MY_SN_PATH=
