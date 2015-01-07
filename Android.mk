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

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

ifeq ($(BOARD_VENDOR),motorola-qcom)
ifeq ($(TARGET_BOARD_PLATFORM),msm8960)
ifeq ($(TARGET_DEVICE),moto_msm8960_jbbl)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := wpa_supplicant_overlay.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := config/$(LOCAL_MODULE)
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

FIRMWARE_DSPS_IMAGES := \
    dsps.b00 dsps.b01 dsps.b02 dsps.b03 dsps.b04 dsps.05 dsps.mdt

FIRMWARE_DSPS_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_DSPS_IMAGES)))
$(FIRMWARE_DSPS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "DSPS Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_DSPS_SYMLINKS)

FIRMWARE_MODEM_IMAGES := \
    modem.b00 modem.b01 modem.b02 modem.b03 modem.b04 modem.b06 modem.b07 modem.mdt

FIRMWARE_MODEM_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_MODEM_IMAGES)))
$(FIRMWARE_MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MODEM_SYMLINKS)

FIRMWARE_MODEM_F1_IMAGES := \
    modem_f1.b00 modem_f1.b01 modem_f1.b02 modem_f1.b03 modem_f1.b04 modem_f1.b05 \
    modem_f1.b06 modem_f1.b07 modem_f1.b08 modem_f1.b09 modem_f1.b10 modem_f1.b13 \
    modem_f1.b14 modem_f1.b21 modem_f1.b22 modem_f1.b23 modem_f1.b25 modem_f1.b26 \
    modem_f1.b29 modem_f1.flist modem_f1.mdt

FIRMWARE_MODEM_F1_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_MODEM_F1_IMAGES)))
$(FIRMWARE_MODEM_F1_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem F1 Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MODEM_F1_SYMLINKS)

FIRMWARE_MODEM_F2_IMAGES := \
    modem_f2.b00 modem_f2.b01 modem_f2.b02 modem_f2.b03 modem_f2.b04 modem_f2.b05 \
    modem_f2.b06 modem_f2.b07 modem_f2.b08 modem_f2.b09 modem_f2.b10 modem_f2.b13 \
    modem_f2.b14 modem_f2.b21 modem_f2.b22 modem_f2.b23 modem_f2.b25 modem_f2.b26 \
    modem_f2.b29 modem_f2.flist modem_f2.mdt

FIRMWARE_MODEM_F2_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_MODEM_F2_IMAGES)))
$(FIRMWARE_MODEM_F2_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem F2 Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MODEM_F2_SYMLINKS)


$(shell mkdir -p $(TARGET_OUT_ETC)/firmware; \
    ln -sf /firmware/image/modem_f2.b00 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b00; \
    ln -sf /firmware/image/modem_f2.b01 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b01; \
    ln -sf /firmware/image/modem_f2.b02 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b02; \
    ln -sf /firmware/image/modem_f2.b03 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b03; \
    ln -sf /firmware/image/modem_f2.b04 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b04; \
    ln -sf /firmware/image/modem_f2.b05 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b05; \
    ln -sf /firmware/image/modem_f2.b06 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b06; \
    ln -sf /firmware/image/modem_f2.b07 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b07; \
    ln -sf /firmware/image/modem_f2.b08 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b08; \
    ln -sf /firmware/image/modem_f2.b09 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b09; \
    ln -sf /firmware/image/modem_f2.b10 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b10; \
    ln -sf /firmware/image/modem_f2.b13 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b13; \
    ln -sf /firmware/image/modem_f2.b14 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b14; \
    ln -sf /firmware/image/modem_f2.b21 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b21; \
    ln -sf /firmware/image/modem_f2.b22 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b22; \
    ln -sf /firmware/image/modem_f2.b23 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b23; \
    ln -sf /firmware/image/modem_f2.b25 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b25; \
    ln -sf /firmware/image/modem_f2.b26 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b26; \
    ln -sf /firmware/image/modem_f2.b29 \
    $(TARGET_OUT_ETC)/firmware/modem_fw.b29; \
    ln -sf /firmware/image/modem_f2.flist \
    $(TARGET_OUT_ETC)/firmware/modem_fw.flist; \
    ln -sf /firmware/image/modem_f2.mdt \
    $(TARGET_OUT_ETC)/firmware/modem_fw.mdt)

FIRMWARE_Q6_IMAGES := \
    q6.b00 q6.b01 q6.b03 q6.b04 q6.b05 q6.b06 q6.mdt

FIRMWARE_Q6_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_Q6_IMAGES)))
$(FIRMWARE_Q6_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Q6 Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_Q6_SYMLINKS)

FIRMWARE_TZAPPS_IMAGES := \
    tzapps.b00 tzapps.b01 tzapps.b02 tzapps.b03 tzapps.mdt

FIRMWARE_TZAPPS_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_TZAPPS_IMAGES)))
$(FIRMWARE_TZAPPS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "TZ Apps Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_TZAPPS_SYMLINKS)

FIRMWARE_WCNSS_IMAGES := \
    wcnss.b00 wcnss.b01 wcnss.b02 wcnss.b04 wcnss.mdt

FIRMWARE_WCNSS_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_WCNSS_IMAGES)))
$(FIRMWARE_WCNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_WCNSS_SYMLINKS)

endif
endif
endif
