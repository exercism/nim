import
  sequtils, sets, strutils

proc isIsogram*(phrase: string): bool =
  let characters_lower = phrase.filterIt(it.isAlphaAscii()).mapIt(it.toLowerAscii)
  len(toHashSet(characters_lower)) == len(characters_lower)
