#!/bin/bash

export VENDOR=motorola
# List of devices in the family for ifdefs
export FAMILY_DEVICE_LIST="mb886 xt897 xt897c"
# Comment these out if there is no common device tree for this device
export COMMON_DEVICE=qcom-common
export BOARD_VENDOR=motorola-qcom
export TARGET_BOARD_PLATFORM=msm8960

../$COMMON_DEVICE/extract-files.sh $@
