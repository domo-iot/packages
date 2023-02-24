#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fnvhash
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=3e82d505054f9f3987b2b5b649f7e7b6f48349f6af8a1b8e4d66779699c85a8e

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Python FNV hash
  URL:=https://github.com/amitdev/lru-dict
  DEPENDS:=+python3
endef

define Package/python3-$(PKG_NAME)/description
fnvhash
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
