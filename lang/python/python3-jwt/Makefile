#
# Copyright (C) 2019-2020 CZ.NIC, z. s. p. o. (https://www.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jwt
PKG_VERSION:=2.6.0
PKG_RELEASE:=1

PYPI_NAME:=PyJWT
PKG_HASH:=69285c7e31fc44f68a1feb309e948e0df53259d579295e6cfe2b1792329f05fd

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=JSON Web Token library for Python
  URL:=https://github.com/GehirnInc/python-jwt
  DEPENDS:=+python3-light
endef

define Package/python3-$(PKG_NAME)/description
  JSON Web Token library for Python
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
