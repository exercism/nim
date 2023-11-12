func onSquare*(n: int): uint64 =
  if n in 1..64:
    1'u64 shl (n.uint64 - 1'u64)
  else:
    raise newException(ValueError, "input must be between 1 and 64")

func total*: uint64 =
  uint64.high
