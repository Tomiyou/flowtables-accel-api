#
# Copyright (C) 2020-2023 Tony Ambardar <itugrok@yahoo.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bpf-examples
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/xdp-project/bpf-examples
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=5343ed3377471c7b7ef2237526c8bdc0f00a0cef

PKG_BUILD_DEPENDS:=bpf-headers

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/bpf.mk
include $(INCLUDE_DIR)/nls.mk

define Package/bpf-examples
  SECTION:=base
  CATEGORY:=Network
  TITLE:=bpf-examples lmao
  DEPENDS:=+libbpf +libxdp +bpftool
endef

define Package/bpf-examples/description
  bpf-examples je blablabla
endef

$(eval $(call BuildPackage,bpf-examples))
