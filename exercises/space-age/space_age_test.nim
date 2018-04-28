import unittest

import space_age

suite "Space Age":
  test "age on Earth":
    let age = SpaceAge(seconds: 1000000000)
    check age.onEarth() == 31.69
    
  test "age on Mercury":
    let age = SpaceAge(seconds: 2134835688)
    check age.onMercury() == 280.88

  test "age on Venus":
    let age = SpaceAge(seconds: 189839836)
    check age.onVenus() == 9.78
    
  test "age on Mars":
    let age = SpaceAge(seconds: 2329871239)
    check age.onMars() == 39.25

  test "age on Jupiter":
    let age = SpaceAge(seconds: 901876382)
    check age.onJupiter() == 2.41

  test "age on Saturn":
    let age = SpaceAge(seconds: 3000000000)
    check age.onSaturn() == 3.23

  test "age on Uranus":
    let age = SpaceAge(seconds: 3210123456)
    check age.onUranus() == 1.21

  test "age on Neptune":
    let age = SpaceAge(seconds: 8210123456)
    check age.onNeptune() == 1.58
