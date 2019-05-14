import unittest
import scale_generator

suite "Scale Generator":
  test "chromatic scale with sharps":
    check scale("C") == @["C", "C#", "D", "D#", "E", "F",
                          "F#", "G", "G#", "A", "A#", "B"]

  test "chromatic scale with flats":
    check scale("F") == @["F", "Gb", "G", "Ab", "A", "Bb",
                          "B", "C", "Db", "D", "Eb", "E"]

  test "simple major scale":
    check scale("C", "MMmMMMm") == @["C", "D", "E", "F", "G", "A", "B"]

  test "major scale with sharps":
    check scale("G", "MMmMMMm") == @["G", "A", "B", "C", "D", "E", "F#"]

  test "major scale with flats":
    check scale("F", "MMmMMMm") == @["F", "G", "A", "Bb", "C", "D", "E"]

  test "minor scale with sharps":
    check scale("f#", "MmMMmMM") == @["F#", "G#", "A", "B", "C#", "D", "E"]

  test "minor scale with flats":
    check scale("bb", "MmMMmMM") == @["Bb", "C", "Db", "Eb", "F", "Gb", "Ab"]

  test "dorian mode":
    check scale("d", "MmMMMmM") == @["D", "E", "F", "G", "A", "B", "C"]

  test "mixolydian mode":
    check scale("Eb", "MMmMMmM") == @["Eb", "F", "G", "Ab", "Bb", "C", "Db"]

  test "lydian mode":
    check scale("a", "MMMmMMm") == @["A", "B", "C#", "D#", "E", "F#", "G#"]

  test "phrygian mode":
    check scale("e", "mMMMmMM") == @["E", "F", "G", "A", "B", "C", "D"]

  test "locrian mode":
    check scale("g", "mMMmMMM") == @["G", "Ab", "Bb", "C", "Db", "Eb", "F"]

  test "harmonic minor":
    check scale("d", "MmMMmAm") == @["D", "E", "F", "G", "A", "Bb", "Db"]

  test "octatonic":
    check scale("C", "MmMmMmMm") == @["C", "D", "D#", "F", "F#", "G#", "A", "B"]

  test "hexatonic":
    check scale("Db", "MMMMMM") == @["Db", "Eb", "F", "G", "A", "B"]

  test "pentatonic":
    check scale("A", "MMAMA") == @["A", "B", "C#", "E", "F#"]

  test "enigmatic":
    check scale("G", "mAMMMmm") == @["G", "G#", "B", "C#", "D#", "F", "F#"]
