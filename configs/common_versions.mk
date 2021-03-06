# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

GDATE= $(shell date '+%Y%m%d')
DATE = $(shell vendor/aokp/tools/getdate)

ifneq ($(AOKP_BUILD),)
    # AOKP_BUILD=<goo version int>/<build string>
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=aokp \
        ro.goo.rom=aokp \
        ro.goo.version=$(shell echo $(AOKP_BUILD) | cut -d/ -f1) \
        ro.aokp.version=$(TARGET_PRODUCT)_jb-mr1_$(shell echo $(AOKP_BUILD) | cut -d/ -f2)
else
    ifneq ($(AOKP_NIGHTLY),)
        # AOKP_NIGHTLY=true
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.goo.developerid=KAsp3rd \
            ro.goo.rom=aokp \
            ro.goo.version=$(GDATE) \
                ro.aokp.version=$(TARGET_PRODUCT)_nightly_$(DATE)
else
    ifneq ($(MY_BUILD),)
        PRODUCT_PROPERTY_OVERRIDES += \
	    ro.goo.developerid=KAsp3rd \
	    ro.goo.rom=aokp \
	    ro.goo.version= $(GDATE) \
		ro.aokp.version=$(TARGET_PRODUCT)_jb-mr1_$(DATE)
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=KAsp3rd \
        ro.goo.rom=aokp_mr1_testing \
        ro.goo.version=0 \
            ro.aokp.version=$(TARGET_PRODUCT)_jb-mr1_test_$(DATE)

        endif
    endif
endif


# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1
