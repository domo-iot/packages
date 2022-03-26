include $(TOPDIR)/rules.mk

PKG_NAME:=ripgrep
PKG_VERSION:=13.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2021-06-12
PKG_SOURCE_VERSION:=af6b6c543b224d348a8876f0c06245d9ea7929c5
PKG_SOURCE_URL:=https://github.com/BurntSushi/ripgrep.git
PKG_MIRROR_HASH:=05b9f4d11e8213a720197d7c45c764c94b6eb03bf4e3e09c89b2c87b1cdf32fb

PKG_BUILD_DEPENDS:=rust/host

include ../../lang/rust/rust_environment.mk
include $(INCLUDE_DIR)/package.mk

define Build/Compile
	$(call Build/Compile/Cargo, --features 'pcre2')
#        cd $(PKG_BUILD_DIR) && $(TARGET_CONFIGURE_OPTS) $(CONFIGURE_VARS) cargo update && \
#	  $(TARGET_CONFIGURE_OPTS) $(CONFIGURE_VARS) cargo build -v --release \
#	  --target $(REAL_GNU_TARGET_NAME) --features 'pcre2'
endef

define Package/$(PKG_NAME)
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=@!SMALL_FLASH @!LOW_MEMORY_FOOTPRINT +libpcre2
    TITLE:=ripgrep (rg) regex grep
    URL:=https://github.com/BurntSushi/ripgrep
endef

define Package/$(PKG_NAME)/description
ripgrep (rg) recursively searches directories for a regex pattern while respecting your gitignore
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/target/$(REAL_GNU_TARGET_NAME)/release/rg $(1)/bin/rg

endef

$(eval $(call BuildPackage,$(PKG_NAME)))
