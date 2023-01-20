func onSquare*(number: int): uint64 =
  if (number <= 0 or number > 64):
    raise newException(ValueError, "square must be between 1 and 64")

  1'u64 shl (number.uint64 - 1'u64)

func total*: uint64 =
  not 0'u64
