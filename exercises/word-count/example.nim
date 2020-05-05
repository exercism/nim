import re, strutils, tables

iterator words(sentence: string): string =
  for word in sentence.findAll(re"[a-zA-Z0-9]+(['][a-z]+)?"):
    yield toLowerAscii(word)

proc countWords*(sentence: string): TableRef[string, int] =
  result = newTable[string, int]()
  for word in words(sentence):
    let count = result.getOrDefault(word)
    result[word] = count + 1
