import std/strutils

func convert*(sound: int): string =
  var raindrops = ""

  if (sound mod 3) == 0:
    raindrops.add("Pling")

  if (sound mod 5) == 0:
    raindrops.add("Plang")

  if (sound mod 7) == 0:
    raindrops.add("Plong")

  if len(raindrops) > 0:
    raindrops
  else:
    intToStr(sound)
