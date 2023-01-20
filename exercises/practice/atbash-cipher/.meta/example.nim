import std/[sequtils, strutils]

const
  Plain = "abcdefghijklmnopqrstuvwxyz"
  Cipher = "zyxwvutsrqponmlkjihgfedcba"


func group(s: string, digits = 5): string =
  result = ""
  var c = 0
  for item in s:
    if c == digits:
      result.add(" ")
      c = 0
    result.add(item)
    inc(c)

func clean(phrase: string): seq[char] =
  phrase.toLowerAscii.filterIt(it.isAlphaNumeric)

func convert(c: char, fromInput: string, toInput: string): char =
  if c.isAlphaAscii: toInput[fromInput.find(c)] else: c

func encode*(phrase: string): string =
  phrase.clean.mapIt(it.convert(Plain, Cipher)).join("").group

func decode*(phrase: string): string =
  phrase.clean.mapIt(it.convert(Cipher, Plain)).join("")
