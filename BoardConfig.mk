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

# Kernel Specs
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,921600n8 bootconfig bootconfig
BOARD_KERNEL_PAGESIZE := 4096

# Исправление синтаксиса аргументов mkbootimg для корректной сборки Header v4 в Android 16
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --vendor_boot_header_version $(BOARD_BOOT_HEADER_VERSION)

# Отключаем сборку boot.img, так как ядро встроенного стока нам не нужно
TARGET_NO_KERNEL := true

# Prebuilt DTB Image configuration (Обязательно для vendor_boot Header v4)
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilts
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600

# ========== СТРУКТУРА РАЗДЕЛОВ ПОД VENDOR_BOOT (Android 16) ==========
# Включаем использование разделения vendor_boot
BOARD_USES_VENDOR_BOOT := true

# Сообщаем системе, что классического отдельного recovery.img нет
TARGET_NO_RECOVERY := true

# Отключаем устаревшую схему встраивания рекавери в обычный boot
BOARD_USES_RECOVERY_AS_BOOT := false

# Заставляем TWRP собираться прямо в рамдиск раздела vendor_boot
BOARD_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# Явно указываем структуру фрагментов, чтобы mkbootfs не падал из-за отсутствия папки vendor_ramdisk
BOARD_VENDOR_RAMDISK_FRAGMENTS := recovery

# Разрешаем копирование конфигурационных скриптов в рамдиск вендора
BOARD_COPY_RC_TO_VENDOR_BOOT := true
# ======================================================================

# Recovery fstab (Автоматика сама разложит его по нужным каталогам)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.ums9230_latte

# Platform
TARGET_BOARD_PLATFORM := ums9230

# Recovery Graphic Format for Unisoc Mali
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Verified Boot (Отключение проверок целостности при сборке образов)
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

# Разрешаем сборку 64-битного окружения восстановления
TARGET_SUPPORTS_64_BIT_APPS := true
