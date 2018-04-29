import unittest

import space_age

suite "Space Age":

  test "age on Earth":
    check age("Earth", 1000000000) == 31.69
    
  test "age on Mercury":
    check age("Mercury", 2134835688) == 280.88

  test "age on Venus":
    check age("Venus", 189839836) == 9.78
    
  test "age on Mars":
    check age("Mars", 2329871239) == 39.25

  test "age on Jupiter":
    check age("Jupiter", 901876382) == 2.41

  test "age on Saturn":
    check age("Saturn", 3000000000) == 3.23

  test "age on Uranus":
    check age("Uranus", 3210123456) == 1.21

  test "age on Neptune":
    check age("Neptune", 8210123456) == 1.58
