#
# Copyright (C) 2026 The TWRP Open Source Project
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),RMX3930)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
