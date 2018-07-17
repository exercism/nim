import
  sequtils, strutils, re

proc encode*(input: string): string =
  input.findAll(re"([\w\s])\1*").map(proc(i:string):string =
    if i.len > 1:
      return $i.len & i[0]
    return i 
  ).join("")

proc decode*(input: string): string =
  input.findAll(re"(\d*)(\w|\s)").map(proc(i:string):string =
    if i.len > 1: 
      let count = parseInt(i[i.low .. i.high - 1])
      return i[i.high].repeat(count)
    return i
  ).join("")
