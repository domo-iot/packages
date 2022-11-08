# These allow Cargo packaged projects to be compile via $(call xxx/Compile/Cargo)
define Host/Compile/Cargo
	mkdir -p $(PKG_BUILD_DIR)/.cargo
	cd $(PKG_BUILD_DIR) && \
	  CARGO_HOME=$(CARGO_HOME) cargo update && \
	  CARGO_HOME=$(CARGO_HOME) cargo build -v --release \
	  --target $(RUSTC_TARGET_ARCH),$(RUST_HOST_ARCH)
endef

# TODO not hardcode the dynamic-linker
define Build/Compile/Cargo
        mkdir -p $(PKG_BUILD_DIR)/.cargo
	cd $(PKG_BUILD_DIR) && \
	    CARGO_HOME=$(CARGO_HOME) cargo update && \
	    echo -e "[target.$(RUSTC_TARGET_ARCH)]\nlinker = \"$(TARGET_CC_NOCACHE)\"\nrustflags = [\"-Ctarget-feature=-crt-static\"]" > .cargo/config && \
	    CARGO_HOME=$(CARGO_HOME) CFLAGS=-mno-outline-atomics TARGET_CC=$(TARGET_CC_NOCACHE) CC=cc cargo build -v --release --target $(RUSTC_TARGET_ARCH)
endef
