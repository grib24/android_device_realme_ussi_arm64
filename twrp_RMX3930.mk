# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from RMX3930 device
$(call inherit-product, device/realme/RMX3930/device.mk)

PRODUCT_DEVICE := RMX3930
PRODUCT_NAME := twrp_RMX3930
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme C61
PRODUCT_MANUFACTURER := realme
