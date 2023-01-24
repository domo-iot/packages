# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
include $(TOPDIR)/rules.mk

PKG_NAME:=rust
PKG_VERSION:=1.66.1
PKG_RELEASE:=1

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/rustc-$(PKG_VERSION)-src/
PKG_SOURCE:=rustc-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=https://static.rust-lang.org/dist/
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_HASH=5b3c933a94c72187705d4ee293198babfdd09442f5937fbd685db3a81f4959ba

PKG_HOST_ONLY:=1
PKG_BUILD_PARALLEL:=1

HOST_USE_NINJA:=1
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/cmake.mk
include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

# Requires Python3 to build
HOST_BUILD_DEPENDS:=python3/host

# rust environment variables
include ./rust-host.mk

# Rust Temp Directory
RUST_TMP_DIR:=$(TMP_DIR)/rust-install

RUST_INSTALL_HOST_FILENAME:=$(PKG_NAME)-$(PKG_VERSION)-$(RUSTC_HOST_ARCH)-install.tar.xz
RUST_INSTALL_TARGET_FILENAME:=$(PKG_NAME)-$(PKG_VERSION)-$(RUSTC_TARGET_ARCH)-install.tar.xz

# Rust-lang has an uninstall script
RUST_UNINSTALL:=$(CARGO_HOME)/lib/rustlib/uninstall.sh

# Target Flags
TARGET_CONFIGURE_ARGS = \
  --set=target.$(RUSTC_TARGET_ARCH).ar=$(TARGET_AR) \
  --set=target.$(RUSTC_TARGET_ARCH).cc=$(TARGET_CC_NOCACHE) \
  --set=target.$(RUSTC_TARGET_ARCH).cxx=$(TARGET_CXX_NOCACHE) \
  --set=target.$(RUSTC_TARGET_ARCH).linker=$(TARGET_CC_NOCACHE) \
  --set=target.$(RUSTC_TARGET_ARCH).musl-root=$(TOOLCHAIN_DIR) \
  --set=target.$(RUSTC_TARGET_ARCH).ranlib=$(TARGET_RANLIB)

# CARGO_HOME is an environmental
HOST_CONFIGURE_OPTS += CARGO_HOME="$(CARGO_HOME)"

# Rust Configuration Arguments
HOST_CONFIGURE_ARGS = \
  --build=$(RUSTC_HOST_ARCH) \
  --target=$(RUSTC_TARGET_ARCH),$(RUSTC_HOST_ARCH) \
  --host=$(RUSTC_HOST_ARCH) \
  --prefix=$(CARGO_HOME) \
  --bindir=$(CARGO_HOME)/bin \
  --libdir=$(CARGO_HOME)/lib \
  --sysconfdir=$(CARGO_HOME)/etc \
  --datadir=$(CARGO_HOME)/share \
  --mandir=$(CARGO_HOME)/man \
  --dist-compression-formats=xz \
  --enable-llvm-link-shared \
  --enable-llvm-plugins \
  --enable-missing-tools \
  --enable-ninja \
  --disable-sanitizers \
  --release-channel=stable \
  --enable-cargo-native-static \
  ${TARGET_CONFIGURE_ARGS}

define Host/Prepare
	# Ensure rust temp directory
	[ -d $(RUST_TMP_DIR) ] || \
	  mkdir -p $(RUST_TMP_DIR)

	$(call Host/Prepare/Default)
endef

define Host/Uninstall
	# Call the Uninstall script
	[ -f $(RUST_UNINSTALL) ] && \
	  $(BASH) $(RUST_UNINSTALL) || echo No Uninstall

	rm -rf $(RUST_TMP_DIR)
endef

# Makes and then packages the dist artifacts
define Host/Compile
	cd $(HOST_BUILD_DIR) && \
	  $(PYTHON) x.py --config ./config.toml dist build-manifest cargo llvm-tools \
	    rustc rust-std rust-src

	$(call Host/PackageDist)
endef

# Distribution Artifacts are packaged by Host/PackageDist
# We just need to extract and install
define Host/Install
	$(TAR) -C $(RUST_TMP_DIR) -xJf $(DL_DIR)/$(RUST_INSTALL_HOST_FILENAME) && \
	$(TAR) -C $(RUST_TMP_DIR) -xJf $(DL_DIR)/$(RUST_INSTALL_TARGET_FILENAME)

	cd $(RUST_TMP_DIR) && \
	  find -iname "*.xz" -exec tar -xJf {} ";" && \
	  find ./* -type f -name install.sh -execdir sh {} --prefix=$(CARGO_HOME) --disable-ldconfig \;
endef

# Packages the Distribution Artifacts into HOST and TARGET bundles.
define Host/PackageDist
	cd $(HOST_BUILD_DIR)/build/dist && \
	  $(TAR) -cJf $(DL_DIR)/$(RUST_INSTALL_TARGET_FILENAME) \
	  rust-*-$(RUSTC_TARGET_ARCH).tar.xz

	cd $(HOST_BUILD_DIR)/build/dist && \
	  $(TAR) -cJf $(DL_DIR)/$(RUST_INSTALL_HOST_FILENAME) \
	  --exclude rust-*-$(RUSTC_TARGET_ARCH).tar.xz *.xz
endef

define Package/rust
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Rust Programming Language Compiler
  URL:=https://www.rust-lang.org/
  DEPENDS:=$(RUST_ARCH_DEPENDS) \
    +pkg-config +libunwind +libopenssl +liblzma +libc
endef

define Package/rust/description
  Rust is a multi-paradigm, general-purpose programming language designed for performance
  and safety, especially safe concurrency. Rust is syntactically similar to C++, but can
  guarantee memory safety by using a borrow checker to validate references.
endef

define Package/rust/config
	source "$(SOURCE)/Config.in"
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,rust))
