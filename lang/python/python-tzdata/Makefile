#
# Copyright (C) 2015-2019 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tzdata
PKG_VERSION:=2022.7
PKG_RELEASE:=$(AUTORELEASE)

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=fe5f866eddd8b96e9fcba978f8e503c909b19ea7efda11e52e39494bad3a7bfa

PKG_LICENSE:=Apache-2
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Jeffery To <jeffery.to@gmail.com>

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=IANA time zone database
  URL:=https://github.com/python/tzdata
  DEPENDS:= +python3-light
endef

define Package/python3-$(PKG_NAME)/description
Python package wrapping the IANA time zone database
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
