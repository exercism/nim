import strformat

type
  DayRange = range[1..12]
  DayArray[T] = array[DayRange, T]

const gifts: DayArray[string] = [
  "a Partridge in a Pear Tree",
  "two Turtle Doves",
  "three French Hens",
  "four Calling Birds",
  "five Gold Rings",
  "six Geese-a-Laying",
  "seven Swans-a-Swimming",
  "eight Maids-a-Milking",
  "nine Ladies Dancing",
  "ten Lords-a-Leaping",
  "eleven Pipers Piping",
  "twelve Drummers Drumming"]

const nth: DayArray[string] = [
  "first", "second", "third", "fourth", "fifth", "sixth",
  "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

func generateVerses: tuple[song: string, indices: DayArray[int]] =
  ## Returns a tuple of:
  ##   `song`: the song text, including two newlines after every verse.
  ##   `indices`: the index in `song` of the first character for each verse.
  for n in nth.low .. nth.high:
    result.indices[n] = result.song.len
    result.song &= &"On the {nth[n]} day of Christmas my true love gave to me: "
    for i in countdown(n, 1):
      case i
      of 3..12:
        result.song &= &"{gifts[i]}, "
      of 2:
        result.song &= &"{gifts[i]}, and "
      of 1:
        result.song &= &"{gifts[i]}.\n\n"

const (song, indices) = generateVerses() # Generate the lyrics at compile-time.

func recite*(start: DayRange, stop: DayRange = 1): string =
  let stop = if stop == 1: start else: stop # Workaround for Nim bug #11274.
  let firstChar = indices[start]
  let lastChar = if stop == 12: song.high - 2 else: indices[stop + 1] - 3
  result = song[firstChar .. lastChar] # Excludes the final two newlines.
