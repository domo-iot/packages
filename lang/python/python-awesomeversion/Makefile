#
# Copyright (C) 2021 CZ.NIC, z. s. p. o. (https://www.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-awesomeversion
PKG_VERSION:=22.9.0
PKG_RELEASE:=$(AUTORELEASE)

PYPI_NAME:=awesomeversion
PKG_HASH:=2f4190d333e81e10b2a4e156150ddb3596f5f11da67e9d51ba39057aa7a17f7e


PKG_MAINTAINER:=Josef Schlehofer <josef.schlehofer@nic.cz>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENCE.md

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-awesomeversion
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=AwesomeVersion
  URL:=https://github.com/ludeeus/awesomeversion
  DEPENDS:= \
      +python3-light \
      +python3-logging
endef

define Package/python3-awesomeversion/description
  Make anything a version object, and compare against a vast selection of other version formats.
endef

$(eval $(call Py3Package,python3-awesomeversion))
$(eval $(call BuildPackage,python3-awesomeversion))
$(eval $(call BuildPackage,python3-awesomeversion-src))
