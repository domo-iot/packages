include $(TOPDIR)/rules.mk

PKG_NAME:=orjson
PKG_VERSION:=3.8.5
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=77a3b2bd0c4ef7723ea09081e3329dac568a62463aed127c1501441b07ffc64b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_BUILD_DEPENDS:=rust/host maturin/host

HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:=installer

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/rust/rust-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-orjson
  CATEGORY:=Languages
  SECTION:=lang
  SUBMENU:=Python
  TITLE:=orjson is a fast, correct JSON library for Python
  URL:=https://github.com/ijl/orjson
  DEPENDS:=+python3
endef

define Package/python3-orjson/description
orjson is a fast, correct JSON library for Python
endef

define Build/Compile
	cd $(PKG_BUILD_DIR) && \
	    PATH="$(CARGO_HOME)/bin:$(STAGING_DIR_HOSTPKG)/bin:$(PATH)" \
	    CARGO_HOME=$(CARGO_HOME) TARGET_CFLAGS="$(TARGET_CFLAGS) $(RUST_CFLAGS)" TARGET_CC=$(TARGET_CC_NOCACHE) CC=cc \
	    maturin build -v -r --strip --target $(RUSTC_TARGET_ARCH) -i python-$(PYTHON3_VERSION) --skip-auditwheel
	$(call Python3/Run, $(PKG_BUILD_DIR), -m installer --prefix /usr --destdir "$(PKG_INSTALL_DIR)" target/wheels/*.whl)
endef

$(eval $(call Py3Package,python3-orjson))
$(eval $(call BuildPackage,python3-orjson))
