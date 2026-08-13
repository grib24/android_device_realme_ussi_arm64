# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

DEVICE_PATH := device/latte

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT := generic

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ums9230_latte
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel Specs Configured for Realme C61 Stock (921600n8 console speed)
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,921600n8 bootconfig bootconfig
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Prebuilt DTB Image configuration (Obligatory for vendor_boot Header v4)
TARGET_FORCE_PREBUILT_KERNEL := false
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600

# Указываем, что recovery должен быть в vendor_boot
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_USES_VENDOR_BOOT := true

# Указываем путь к recovery.img, который будет упакован в vendor_boot
BOARD_PREBUILT_VENDOR_RAMDISK := $(TARGET_OUT)/recovery.img

# Принудительно включаем сборку recovery
TARGET_NO_RECOVERY := false

# Recovery fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.ums9230_latte

# Platform
TARGET_BOARD_PLATFORM := ums9230

# Recovery Graphic Format for Unisoc Mali
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_SUPPORT_INPUT_AIDL := true
TW_INCLUDE_CRYPTO := true
TW_USE_FSCRYPT_POLICY := 2
TW_INCLUDE_FASTBOOTD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true

PLATFORM_VERSION := 16
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# Добавляем поддержку 32-битных приложений на 64-битном устройстве
TARGET_SUPPORTS_64_BIT_APPS := false
