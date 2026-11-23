import std/[sets, strutils, tables]

const
  chromaticSharps = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
  chromaticFlats = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
  flatKeys = ["F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb"].toHashSet
  semitones = {'m': 1, 'M': 2, 'A': 3}.toTable

func scale*(tonic: string, intervals: string): seq[string] =
  let chromatic = if tonic in flatKeys: chromaticFlats else: chromaticSharps
  let tonicCapitalized = tonic.capitalizeAscii()
  var i = chromatic.find(tonicCapitalized)

  result = @[tonicCapitalized]
  for c in intervals:
    i += semitones[c]
    result.add chromatic[i mod 12]
