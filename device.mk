#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/realme/ussi_arm64

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL (Исправлено для Android 12.1)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl-recovery \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-service.recovery

PRODUCT_PACKAGES += \
    bootctrl.ussi \
    libgptutils \
    libz \
    libcutils

# Update Engine
PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier \
    update_engine_sideload

# Дополнительные пакеты для OrangeFox
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh
