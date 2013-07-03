# Copyright (C) 2012 FXP (FreeXperia)
# Copyright (C) 2013 The Open SEMC Team
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from Sony common
-include device/sony/common/BoardConfigCommon.mk

# inherit from qcom-common
-include device/sony/qcom-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/sony/fuji-common/include

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/msm8x60

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8660
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Vendor
BOARD_VENDOR := sony

# Architecture
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_BOOTLOADER_BOARD_NAME := fuji
TARGET_VENDOR_PLATFORM := fuji

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Scorpion optimizations
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

# Kernel information
BOARD_KERNEL_CMDLINE := # This is ignored by sony's bootloader
BOARD_KERNEL_BASE := 0x40200000
BOARD_RECOVERY_BASE := 0x40200000
BOARD_KERNEL_PAGESIZE := 2048

# Wifi related defines
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcm4330/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4330b2.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4330b2_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4330b2_p2p.bin"
#BOARD_LEGACY_NL80211_STA_EVENTS  := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := semc
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
TARGET_NEEDS_BLUETOOTH_INIT_DELAY := true
TARGET_CUSTOM_BLUEDROID := ../../../device/sony/fuji-common/bluedroid/bluetooth.c
BOARD_BLUEDROID_VENDOR_CONF := device/sony/fuji-common/bluetooth/vnd_msm8660.txt

# Custom boot
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_PRE_COMMAND := "touch /cache/recovery/boot;sync;"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/fuji-common/custombootimg.mk

# AOSP releasetools extensions
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/fuji-common

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Audio
COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED -DQCOM_VOIP_ENABLED
BOARD_HAVE_SONY_AUDIO := true
BOARD_HAVE_BACK_MIC_CAMCORDER := true
BOARD_USE_QCOM_LPA := true

# FM radio
#COMMON_GLOBAL_CFLAGS += -DSTE_FM
#BOARD_USES_STE_FMRADIO := true

# TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true

# Sensors
SOMC_CFG_SENSORS := true
SOMC_CFG_SENSORS_LIGHT_AS3676 := yes
SOMC_CFG_SENSORS_LIGHT_AS3676_MAXRANGE := 13000
SOMC_CFG_SENSORS_GYRO_MPU3050 := yes
SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes
SOMC_CFG_SENSORS_ACCEL_BMA250NA_INPUT := yes
SOMC_CFG_SENSORS_COMPASS_AK8972 := yes

# inherit from fuji-common
-include vendor/sony/fuji-common/BoardConfigCommon.mk
