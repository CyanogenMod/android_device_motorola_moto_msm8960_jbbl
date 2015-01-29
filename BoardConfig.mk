#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# QCOM SELinux policy
include device/qcom/sepolicy/sepolicy.mk

BOARD_VENDOR := motorola-qcom

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_CPU_VARIANT := krait

-include device/motorola/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/motorola/moto_msm8960_jbbl

TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/motorola/moto_msm8960_jbbl/init/init_moto_msm8960.c

BOARD_USES_LEGACY_MMAP := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/motorola/msm8960-common
TARGET_KERNEL_CONFIG := msm8960_mmi_defconfig
BOARD_KERNEL_CMDLINE := console=/dev/null androidboot.hardware=qcom user_debug=31 loglevel=1 zcache
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01600000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12884901888

# Telephony
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril/MotorolaQualcommRIL.java

# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_USES_MOTOROLA_EMU_AUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DQCOM_BSP_CAMERA_ABI_HACK
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/config/egl.cfg

# Custom relese tools for unified devices
TARGET_RELEASETOOLS_EXTENSIONS := device/motorola/moto_msm8960_jbbl

# Assert
TARGET_OTA_ASSERT_DEVICE := moto_msm8960_jbbl,moto_msm8960,xt901,solstice,xt905,smq_u,scorpion_mini_u,xt907,scorpion_mini,xt925,vanquish_u,xt926,vanquish,mb886,qinara,xt897,asanti,xt897c,asanti_c

# Recovery
TARGET_RECOVERY_DEVICE_DIRS := device/motorola/moto_msm8960_jbbl
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom

# TWRP
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_USERIMAGES_USE_EXT4 := true
# Needs to be changed for M
DEVICE_RESOLUTION := 720x1280
#DEVICE_RESOLUTION := 540x960

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/motorola/moto_msm8960_jbbl/sepolicy

BOARD_SEPOLICY_UNION += \
    atvc.te \
    batt_health.te \
    bootmodem.te \
    device.te \
    file.te \
    file_contexts \
    graphicsd.te \
    location.te \
    mediaserver.te \
    mm-qcamerad.te \
    mpdecision.te \
    netd.te \
    netmgrd.te \
    platform_app.te \
    property_contexts \
    property.te \
    qdumpd.te \
    qmuxd.te \
    rild.te \
    rmt_storage.te \
    sensors.te \
    surfaceflinger.te \
    tee.te \
    thermal-engine.te \
    time_daemon.te \
    ueventd.te \
    vold.te \
    whisperd.te
