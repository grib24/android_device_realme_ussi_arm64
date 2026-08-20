# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from TWRP product core configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from device-specific configuration
$(call inherit-product, realme/latte/device.mk)

# Product Details Configured for Realme C61 (latte)
PRODUCT_DEVICE := latte
PRODUCT_NAME := twrp_latte
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX3930
PRODUCT_MANUFACTURER := realme

PRODUCT_GMS_CLIENTID_BASE := android-realme

# Official Russia Android 16 Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="RE6054" \
    PRODUCT_NAME="RMX3930RU" \
    TARGET_PRODUCT="RMX3930RU" \
    BUILD_FINGERPRINT="realme/RMX3930RU/RE6054:16/BP2A.250605.031.A3/U.1783691494:user/release-keys"
