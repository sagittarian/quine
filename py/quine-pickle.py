import pickle


def quine(b: bytes) -> None:
    print(f"{pickle.loads(b)}\n\nquine({b})")

quine(b'\x80\x04\x95^\x00\x00\x00\x00\x00\x00\x00\x8cZimport pickle\n\n\ndef quine(b: bytes) -> None:\n    print(f"{pickle.loads(b)}\\n\\nquine({b})")\x94.')
