#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=home-assistant-bluetooth
PKG_VERSION:=1.9.2
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=29ad60340adfc95e54bab07bc68894a23cee07da9ce3684b79cb7d814098a9ce

PYPI_SOURCE_NAME:=home_assistant_bluetooth
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/03/1d/f2a3bd355bb312995afc9d6e823f868f8c0e8ef961481b9eac62e7c419e1/

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Home Assistant Bluetooth Models and Helpers
  URL:=https://github.com/home-assistant-libs/home-assistant-bluetooth
  DEPENDS:=+python3 +python3-bleak
endef

define Package/python3-$(PKG_NAME)/description
This library is for accessing Home Assistant Bluetooth models. Libraries use these models to receive and parse Bluetooth advertisement data.
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
