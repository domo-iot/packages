# These allow Cargo packaged projects to be compile via $(call xxx/Compile/Cargo)
define Host/Compile/Cargo
	mkdir -p $(PKG_BUILD_DIR)/.cargo
	cd $(PKG_BUILD_DIR) && \
	  CARGO_HOME=$(CARGO_HOME) cargo update && \
	  CARGO_HOME=$(CARGO_HOME) cargo build -v --release \
	  --target $(RUST_HOST_ARCH)
endef

# $(1) path to the package dir
# $(2) additional arguments to cargo install
define Build/Compile/Cargo
        mkdir -p $(PKG_BUILD_DIR)/.cargo
	cd $(PKG_BUILD_DIR) && \
	    CARGO_HOME=$(CARGO_HOME) cargo update && \
	    echo -e "[target.$(RUSTC_TARGET_ARCH)]\nlinker = \"$(TARGET_CC_NOCACHE)\"\nrustflags = [\"-Ctarget-feature=-crt-static\"]" > .cargo/config && \
	    echo -e "\n[profile.stripped]\ninherits = \"release\"\nopt-level = \"s\"\nstrip = true" >> .cargo/config && \
	    CARGO_HOME=$(CARGO_HOME) CFLAGS=-mno-outline-atomics TARGET_CC=$(TARGET_CC_NOCACHE) CC=cc \
	    cargo install -v --profile stripped --target $(RUSTC_TARGET_ARCH) --root $(PKG_INSTALL_DIR) --path "$(if $(strip $(1)),$(strip $(1)),.)" $(2)
endef
