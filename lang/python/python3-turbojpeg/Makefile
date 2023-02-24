#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=turbojpeg
PKG_VERSION:=1.6.7
PKG_RELEASE:=1

PYPI_NAME:=PyTurboJPEG
PKG_HASH:=7bef8397b9211d62d7a3e1bd19df11422178e7c3ad627f97ec953a1c5e96cd80

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Python jpeg-turbo bindings
  URL:=https://github.com/lilohuang/PyTurboJPEG
  DEPENDS:=+python3 +python3-numpy +libjpeg-turbo
endef

define Package/python3-$(PKG_NAME)/description
A Python wrapper of libjpeg-turbo for decoding and encoding JPEG image.
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
