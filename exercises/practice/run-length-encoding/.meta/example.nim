import std/parseutils
from std/private/digitsutils import addInt

func encode*(s: string): string =
  result = ""
  var i = 0
  while i < s.len:
    let c = s[i]
    let count = s.skipWhile({c}, i)
    if count > 1:
      result.addInt count
    result.add c
    i += count

func decode*(s: string): string =
  result = ""
  var i = 0
  while i < s.len:
    var n = 0.uint
    let digitsParsed = s.parseUInt(n, i)
    i += digitsParsed
    for _ in 0 .. (if digitsParsed > 0: n-1 else: 0):
      result.add s[i]
    inc i
