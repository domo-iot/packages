#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=httpx
PKG_VERSION:=0.23.3
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=9818458eb565bb54898ccb9b8b251a28785dd4a55afbc23d0eb410754fe7d0f9

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
  TITLE:=The next generation HTTP client
  URL:=https://github.com/encode/httpx
  DEPENDS:=+python3 +python3-certifi +python3-idna +python3-httpcore +python3-sniffio
endef

define Package/python3-$(PKG_NAME)/description
A next generation HTTP client for Python.
endef

# $(1) => build subdir
# $(2) => additional arguments to pip
# $(3) => additional variables
define Python3/NewSetup
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/$(PYTHON3_PKG_DIR)
	$(call Python3/Run, \
		$(PKG_BUILD_DIR)/$(strip $(1)), \
		-m pip $(2), \
		$(3) PY_PKG_VERSION=$(PKG_VERSION))
endef

define Build/Compile
	$(call Python3/NewSetup, \
		$(PYTHON3_PKG_SETUP_DIR), \
		$(PYTHON3_PKG_SETUP_GLOBAL_ARGS) \
		install . --prefix="/usr" --root="$(PKG_INSTALL_DIR)" \
		$(PYTHON3_PKG_PIP_ARGS), \
		$(PYTHON3_PKG_PIP_VARS) \
	)
endef


$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
