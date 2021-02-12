import strformat

func recite*(s: openArray[string]): string =
  if s.len == 0:
    return

  for i in 0 .. s.high - 1:
    result &= &"For want of a {s[i]} the {s[i+1]} was lost.\n"

  result &= &"And all for the want of a {s[0]}."
