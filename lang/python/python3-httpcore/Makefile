#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=httpcore
PKG_VERSION:=0.16.3
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=c5d6f04e2fc530f39e0c077e6a30caa53f1451096120f1f38b954afd0b17c0cb

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

# HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:=hatch build poetry

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Core HTTP
  URL:=https://github.com/encode/httpcore
  DEPENDS:=+python3 +python3-h11 +python3-anyio +python3-sniffio +python3-certifi
endef

define Package/python3-$(PKG_NAME)/description
Core HTTP
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
