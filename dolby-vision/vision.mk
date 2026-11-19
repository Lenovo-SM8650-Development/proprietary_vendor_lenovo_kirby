# SPDX-License-Identifier: Apache-2.0

# Dolby Vision components from Kirby stock ZUX.1.5.10.298.
KIRBY_DOLBY_VISION := vendor/lenovo/kirby/dolby-vision/stock

PRODUCT_PACKAGES += \
    kirby_dolby_vision_codec2_manifest \
    kirby_dolby_vision_dvs_manifest \
    libkirby_dolby_vision_compat

# Package the stock decoder and control service.
PRODUCT_COPY_FILES += \
    $(KIRBY_DOLBY_VISION)/bin/hw/dvs-aidl-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/dvs-aidl-service \
    $(KIRBY_DOLBY_VISION)/bin/hw/vendor.dolby.media.c2@1.0-service-vision:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.dolby.media.c2@1.0-service-vision \
    $(KIRBY_DOLBY_VISION)/etc/init/dvs-aidl-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/dvs-aidl-service.rc \
    $(KIRBY_DOLBY_VISION)/etc/init/vendor.dolby.media.c2@1.0-service-vision.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.media.c2@1.0-service-vision.rc \
    $(KIRBY_DOLBY_VISION)/lib64/android.hardware.dvdec.c2@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.dvdec.c2@1.0.so \
    $(KIRBY_DOLBY_VISION)/lib64/android.hardware.media.bufferpool2-V1-ndk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.media.bufferpool2-V1-ndk.so \
    $(KIRBY_DOLBY_VISION)/lib64/android.hardware.sensors-V2-ndk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.sensors-V2-ndk.so \
    $(KIRBY_DOLBY_VISION)/lib64/c2.dolby.client.so:$(TARGET_COPY_OUT_VENDOR)/lib64/c2.dolby.client.so \
    $(KIRBY_DOLBY_VISION)/lib64/c2.dolby.hevc.dec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/c2.dolby.hevc.dec.so \
    $(KIRBY_DOLBY_VISION)/lib64/c2.dolby.hevc.sec.dec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/c2.dolby.hevc.sec.dec.so \
    $(KIRBY_DOLBY_VISION)/lib64/c2.dolby.store.so:$(TARGET_COPY_OUT_VENDOR)/lib64/c2.dolby.store.so \
    $(KIRBY_DOLBY_VISION)/lib64/libcodec2_dovi.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcodec2_dovi.so \
    $(KIRBY_DOLBY_VISION)/lib64/libcodec2_dovi@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcodec2_dovi@1.0.so \
    $(KIRBY_DOLBY_VISION)/lib64/libcodec2_soft_kdovis.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcodec2_soft_kdovis.so \
    $(KIRBY_DOLBY_VISION)/lib64/libsfplugin_ccodec_kdovi.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libsfplugin_ccodec_kdovi.so \
    $(KIRBY_DOLBY_VISION)/lib64/libdolbydecoderprocessor.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdolbydecoderprocessor.so \
    $(KIRBY_DOLBY_VISION)/lib64/libdolbyeglcore.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdolbyeglcore.so \
    $(KIRBY_DOLBY_VISION)/lib64/libdolbyottcameracontrol.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdolbyottcameracontrol.so \
    $(KIRBY_DOLBY_VISION)/lib64/libsensorndkbridge.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libsensorndkbridge.so \
    $(KIRBY_DOLBY_VISION)/lib64/vendor.dolby.dvs-V1-ndk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.dolby.dvs-V1-ndk.so

# SurfaceFlinger uses client composition for the decoder's processed output.
PRODUCT_VENDOR_PROPERTIES += ro.vendor.dolby.vision.support=true
