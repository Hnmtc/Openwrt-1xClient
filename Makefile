#
	# Name:         1xClient
	# Version:      2.0
	# Description:  1xClient
	# Created:      2019-03-01
	# Copyright (C) 2019-2022 Hsy <info@hsy.ink>
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk
PKG_NAME:=1xClient
PKG_RELEASE:=2.0
PKG_MAINTAINER:=Hsy <info@hsy.ink>

define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Network
	DEPENDS:=+libpcap +libstdcpp
	TITLE:=Lenovo 802.1x supplicant client.
endef

define Package/$(PKG_NAME)/description
	Lenovo 802.1x supplicant client.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		LIBS="$(STAGING_DIR)/usr/lib/libpcap.a"
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/1xClient $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/1xClient $(1)/etc/config/1xClient
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/1xClient $(1)/etc/init.d/1xClient
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
