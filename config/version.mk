# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

MosquitoAndroid_VERSION = 12.1
MOSQUITO_PLATFORM_RELEASE_OR_CODENAME := 12L

MOSQUITO_BASE_VERSION = $(MosquitoAndroid_VERSION)

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
TARGET_PRODUCT_SHORT := $(subst aosp_,,$(CUSTOM_BUILD))

ifeq ($(BUILD_TYPE),OFFICIAL)
      IS_OFFICIAL=true
      MOSQUITO_BUILD_TYPE := OFFICIAL
else
ifeq ($(BUILD_TYPE),TEST)
   MOSQUITO_BUILD_TYPE := TEST
else
   MOSQUITO_BUILD_TYPE := UNOFFICIAL
endif
endif

MOSQUITO_ZIP_TYPE = Pristine

# GApps
ifeq ($(WITH_GAPPS),true)
MOSQUITO_ZIP_TYPE := GApps
endif

MOSQUITO_VERSION := MosquitoAndroid-$(CURRENT_DEVICE)-$(MosquitoAndroid_VERSION)-$(MOSQUITO_BUILD_TYPE)-$(MOSQUITO_ZIP_TYPE)-$(shell date -u +%Y%m%d-%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
 ro.stag.version=$(MOSQUITO_VERSION) \
 ro.stag.releasetype=$(MOSQUITO_BUILD_TYPE) \
 ro.mod.version=$(MosquitoAndroid_VERSION) \
 ro.stag.build.version=$(MOSQUITO_BASE_VERSION) \
 ro.stag.ziptype=$(MOSQUITO_ZIP_TYPE) \
 ro.stag.settings.android_version=$(MOSQUITO_PLATFORM_RELEASE_OR_CODENAME)


MOSQUITO_DISPLAY_VERSION := MosquitoAndroid-$(MosquitoAndroid_VERSION)-$(MOSQUITO_BUILD_TYPE)
ROM_FINGERPRINT := MosquitoAndroid/$(MOSQUITO_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%Y%m%d-%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
 ro.stag.display.version=$(MOSQUITO_DISPLAY_VERSION) \
 ro.stag.fingerprint=$(ROM_FINGERPRINT)

