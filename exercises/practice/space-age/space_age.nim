type
  Planet* = enum
    Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune

proc age*(planet: Planet, seconds: int64): float =
  discard
