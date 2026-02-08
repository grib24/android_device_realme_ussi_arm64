#
# Copyright (C) 2026 The TWRP Open Source Project
#

DEVICE_PATH := device/realme/RMX3930

# Build Hacks
BUILD_BROKEN_DUP_RULES := true
ALLOW_MISSING_DEPENDENCIES := true

# Kernel - Building with minimal manifest
TARGET_NO_KERNEL := true
TARGET_NO_RECOVERY := false

# A/B support
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    odm \
    vendor_dlkm \
    system_dlkm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor_boot

# Vendor_boot configuration
TARGET_NO_RECOVERY := false
BOARD_BOOT_HEADER_VERSION := 4
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_RAMDISK_USE_LZ4 := true


# Assert
TARGET_OTA_ASSERT_DEVICE := RE6054,RMX3930,ussi_arm64,latte


# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

TARGET_NO_KERNEL := true
BOARD_RAMDISK_USE_LZ4 := true
BOARD_KERNEL_SEPARATED_DTBO := true

# Путь к твоему бинарнику
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# Параметры из твоего дампа (Android 15 / Header v4)
BOARD_BOOT_HEADER_VERSION := 4
BOARD_PAGE_SIZE := 4096
BOARD_HEADER_SIZE := 2112
BOARD_DTB_SIZE := 134558
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x00000000
BOARD_TAGS_OFFSET := 0x00000000
BOARD_DTB_OFFSET := 0x00000000

# Командная строка из твоего vendor_boot
BOARD_VENDOR_CMDLINE := console=ttyS1,115200n8 bootconfig bootconfig

# Аргументы сборки (Header v4 требует передачи DTB отдельно)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline "$(BOARD_VENDOR_CMDLINE)"
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ums9230
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 280

# Kernel Configuration - Header v4 (Android 15)
BOARD_BOOT_HEADER_VERSION := 4
BOARD_PAGE_SIZE := 4096
BOARD_HEADER_SIZE := 2112
BOARD_DTB_SIZE := 134558

BOARD_KERNEL_BASE := 0x00000000
BOARD_VENDOR_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x00000000
BOARD_TAGS_OFFSET := 0x00000000
BOARD_DTB_OFFSET := 0x00000000

# Command Line из твоего vendor_boot
BOARD_VENDOR_CMDLINE := console=ttyS1,115200n8 bootconfig bootconfig
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive

# Bootloader Arguments
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE)
BOARD_MKBOOTIMG_ARGS += --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline "$(BOARD_VENDOR_CMDLINE)"
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_HAS_LARGE_FILESYSTEM := true

# Копирование образов
BOARD_USES_SYSTEM_EXTIMAGE := true
BOARD_USES_ODM_DLKMIMAGE := true
BOARD_USES_SYSTEM_DLKMIMAGE := true
BOARD_USES_VENDOR_DLKMIMAGE := true

TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Типы файловых систем (Android 15 использует EROFS)
BOARD_SYSTEMIMAGE_PARTITION_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic Partitions (ТОЧНЫЕ ДАННЫЕ ИЗ ТВОЕГО ДАМПА)
BOARD_SUPER_PARTITION_SIZE := 7969177600
BOARD_SUPER_PARTITION_GROUPS := unisoc_dynamic_partitions
BOARD_UNISOC_DYNAMIC_PARTITIONS_SIZE := 7964983296
BOARD_UNISOC_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product system_dlkm vendor_dlkm odm

# Графика
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# DTB and DTBO
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_INCLUDE_RECOVERY_DTBO := true

# Verified Boot (AVB - Android 15)
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Алгоритм и ключи для сборки (стандарт AOSP)
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Platform
BOARD_USES_SPRD_HARDWARE := true
TARGET_BOARD_PLATFORM := ums9230
TARGET_BOOTLOADER_BOARD_NAME := ums9230
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_SELECT_BUTTON := false

# Recovery & Vendor Boot (Android 15 / Header v4)
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := false

# Графика (Твой стандарт)
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Критично для архитектуры без раздела Recovery
TW_HAS_NO_RECOVERY_PARTITION := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# Путь к твоему fstab (убедись, что файл там лежит)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
RECOVERY_FSTAB_VERSION := 2

# Crypto (Шифрование Android 15)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
BOARD_USES_METADATA_PARTITION := true
TW_USE_FSCRYPT_POLICY := 2


# Platform Security & Crypto (Android 15 Hack)
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := 16.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_FBE_METADATA_DECRYPT := true


# Temp
TW_CUSTOM_CPU_TEMP_PATH := sys/devices/virtual/thermal/thermal_zone16/temp

# Brightness (Путь для Realme C61 на Unisoc)
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_DEVICE_VERSION := RMX3930_ditr79
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true

# Дополнительно для Android 15 (Unisoc T612)
TW_HAS_MTP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_EXCLUDE_APEX := false

# Logs & Debugging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
BOARD_HAS_TRX_SUPPORT := true

# TWRP Props & Tools
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_ENABLE_ALL_PARTITION_TOOLS := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXTRA_LANGUAGES := true

# Специфика Android 15 (Unisoc T612)
TW_EXCLUDE_APEX := false
TW_INCLUDE_FASTBOOTD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true

# Для работы ADB (RE6054)
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file

# Дополнительные библиотеки для расшифровки (Keymint V2 - Android 15)
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrusty.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libtrusty.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoft_attestation_cert.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libsoft_attestation_cert.so
