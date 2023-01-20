import std/[sequtils, sets, strutils]

proc isIsogram*(phrase: string): bool =
  let charactersLower = phrase.filterIt(it.isAlphaAscii()).mapIt(it.toLowerAscii)
  len(toHashSet(charactersLower)) == len(charactersLower)
