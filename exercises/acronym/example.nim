import
  strutils, sequtils 

proc abbreviate*(phrase: string): string =
  let words = phrase.split({' ', '-', ','}).filterIt(it.isAlphaAscii)
  words.mapIt(it[0].toUpperAscii).join
