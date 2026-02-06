#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/orange_ussi_arm64.mk

COMMON_LUNCH_CHOICES := \
    orange _ussi_arm64-user \
    orange _ussi_arm64-userdebug \
    orange _ussi_arm64-eng
