import
  sequtils, sets, strutils

proc isIsogram*(phrase: string): bool =
  let characters_lower = phrase.filterIt(it.isAlphaAscii()).mapIt(it.toLowerAscii)
  len(toSet(characters_lower)) == len(characters_lower)
