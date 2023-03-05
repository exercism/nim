import std/strutils

const chromaticIntervals = "m".repeat(11)

proc scale*(tonic: string, intervals = chromaticIntervals): seq[string] =
  discard
