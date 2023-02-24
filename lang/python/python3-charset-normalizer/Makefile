#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=charset-normalizer
PKG_VERSION:=3.0.1
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=ebea339af930f8ca5d7a699b921106c6e29c617fe9606fa7baa043c1cdae326f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk


define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=The Real First Universal Charset Detector
  URL:=https://github.com/ousret/charset_normalizer
  DEPENDS:=+python3-light
endef

define Package/python3-$(PKG_NAME)/description
The Real First Universal Charset Detector
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
