# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from TWRP base configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Блок PRODUCT_COPY_FILES оставляем пустым.
# В Android 16 автоматика сама возьмет fstab из BoardConfig.mk (через TARGET_RECOVERY_FSTAB)
PRODUCT_COPY_FILES +=

# Soong namespaces для поиска ваших HAL-модулей устройства
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
