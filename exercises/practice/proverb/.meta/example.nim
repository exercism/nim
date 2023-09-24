import std/strformat

func recite*(a: openArray[string]): string =
  result = ""
  if a.len > 0:
    for i in 0 ..< a.high:
      result.add &"For want of a {a[i]} the {a[i+1]} was lost.\n"
    result.add &"And all for the want of a {a[0]}."
