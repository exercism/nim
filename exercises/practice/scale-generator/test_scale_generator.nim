import
  std / unittest

import
  scale_generator

suite "Chromatic scales":
  test "Chromatic scale with sharps":
    check chromatic("C") ==
        @["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
  test "Chromatic scale with flats":
    check chromatic("F") ==
        @["F", "Gb", "G", "Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E"]
suite "Scales with specified intervals":
  test "Simple major scale":
    check interval("C", "MMmMMMm") == @["C", "D", "E", "F", "G", "A", "B", "C"]
  test "Major scale with sharps":
    check interval("G", "MMmMMMm") ==
        @["G", "A", "B", "C", "D", "E", "F#", "G"]
  test "Major scale with flats":
    check interval("F", "MMmMMMm") ==
        @["F", "G", "A", "Bb", "C", "D", "E", "F"]
  test "Minor scale with sharps":
    check interval("f#", "MmMMmMM") ==
        @["F#", "G#", "A", "B", "C#", "D", "E", "F#"]
  test "Minor scale with flats":
    check interval("bb", "MmMMmMM") ==
        @["Bb", "C", "Db", "Eb", "F", "Gb", "Ab", "Bb"]
  test "Dorian mode":
    check interval("d", "MmMMMmM") == @["D", "E", "F", "G", "A", "B", "C", "D"]
  test "Mixolydian mode":
    check interval("Eb", "MMmMMmM") ==
        @["Eb", "F", "G", "Ab", "Bb", "C", "Db", "Eb"]
  test "Lydian mode":
    check interval("a", "MMMmMMm") ==
        @["A", "B", "C#", "D#", "E", "F#", "G#", "A"]
  test "Phrygian mode":
    check interval("e", "mMMMmMM") == @["E", "F", "G", "A", "B", "C", "D", "E"]
  test "Locrian mode":
    check interval("g", "mMMmMMM") ==
        @["G", "Ab", "Bb", "C", "Db", "Eb", "F", "G"]
  test "Harmonic minor":
    check interval("d", "MmMMmAm") ==
        @["D", "E", "F", "G", "A", "Bb", "Db", "D"]
  test "Octatonic":
    check interval("C", "MmMmMmMm") ==
        @["C", "D", "D#", "F", "F#", "G#", "A", "B", "C"]
  test "Hexatonic":
    check interval("Db", "MMMMMM") == @["Db", "Eb", "F", "G", "A", "B", "Db"]
  test "Pentatonic":
    check interval("A", "MMAMA") == @["A", "B", "C#", "E", "F#", "A"]
  test "Enigmatic":
    check interval("G", "mAMMMmm") ==
        @["G", "G#", "B", "C#", "D#", "F", "F#", "G"]
  test "Simple major scale":
    check interval("C", "MMmMMMm") == @["C", "D", "E", "F", "G", "A", "B"]
  test "Major scale with sharps":
    check interval("G", "MMmMMMm") == @["G", "A", "B", "C", "D", "E", "F#"]
  test "Major scale with flats":
    check interval("F", "MMmMMMm") == @["F", "G", "A", "Bb", "C", "D", "E"]
  test "Minor scale with sharps":
    check interval("f#", "MmMMmMM") == @["F#", "G#", "A", "B", "C#", "D", "E"]
  test "Minor scale with flats":
    check interval("bb", "MmMMmMM") ==
        @["Bb", "C", "Db", "Eb", "F", "Gb", "Ab"]
  test "Dorian mode":
    check interval("d", "MmMMMmM") == @["D", "E", "F", "G", "A", "B", "C"]
  test "Mixolydian mode":
    check interval("Eb", "MMmMMmM") == @["Eb", "F", "G", "Ab", "Bb", "C", "Db"]
  test "Lydian mode":
    check interval("a", "MMMmMMm") == @["A", "B", "C#", "D#", "E", "F#", "G#"]
  test "Phrygian mode":
    check interval("e", "mMMMmMM") == @["E", "F", "G", "A", "B", "C", "D"]
  test "Locrian mode":
    check interval("g", "mMMmMMM") == @["G", "Ab", "Bb", "C", "Db", "Eb", "F"]
  test "Harmonic minor":
    check interval("d", "MmMMmAm") == @["D", "E", "F", "G", "A", "Bb", "Db"]
  test "Octatonic":
    check interval("C", "MmMmMmMm") ==
        @["C", "D", "D#", "F", "F#", "G#", "A", "B"]
  test "Hexatonic":
    check interval("Db", "MMMMMM") == @["Db", "Eb", "F", "G", "A", "B"]
  test "Pentatonic":
    check interval("A", "MMAMA") == @["A", "B", "C#", "E", "F#"]
  test "Enigmatic":
    check interval("G", "mAMMMmm") == @["G", "G#", "B", "C#", "D#", "F", "F#"]
