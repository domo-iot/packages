#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=janus
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643d3ad0e10de058cb1612

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Thread-safe asyncio-aware queue for Python
  URL:=https://github.com/aio-libs/janus
  DEPENDS:=+python3
endef

define Package/python3-$(PKG_NAME)/description
Thread-safe asyncio-aware queue for Python
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
