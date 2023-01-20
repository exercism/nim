import std/strformat

func recite*(s: openArray[string]): string =
  if s.len == 0:
    return

  for i in 0 .. s.high - 1:
    result.add &"For want of a {s[i]} the {s[i+1]} was lost.\n"

  result.add &"And all for the want of a {s[0]}."
