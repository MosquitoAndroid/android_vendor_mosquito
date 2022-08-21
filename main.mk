LOCAL_PATH := $(call my-dir)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

# Common
include vendor/mosquito/config/common.mk

# Version
include vendor/mosquito/config/version.mk

# overrides
include vendor/mosquito/config/overrides.mk

# Themes
$(call inherit-product, vendor/mosquito/config/themes.mk)

# OTA
include vendor/mosquito/config/ota.mk

# Plugins
#include packages/apps/PotatoPlugins/plugins.mk
