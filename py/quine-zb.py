from base64 import b64decode as b; from zlib import decompress as z; d = bytes.decode
(lambda x: print(f"{d(z(b(x)))}(\n{x!r})"))(
b'eJw1yzEOwyAQBdE+p/hxtdukslzEyk3SsF6QkIxBQEGwfPcIRannjcsxQEyxywwfUswVssxqt6gWpkBWuEH67uUPRg0p21KG6CsUL8in2vL4jTfaTRA1aE+k7I9KbjqVOgk1Zr7ofZztni+emL9V+ytl')
