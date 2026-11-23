type
  Planet* = enum
    Mercury
    Venus
    Earth
    Mars
    Jupiter
    Saturn
    Uranus
    Neptune

const times = [
  Mercury: 7600530.24,
  Venus: 19413907.2,
  Earth: 31558149.76,
  Mars: 59354294.4,
  Jupiter: 374335776.0,
  Saturn: 929596608.0,
  Uranus: 2661041808.0,
  Neptune: 5200418592.0
]

func age*(planet: Planet, seconds: int64): float =
  seconds.float / times[planet]
