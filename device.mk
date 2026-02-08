#
# Copyright (C) 2026 The TWRP Open Source Project
#

LOCAL_PATH := device/realme/RMX3930

# A/B OTA Postinstall
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL (Смена слотов A/B)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    bootctrl.ums9230

# Virtual A/B (Стандарт Android 15)
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

# Службы обновления (Update Engine)
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    update_engine_sideload

# Отладка обновлений
PRODUCT_PACKAGES_DEBUG += \
    update_engine_client 

# Dynamic partitions (Обязательно для твоего Super)
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Работа со снимками разделов (Virtual A/B)
PRODUCT_PACKAGES += \
    libsnapshot \
    libdm

# Инструменты для EROFS (Стандарт Android 15)
PRODUCT_PACKAGES += \
    erofs_utils \
    fsck.erofs \
    mkfs.erofs

# Системные утилиты
PRODUCT_PACKAGES += \
    toybox

# Здоровье и зарядка (Версия V1-ndk для Android 15)
PRODUCT_PACKAGES += \
    android.hardware.health-V1-ndk

# VNDK & API Level (Android 15)
PRODUCT_SHIPPING_API_LEVEL := 35
PRODUCT_TARGET_VNDK_VERSION := 35

# A/B & Virtual A/B Optimization
PRODUCT_ENABLE_UFFD_GC := true
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Fastbootd (Обязательно для динамических разделов)
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd
