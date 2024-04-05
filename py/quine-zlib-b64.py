import base64
import zlib


def quine(b: bytes) -> None:
    print(f"{zlib.decompress(base64.b64decode(b)).decode()}\n\n\nquine(\n    {b!r}\n)")


quine(
    b'eJzLzC3ILypRSEosTjUz4cqE8KpyMpO4uLhSUtMUCksz81I1kqwUkipLUos1FXTtFPzy81KtuBSAoKAoM69EI02pGqRBLyU1OT+3oCi1uFgDYpxekpkJSDAFaICmph6UqVkbkweCEJNj8kAGVScpFgGFNZU0AYQaL0k='
)
