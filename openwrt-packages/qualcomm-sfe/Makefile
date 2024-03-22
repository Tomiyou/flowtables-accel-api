include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=qualcomm-sfe
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/waau/qualcomm-sfe
PKG_MIRROR_HASH:=252de0a8e47f648a2e40bd7f4b90b29054e1a8a53e04e86cd1dd69fb5ebb23f6
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=249878ea356b0460a5dd72016b888efa2acb9a2f

include $(INCLUDE_DIR)/package.mk

define KernelPackage/qualcomm-sfe
  TITLE:=Qualcomm's SFE packet accelerator
  CATEGORY:=Kernel modules
  SUBMENU:=Network Support
  FILES:=$(PKG_BUILD_DIR)/qca-nss-sfe.ko
  AUTOLOAD:=$(call AutoLoad,70,qualcomm-sfe)
endef

include $(INCLUDE_DIR)/kernel-defaults.mk

define Build/Compile
	$(KERNEL_MAKE) M="$(PKG_BUILD_DIR)" \
		modules
endef

$(eval $(call KernelPackage,qualcomm-sfe))
