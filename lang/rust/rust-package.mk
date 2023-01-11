
rust_mk_path:=$(dir $(lastword $(MAKEFILE_LIST)))
include $(rust_mk_path)rust-host.mk

# $(1) path to
define Build/Compile/Cargo
	echo -e "[target.$(RUSTC_TARGET_ARCH)]\nlinker = \"$(TARGET_CC_NOCACHE)\"\nrustflags = [\"-Ctarget-feature=-crt-static\"]" > $(CARGO_HOME)/config
	echo -e "\n[profile.stripped]\ninherits = \"release\"\nopt-level = \"s\"\nstrip = true" >> $(CARGO_HOME)/config
	cd $(PKG_BUILD_DIR) && \
	    export PATH="$(CARGO_HOME)/bin:$(PATH)" && \
	    CARGO_HOME=$(CARGO_HOME) cargo update && \
	    CARGO_HOME=$(CARGO_HOME) CFLAGS=-mno-outline-atomics TARGET_CC=$(TARGET_CC_NOCACHE) CC=cc \
	    cargo install -v --profile stripped --target $(RUSTC_TARGET_ARCH) --root $(PKG_INSTALL_DIR) --path "$(if $(strip $(1)),$(strip $(1)),.)"
endef
