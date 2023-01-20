import std/[math, strutils]

func encrypt*(s: string): string =
  var normalized = newStringOfCap(s.len)
  for c in s.toLowerAscii():
    if c in {'a'..'z'} or c in {'0'..'9'}:
      normalized &= c

  let r = normalized.len.float.sqrt.ceil.int
  let c = (normalized.len.float / r.float).round.int
  normalized = normalized.alignLeft(r*c, ' ')

  var ct = newSeq[string]()
  for s in 0 ..< r:
    var word = ""
    for i in countup(s, normalized.high, r):
      word &= normalized[i]

    ct &= word

  result = ct.join(" ")
