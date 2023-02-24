#
# Copyright (C) 2019-2020 CZ.NIC, z. s. p. o. (https://www.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=atomicwrites-homeassistant
PKG_VERSION:=1.4.1
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=256a672106f16745445228d966240b77b55f46a096d20305901a57aa5d1f4c2f

PKG_MAINTAINER:=Jan Pavlinec <jan.pavlinec1@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Atomic file writes
  URL:=https://github.com/home-assistant-libs/python-atomicwrites-homeassistant
  DEPENDS:=+python3-light
endef

define Package/python3-$(PKG_NAME)/description
  Python library for atomic file writes.
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
