import
  math

type
  SpaceAge* = object
    seconds*: int64


proc onMercury*(age: SpaceAge): float =
  round(age.seconds.float / 7600530.24, 2)


proc onVenus*(age: SpaceAge): float =
  round(age.seconds.float / 19413907.2, 2)


proc onEarth*(age: SpaceAge): float =
  round(age.seconds.float / 31558149.76, 2)


proc onMars*(age: SpaceAge): float =
  round(age.seconds.float / 59354294.4, 2)


proc onJupiter*(age: SpaceAge): float =
  round(age.seconds.float / 374335776.0, 2)


proc onSaturn*(age: SpaceAge): float =
  round(age.seconds.float / 929596608.0, 2)


proc onUranus*(age: SpaceAge): float =
  round(age.seconds.float / 2661041808.0, 2)


proc onNeptune*(age: SpaceAge): float =
    round(age.seconds.float / 5200418592.0, 2)
