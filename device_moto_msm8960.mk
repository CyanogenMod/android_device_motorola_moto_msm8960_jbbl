# Copyright (C) 2014 The CyanogenMod Project
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

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/motorola/moto_msm8960_jbbl

## overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += hdpi xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8960

# HAL
PRODUCT_PACKAGES += \
    camera.msm8960 \
    copybit.msm8960 \
    gps.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    lights.MSM8960 \
    memtrack.msm8960 \
    nfc.msm8960 \
    power.msm8960

# Motorola
PRODUCT_PACKAGES += \
    batt_health \
    charge_only_mode \
    graphicsd \
    mot_boot_mode

# Misc
PRODUCT_PACKAGES += \
    DevicePerformanceSettingsHelper \
    sqlite3

# Symlinks
PRODUCT_PACKAGES += \
    mbhc.bin \
    wcd9310_anc.bin

# GPS configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf

# EGL config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/egl.cfg:system/lib/egl/egl.cfg

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wlan/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wlan/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# Init scripts
PRODUCT_PACKAGES += \
    init.qcom.post_boot.sh \
    init.qcom.sh

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/config/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
    $(LOCAL_PATH)/config/snd_soc_msm_2x_xt92x:system/etc/snd_soc_msm/snd_soc_msm_2x_xt92x

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/media_profiles_xt90x.xml:system/etc/media_profiles_xt90x.xml \
    $(LOCAL_PATH)/config/media_codecs_aosp.xml:system/etc/media_codecs.xml

# XT90x recovery
PRODUCT_COPY_FILES += \
    device/motorola/qcom-common/idc/atmxt-i2c.idc:recovery/root/vendor/firmware/atmxt-i2c.idc \
    vendor/motorola/moto_msm8960_jbbl/proprietary/etc/firmware/atmxt-r2.tdat:recovery/root/vendor/firmware/atmxt-r2.tdat

# Alternate optional key maps
PRODUCT_PACKAGES += \
    AsantiKeypad

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.usb.mtp=0x2e62 \
    ro.usb.mtp_adb=0x2e63 \
    ro.usb.ptp=0x2e64 \
    ro.usb.ptp_adb=0x2e65 \
    ro.usb.bpt=0x2e28 \
    ro.usb.bpt_adb=0x2e29 \
    ro.usb.bpteth=0x2e2a \
    ro.usb.bpteth_adb=0x2e2b \
    ro.hdmi.enable=true \
    ro.cwm.forbid_format="/fsg,/firmware,/persist,/modem,/boot"

# Opengles version 2
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnCdmaDevice=1 \
	persist.radio.dfr_mode_set=1 \
	persist.radio.eons.enabled= true \
	ro.telephony.default_network=10 \
	persist.radio.mode_pref_nv10=1 \
	persist.radio.no_wait_for_card=1 \
	persist.radio.call_type=1 \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.timed.enable=true

# Radio and Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=MotorolaQualcommRIL

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    persist.fuse_sdcard=true \
    ro.qc.sdk.audio.fluencetype=fluence

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

$(call inherit-product, device/motorola/qcom-common/qcom-common.mk)
$(call inherit-product, device/motorola/qcom-common/idc/idc.mk)
$(call inherit-product, device/motorola/qcom-common/keychars/keychars.mk)
$(call inherit-product, device/motorola/qcom-common/keylayout/keylayout.mk)
$(call inherit-product, device/motorola/qcom-common/modules/nfc/nfc.mk)
$(call inherit-product, vendor/motorola/moto_msm8960_jbbl/moto_msm8960_jbbl-vendor.mk)
