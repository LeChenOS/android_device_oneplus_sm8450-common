#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

COMMON_PATH := device/oneplus/sm8450-common

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    odm_dlkm \
    product \
    recovery \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot \
    vendor_dlkm

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Audio
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := false
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_GKI := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_LSM_HIDL := true
AUDIO_FEATURE_ENABLED_PAL_HIDL := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5961L1,OP5913L1

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := taro

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth/include

# Display
SOONG_CONFIG_qtidisplay += \
    gralloc_handle_has_reserved_size
SOONG_CONFIG_qtidisplay_gralloc_handle_has_reserved_size := true

# Properties
TARGET_ODM_PROP += $(COMMON_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(COMMON_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Filesystem
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

# Fingerprint
TARGET_SURFACEFLINGER_UDFPS_LIB := //hardware/oplus:libudfps_extension.oplus

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(COMMON_PATH)/device_framework_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest_taro.xml
ODM_MANIFEST_FILES := $(COMMON_PATH)/manifest_dsds.xml
ODM_MANIFEST_FILES += $(COMMON_PATH)/manifest_lineage.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_oplus

# Kernel
# is-board-platform-in-list is used in split files below
# from https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/core-utils/-/blob/LA.QSSI.12.0.r1-08700.03-qssi.0/build/utils.mk
#include $(COMMON_PATH)/build/utils.mk

#include $(COMMON_PATH)/kernel/kernel-platform-board.mk
#include vendor/qcom/opensource/audio-kernel/audio_kernel_vendor_board.mk
#include vendor/qcom/opensource/camera-kernel/board.mk
#include vendor/qcom/opensource/dataipa/dataipa_dlkm_vendor_board.mk
#include vendor/qcom/opensource/datarmnet-ext/datarmnet_ext_dlkm_vendor_board.mk
#include vendor/qcom/opensource/datarmnet/datarmnet_dlkm_vendor_board.mk
#include vendor/qcom/opensource/display-drivers/display_driver_board.mk
#include vendor/qcom/opensource/eva-kernel/eva_kernel_board.mk
#include vendor/qcom/opensource/mmrm-driver/mmrm_kernel_board.mk
#include vendor/qcom/opensource/video-driver/video_kernel_board.mk

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x00000000
BOARD_BOOTCONFIG := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    androidboot.selinux=permissive

BOARD_KERNEL_CMDLINE := \
    video=vfb:640x400,bpp=32,memsize=3072000 \
    msm_geni_serial.con_enabled=0
TARGET_KERNEL_CONFIG := gki_defconfig vendor/waipio_GKI.config 
TARGET_KERNEL_SOURCE := device/oneplus/sm8450
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_PREBUILT_DTBOIMAGE := $(COMMON_PATH)/prebuilt/dtbo.img


# Platform
BOARD_USES_QCOM_HARDWARE := true

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 237598617600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 201326592
ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 958769746
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 975635145
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 92160000
endif
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := odm odm_dlkm product system system_ext vendor vendor_dlkm
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE ?= 7511998464
BOARD_SUPER_PARTITION_GROUPS := oneplus_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE ?= 15032385536
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_ODM_DLKM := odm_dlkm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# Recovery
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/init/fstab.default
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
CUSTOM_APNS_FILE := $(COMMON_PATH)/configs/apns-conf.xml
ENABLE_VENDOR_RIL_SERVICE := true

# Security
BOOT_SECURITY_PATCH := 2023-05-05
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# SEPolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
include hardware/oplus/sepolicy/qti/SEPolicy.mk

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 4

BOARD_AVB_DTBO_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_DTBO_ALGORITHM := SHA256_RSA4096
BOARD_AVB_DTBO_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_DTBO_ROLLBACK_INDEX_LOCATION := 3

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := vendor vendor_dlkm
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 5

BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 6

# WiFi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB_EVENT := "ON"
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := $(BOARD_HOSTAPD_DRIVER)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := $(BOARD_HOSTAPD_PRIVATE_LIB)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"
CONFIG_IEEE80211AX := true
PRODUCT_VENDOR_MOVE_ENABLED := true
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
QC_WIFI_HIDL_FEATURE_DUAL_STA := true
WIFI_DRIVER_BUILT := qca_cld3
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

WIFI_DRIVER_INSTALL_TO_KERNEL_OUT := true
#BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/qca_cld3_qca6490.ko

RISING_MAINTAINER := Lechenos
TARGET_USE_PIXEL_FINGERPRINT := true
TARGET_BUILD_APERTURE_CAMERA := true
TARGET_CORE_GMS_EXTRAS := true
TARGET_ENABLE_BLUR := true
TARGET_CORE_GMS := true
WITH_GMS := true

# Include the proprietary files BoardConfig.
include vendor/oneplus/sm8450-common/BoardConfigVendor.mk
