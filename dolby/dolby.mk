# SPDX-License-Identifier: Apache-2.0

PRODUCT_PACKAGES += \
    MotoDolbyDax3 \
    MotorolaSettingsProvider \
    MotoSignatureApp \
    com.motorola.frameworks.core.addon \
    com.motorola.motosignature \
    moto-checkin \
    moto-settings \
    moto \
    KirbyDaxService \
    kirby_dolby_dms_manifest \
    kirby_dolby_codec2_manifest

# Motorola DMS/DAP trial, Roynas-Android-Playground/vendor_motorola_dolby de59281.
# Keep Kirby's Codec2 dependencies and give the donor its own parameter store.
# DMS uses the VNDK 32 AHandler layout. Its private foundation library keeps
# the current foundation ABI available to other vendor services.
KIRBY_MOTOROLA_DOLBY := vendor/lenovo/kirby/dolby/motorola

PRODUCT_COPY_FILES += \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/default-permissions/default-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/default-permissions/default-com.dolby.daxservice.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/default-permissions/default-com.motorola.dolby.dolbyui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/default-permissions/default-com.motorola.dolby.dolbyui.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/com.motorola.frameworks.core.addon.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.frameworks.core.addon.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/com.motorola.motosignature.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.motosignature.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/com.motorola.software.dolbyui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.software.dolbyui.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/moto-checkin.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/moto-checkin.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/moto-settings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/moto-settings.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/moto.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/moto.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/privapp-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxservice.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/privapp-com.motorola.android.providers.settings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.motorola.android.providers.settings.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/privapp-com.motorola.dolby.dolbyui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.motorola.dolby.dolbyui.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/sysconfig/config-com.motorola.android.providers.settings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.motorola.android.providers.settings.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/sysconfig/config-com.motorola.dolby.dolbyui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.motorola.dolby.dolbyui.xml \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/sysconfig/config-com.motorola.motosignature.app.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.motorola.motosignature.app.xml

PRODUCT_COPY_FILES += \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/permissions/com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.dolby.daxservice.xml \
    $(KIRBY_MOTOROLA_DOLBY)/vendor/bin/hw/vendor.dolby.hardware.dms@2.0-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.dolby.hardware.dms@2.0-service \
    vendor/lenovo/kirby/dolby/vendor/bin/hw/vendor.dolby.media.c2-default-service-dax:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.dolby.media.c2-default-service-dax \
    $(KIRBY_MOTOROLA_DOLBY)/vendor/etc/dolby/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    vendor/lenovo/kirby/dolby/vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.hardware.dms@2.0-service.rc \
    vendor/lenovo/kirby/dolby/vendor/etc/init/vendor.dolby.media.c2@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.media.c2@1.0-service.rc \
    vendor/lenovo/kirby/dolby/vendor/etc/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    vendor/lenovo/kirby/dolby/vendor/lib64/libcodec2_soft_ac4dec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcodec2_soft_ac4dec.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/libcodec2_soft_common.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcodec2_soft_common.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/libcodec2_soft_ddpdec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcodec2_soft_ddpdec.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/libcodec2_store_dolby.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcodec2_store_dolby.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/libdapparamstorage.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdapparamstorage.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/libdeccfg.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdeccfg.so \
    $(KIRBY_MOTOROLA_DOLBY)/vendor/lib64/libdlbdsservice.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdlbdsservice.so \
    $(KIRBY_MOTOROLA_DOLBY)/vendor/lib64/libstagefright_dax_compat.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefright_dax_compat.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/libdlbpreg.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdlbpreg.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/libdmshal.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdmshal.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/libsfplugin_ccodec_utils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libsfplugin_ccodec_utils.so \
    vendor/lenovo/kirby/dolby/vendor/lib64/soundfx/libdlbvol.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libdlbvol.so \
    $(KIRBY_MOTOROLA_DOLBY)/vendor/lib64/soundfx/libswdap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libswdap.so \
    $(KIRBY_MOTOROLA_DOLBY)/vendor/lib64/vendor.dolby.hardware.dms@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.dolby.hardware.dms@2.0.so

PRODUCT_COPY_FILES += \
    $(KIRBY_MOTOROLA_DOLBY)/system_ext/etc/sysconfig/config-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxservice.xml \
    $(KIRBY_MOTOROLA_DOLBY)/vendor/lib64/libdapparammotorol.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdapparammotorol.so \
    $(KIRBY_MOTOROLA_DOLBY)/vendor/lib64/vendor.dolby.hardware.dms@2.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.dolby.hardware.dms@2.0-impl.so
