#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2024 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

#TARGET_INCLUDE_MICROG := true

# Inherit some common PixelExperience stuff
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Additional Pixel stuffs
TARGET_INCLUDE_CARRIER_SETTINGS := true
TARGET_INCLUDE_CAMERA_GO := false
TARGET_SUPPORTS_LILY_EXPERIENCE := true
TARGET_NOT_SUPPORTS_GOOGLE_BATTERY := true
TARGET_FLATTEN_APEX := false
MAINLINE_INCLUDE_VIRT_MODULE := false
TARGET_GBOARD_KEY_HEIGHT := 1.2
$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)

# Build Signing
TARGET_BUILD_FULLY_SIGN := true

include vendor/parasite/signatures/BoardConfigSign.mk

BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := 0
TARGET_AVB_KEY_PATH := $(PARASITE_AVB_KEY_PATH)
# Differs what bit (e.g. 2048) you selected for key generation
TARGET_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := $(TARGET_AVB_KEY_PATH)
BOARD_AVB_ALGORITHM :=  $(TARGET_AVB_ALGORITHM)
BOARD_AVB_VENDOR_BOOT_KEY_PATH := $(TARGET_AVB_KEY_PATH)
BOARD_AVB_VENDOR_BOOT_ALGORITHM := $(TARGET_AVB_ALGORITHM)

ifeq ($(DEVICE_CODENAME),milanf)
  BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 2
endif
ifeq ($(DEVICE_CODENAME),yume)
  BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 3
endif

# Gapps Selection
# TARGET_BUILD_PACKAGE options:
# 1 - vanilla (default)
# 2 - microg
# 3 - gapps
#ifeq ($(ROM_BUILD_TYPE),GAPPS)
#  TARGET_BUILD_PACKAGE := 3
#else
#  ifeq ($(ROM_BUILD_TYPE),MICROG)
#    TARGET_BUILD_PACKAGE := 2
#  endif
#endif

# Garbage Collection Build Error Fix
ifeq ($(KERNEL_VERSION),5.4)
  PRODUCT_ENABLE_UFFD_GC := false
endif
ifeq ($(KERNEL_VERSION),4.19)
  PRODUCT_ENABLE_UFFD_GC := false
endif
ifeq ($(KERNEL_VERSION),4.14)
  PRODUCT_ENABLE_UFFD_GC := false
endif

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := aosp_$(DEVICE)
