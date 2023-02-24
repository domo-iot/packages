include $(TOPDIR)/rules.mk

PKG_NAME:=maturin
PKG_VERSION:=0.14.12
PKG_RELEASE:=1


PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/PyO3/maturin/archive/refs/tags/
PKG_HASH:=b1b665ffdfe6fa7f6f7e3ee2b7c3927567dbebea704141ab30dae3a88aba82be

PKG_HOST_ONLY:=1
PKG_BUILD_PARALLEL:=1

HOST_BUILD_DEPENDS:=rust/host

include ../rust-package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SECTION:=lang
    CATEGORY:=Languages
    SUBMENU:=Rust
    CATEGORY:=Languages
    DEPENDS:=$(RUST_ARCH_DEPENDS) @!SMALL_FLASH @!LOW_MEMORY_FOOTPRINT
    TITLE:=Build and publish crates as python packages
    URL:=https://maturin.rs
endef

define Host/Compile
	cd $(HOST_BUILD_DIR) && \
	    export PATH="$(CARGO_HOME)/bin:$(PATH)" && \
	    CARGO_HOME=$(CARGO_HOME) \
	    cargo install --path . --root $(HOST_BUILD_DIR) --locked
endef

define Package/$(PKG_NAME)/description
Build and publish crates with pyo3, rust-cpython, cffi and uniffi bindings as well as rust binaries as python packages.
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/bin/maturin $(STAGING_DIR_HOSTPKG)/bin/maturin
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,maturin))
