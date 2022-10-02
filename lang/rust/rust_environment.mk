# Rust Environmental Vars
CONFIG_HOST_SUFFIX:=$(shell cut -d"-" -f4 <<<"$(GNU_HOST_NAME)")
RUSTC_HOST_ARCH:=$(HOST_ARCH)-unknown-linux-$(CONFIG_HOST_SUFFIX)
RUSTC_TARGET_ARCH:=$(REAL_GNU_TARGET_NAME)
CARGO_HOME:=$(STAGING_DIR_HOST)

# Common Build Flags
RUST_BUILD_FLAGS = \
  CARGO_HOME="$(CARGO_HOME)"

# This adds the rust environmental variables to Make calls
MAKE_FLAGS += $(RUST_BUILD_FLAGS)

# ARM Logic
ifeq ($(ARCH),"arm")
  ifeq ($(CONFIG_arm_v7),y)
    RUSTC_TARGET_ARCH:=$(subst arm,armv7,$(RUSTC_TARGET_ARCH))
  endif

  ifeq ($(CONFIG_HAS_FPU),y)
    RUSTC_TARGET_ARCH:=$(subst muslgnueabi,muslgnueabihf,$(RUSTC_TARGET_ARCH))
  endif
endif


# These allow Cargo packaged projects to be compile via $(call xxx/Compile/Cargo)
define Host/Compile/Cargo
	mkdir -p $(PKG_BUILD_DIR)/.cargo
	cd $(PKG_BUILD_DIR) && \
	  CARGO_HOME=$(CARGO_HOME) cargo update && \
	  CARGO_HOME=$(CARGO_HOME) cargo build -v --release \
	  --target $(RUSTC_TARGET_ARCH),$(RUST_HOST_ARCH)
endef

define Build/Compile/Cargo
	mkdir -p $(PKG_BUILD_DIR)/.cargo
	cd $(PKG_BUILD_DIR) && \
	  CARGO_HOME=$(CARGO_HOME) cargo update && \
	  echo -e "[target.$(RUSTC_TARGET_ARCH)]\nlinker = \"$(TARGET_CC_NOCACHE)\"" > .cargo/config && \
	  CARGO_HOME=$(CARGO_HOME) CFLAGS=-mno-outline-atomics TARGET_CC=$(TARGET_CC_NOCACHE) CC=cc cargo build -v --release --target $(RUSTC_TARGET_ARCH)
endef
