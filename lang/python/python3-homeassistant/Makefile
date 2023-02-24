#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=homeassistant
PKG_VERSION:=2023.2.0
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=60aa354eaab6b17466da359b6fd84f6fcf14efa3a6745f055a3d51cbb69abc2e

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/rust/rust-package.mk
include ../python3-package.mk

define Package/python3-$(PKG_NAME)
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=Home Assistant
  URL:=https://github.com/home-assistant/core
  DEPENDS:=+python3 \
  +python3-aiohttp-cors \
  +python3-astral \
  +python3-async-timeout \
  +python3-atomicwrites-homeassistant \
  +python3-attrs \
  +python3-awesomeversion \
  +python3-bcrypt \
  +python3-certifi \
  +python3-charset-normalizer \
  +python3-ciso8601 \
  +python3-cryptography \
  +python3-home-assistant-bluetooth \
  +python3-httpx \
  +python3-idna \
  +python3-ifaddr \
  +python3-jinja2 \
  +python3-jwt \
  +python3-lru-dict \
  +python3-multidict \
  +python3-orjson \
  +python3-pip \
  +python3-psutil \
  +python3-pyopenssl \
  +python3-requests \
  +python3-slugify \
  +python3-sqlalchemy \
  +python3-tzdata \
  +python3-typing-extensions \
  +python3-voluptuous \
  +python3-voluptuous-serialize \
  +python3-yaml \
  +python3-yarl \
  +python3-websockets \
  +python3-zeroconf \
  +python3-pillow \
  +python3-fnvhash \
  +python3-netifaces \
  +python3-turbojpeg \
  +python3-aiodiscover \
  +python3-janus \
  +python3-pyatv
endef

define Package/python3-$(PKG_NAME)/description
Home Assistant
endef

PYTHON3_VARS += \
	PATH="$(CARGO_HOME)/bin:$(PATH)" \
	CARGO_HOME=$(CARGO_HOME) \
	CARGO_BUILD_TARGET=$(RUSTC_TARGET_ARCH) \
	PYO3_CROSS_INCLUDE_DIR="$(PYTHON3_INC_DIR)" \
	PYO3_CROSS_LIB_DIR="$(PYTHON3_LIB_DIR)"

define Build/Prepare
	$(call Build/Prepare/Default)
	ls -al $(PKG_BUILD_DIR)
	echo > $(PKG_BUILD_DIR)/package_constraints.txt
endef

define Py3Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/homeassistant.init $(1)/etc/init.d/homeassistant
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
