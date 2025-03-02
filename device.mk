#
# Copyright (C) 2016 The CyanogenMod Project
#               2017-2018 The LineageOS Project
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

# Get common aspects
$(call inherit-product, device/sony/kitakami-common/device-common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/sony/ivy/ivy-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/init.qcom.power.sh:system/bin/init.qcom.power.sh

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/clearpad.idc:system/usr/idc/clearpad.idc

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# NFC configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/configs/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/qmi_config.xml:system/etc/data/qmi_config.xml

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:system/etc/thermal-engine.conf

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wlan/bcmdhd.cal:system/etc/firmware/wlan/bcmdhd/bcmdhd.cal

# Ubuntu touch session
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ubuntu/android.conf:system/halium/etc/ubuntu-touch-session.d/android.conf
