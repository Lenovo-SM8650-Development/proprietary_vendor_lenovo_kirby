// SPDX-License-Identifier: Apache-2.0

#include <media/stagefright/bqhelper/GraphicBufferSource.h>
#include <ui/GraphicBufferMapper.h>

namespace android {

// The stock Codec2 library expects the pre-gralloc-4 lock and unlock symbols.
status_t lockDolbyBuffer(GraphicBufferMapper* mapper, buffer_handle_t handle, uint32_t usage,
                         const Rect& bounds, void** address, int32_t* bytesPerPixel,
                         int32_t* bytesPerStride)
        asm("_ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPvPiS9_");

status_t lockDolbyBuffer(GraphicBufferMapper* mapper, buffer_handle_t handle, uint32_t usage,
                         const Rect& bounds, void** address, int32_t* bytesPerPixel,
                         int32_t* bytesPerStride) {
    auto result = mapper->lock(handle, static_cast<int64_t>(usage), bounds);
    if (!result.has_value()) return result.asStatus();

    const auto& buffer = result.value();
    *address = buffer.address;
    if (bytesPerPixel) *bytesPerPixel = buffer.bytesPerPixel;
    if (bytesPerStride) *bytesPerStride = buffer.bytesPerStride;
    return OK;
}

status_t unlockDolbyBuffer(GraphicBufferMapper* mapper, buffer_handle_t handle)
        asm("_ZN7android19GraphicBufferMapper6unlockEPK13native_handle");

status_t unlockDolbyBuffer(GraphicBufferMapper* mapper, buffer_handle_t handle) {
    return mapper->unlock(handle, nullptr);
}

using HidlGraphicBufferProducer = hardware::graphics::bufferqueue::V1_0::IGraphicBufferProducer;

sp<HidlGraphicBufferProducer> getDolbyBufferProducer(const GraphicBufferSource* source)
        asm("_ZNK7android19GraphicBufferSource25getHGraphicBufferProducerEv");

sp<HidlGraphicBufferProducer> getDolbyBufferProducer(const GraphicBufferSource* source) {
    return source->getHGraphicBufferProducer_V1_0();
}

}  // namespace android
