type
  Clock* = object
    hour*: range[0..23]
    minute*: range[0..59]

  Minutes* = distinct int

proc initClock*(hour, minute: int): Clock =
  discard

proc `$`*(c: Clock): string =
  discard

proc `+`*(c: Clock, v: Minutes): Clock =
  discard

proc `-`*(c: Clock, v: Minutes): Clock =
  discard
