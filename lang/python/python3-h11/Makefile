#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=h11
PKG_VERSION:=0.14.0
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d

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
  TITLE:=HTTP1.1.
  URL:=https://github.com/python-hyper/h11
  DEPENDS:=+python3
endef

define Package/python3-$(PKG_NAME)/description
HTTP 1.1 in pure python.
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
