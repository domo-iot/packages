#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=anyio
PKG_VERSION:=3.6.2
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=25ea0d673ae30af41a0c442f81cf3b38c7e79fdc7b60335a4c14e05eb0947421

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

# HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:=hatch build poetry

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Compatibility layer for multiple asyncio implementations
  URL:=https://github.com/agronholm/anyio
  DEPENDS:=+python3 +python3-idna +python3-sniffio +python3-exceptiongroup
endef

define Package/python3-$(PKG_NAME)/description
High level compatibility layer for multiple asynchronous event loop implementations
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
