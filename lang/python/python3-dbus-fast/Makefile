#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dbus-fast
PKG_VERSION:=1.84.0
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=d64f1b68c1c81268e846471caeb9264a9306a6c6ad356c30d5cdf7d1ecc251a1

PYPI_SOURCE_NAME:=dbus_fast
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/81/67/a83522d6692a72911c3586e2fcd2363ce22d1522a7e17e1012f255a6083b/

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Python fast dbus bindings
  URL:=https://github.com/bluetooth-devices/dbus-fast
  DEPENDS:=+python3 +python3-async-timeout +python3-typing-extensions
endef

define Package/python3-$(PKG_NAME)/description
dbus-fast is a Python library for DBus that aims to be a performant fully featured high level library primarily geared towards integration of applications into Linux desktop and mobile environments.
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
