#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=aiodiscover
PKG_VERSION:=1.4.13
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=8185d9ae2b94af7eb5fac963a74da796c708a05c94fe5f817072900c80a196ad

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Python Discover hosts by arp and ptr lookup
  URL:=https://github.com/amitdev/lru-dict
  DEPENDS:=+python3 +python3-netifaces +python3-ifaddr +python3-pyroute2 +python3-dns +python3-async-timeout
endef

define Package/python3-$(PKG_NAME)/description
Discover hosts by arp and ptr lookup
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
