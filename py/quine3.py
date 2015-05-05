(lambda op, rep: lambda s: print(op(s, rep(s))))((lambda a, b: a+b), '(\n{!r})'.format)(
"(lambda op, rep: lambda s: print(op(s, rep(s))))((lambda a, b: a+b), '(\\n{!r})'.format)")
