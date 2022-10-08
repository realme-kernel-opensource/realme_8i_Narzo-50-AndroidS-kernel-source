include $(CLEAR_VARS)

LOCAL_MODULE := $(WIFI_NAME).ko
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk

LOCAL_REQUIRED_MODULES := $(WIFI_CHRDEV_MODULE)

ifeq ($(CONNAC_VER), 2_0)
LOCAL_REQUIRED_MODULES += conninfra.ko
else
LOCAL_REQUIRED_MODULES += wmt_drv.ko
endif

LOCAL_REQUIRED_MODULES += connfem.ko

include $(MTK_KERNEL_MODULE)

WIFI_OPTS := CONFIG_MTK_COMBO_WIFI_HIF=$(WIFI_HIF) MODULE_NAME=$(WIFI_NAME) MTK_COMBO_CHIP=$(WIFI_CHIP) WLAN_CHIP_ID=$(WLAN_CHIP_ID) MTK_ANDROID_WMT=$(WIFI_WMT) WIFI_ENABLE_GCOV=$(WIFI_ENABLE_GCOV) WIFI_IP_SET=$(WIFI_IP_SET) MTK_ANDROID_EMI=$(WIFI_EMI)
WIFI_OPTS += MTK_WLAN_SERVICE=yes

#ifdef OPLUS_FEATURE_WIFI_SMARTGEAR
#LiFenfen@CONNECTIVITY.WIFI.HARDWARE.POWER.SMARTGEAR.1641437 , 2021/11/01
ifeq ($(OPLUS_FEATURE_WIFI_SMARTGEAR), yes)
WIFI_OPTS += OPLUS_FEATURE_WIFI_SMARTGEAR=yes
endif
#endif /* OPLUS_FEATURE_WIFI_SMARTGEAR */

$(linked_module): OPTS += $(WIFI_OPTS)
