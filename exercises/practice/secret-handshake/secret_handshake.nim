type
  Action* = enum
    Wink, DoubleBlink, CloseEyes, Jump

proc commands*(n: int): seq[Action] =
  discard
