import sets, strutils, tables

const
  chromaticSharps = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
  chromaticFlats = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
  flatKeys = ["F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb"].toHashSet
  semitones = {'m': 1, 'M': 2, 'A': 3}.toTable
  defaultIntervals = "m".repeat(11)

func scale*(tonic: string, intervals = defaultIntervals): seq[string] =
  let chromatic = if tonic in flatKeys: chromaticFlats else: chromaticSharps
  let tonicCapitalized = tonic.capitalizeAscii()
  var i = chromatic.find(tonicCapitalized)

  result = @[tonicCapitalized]
  for c in intervals:
    i += semitones[c]
    result &= chromatic[i mod 12]
