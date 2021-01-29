import tables

let
  times = {
    "Earth": 31558149.76,
    "Mercury": 7600530.24,
    "Venus": 19413907.2,
    "Mars": 59354294.4,
    "Jupiter": 374335776.0,
    "Saturn": 929596608.0,
    "Uranus": 2661041808.0,
    "Neptune": 5200418592.0
  }.toTable

proc age*(planet: string, seconds: int64): float =
  seconds.float / times[planet]
