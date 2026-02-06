#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/otter/config/common.mk)

# Inherit from ussi_arm64 device
$(call inherit-product, device/realme/ussi_arm64/device.mk)

PRODUCT_DEVICE := ussi_arm64
PRODUCT_NAME := orange_ussi_arm64
PRODUCT_BRAND := realme
PRODUCT_MODEL := ussi_arm64_full
PRODUCT_MANUFACTURER := realme

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ussi_arm64_full-user 15 AP3A.240905.015.A2 94 release-keys"

BUILD_FINGERPRINT := realme/RMX3930/RE6054:15/AP3A.240905.015.A2/U.R4T2.1756131235:user/release-keys
