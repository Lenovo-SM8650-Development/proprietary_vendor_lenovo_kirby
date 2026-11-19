#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Match the stock Dolby GraphicBuffer allocations to Kirby's current libui."""

from hashlib import sha256
from pathlib import Path
import struct

LIBDIR = Path(__file__).resolve().parent / "stock/lib64"
# These file offsets are the mov w0, #256 instructions feeding operator new
# immediately before constructing a GraphicBuffer in the .298 blobs.
SITES = {
    "libcodec2_dovi.so": (
        "8febd0cc48c38125df6c6a1219ccb1d5c213dac7e11c937c885dd402e2f66f34",
        (0x8B8E8, 0x8C7A0, 0x8D65C, 0x8E310),
    ),
    "c2.dolby.hevc.dec.so": (
        "a5cd2aaf6cebbf55726000547dd8784a9aae0a53d04b5f80c5d7678f7a434863",
        (0x19CA8,),
    ),
    "c2.dolby.hevc.sec.dec.so": (
        "1bbf5ff2f703d6865b5578e561859dec199eed3146794dea69007bf6c2df9b42",
        (0x19CB8,),
    ),
}


def mov_w0(size):
    return struct.pack("<I", 0x52800000 | (size << 5))


def main():
    # Current AHardwareBuffer_allocate reserves 3376 bytes for GraphicBuffer.
    old, new = mov_w0(256), mov_w0(3376)
    updates = {}
    for name, (original, offsets) in SITES.items():
        path = LIBDIR / name
        data = bytearray(path.read_bytes())
        if any(data[offset:offset + 4] not in (old, new) for offset in offsets):
            raise SystemExit(f"{name}: unexpected instructions at the patch sites")
        for offset in offsets:
            data[offset:offset + 4] = old
        if sha256(data).hexdigest() != original:
            raise SystemExit(f"{name}: unexpected input revision")
        for offset in offsets:
            data[offset:offset + 4] = new
        updates[path] = data
    for path, data in updates.items():
        if path.read_bytes() != data:
            path.write_bytes(data)


if __name__ == "__main__":
    main()
