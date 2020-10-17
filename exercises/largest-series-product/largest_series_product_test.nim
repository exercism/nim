import unittest
import largest_series_product

suite "Largest Series Product":
  test "finds the largest product if span equals length":
    check largestProduct("29", 2) == 18

  test "finds the largest product of 2 with numbers in order":
    check largestProduct("0123456789", 2) == 72

  test "finds the largest product of 2":
    check largestProduct("576802143", 2) == 48

  test "finds the largest product of 3 with numbers in order":
    check largestProduct("0123456789", 3) == 504

  test "finds the largest product of 3":
    check largestProduct("1027839564", 3) == 270

  test "finds the largest product of 5 with numbers in order":
    check largestProduct("0123456789", 5) == 15_120

  test "finds the largest product of a big number":
    check largestProduct("73167176531330624919225119674426574742355349194934",
                         6) == 23_520

  test "reports zero if the only digits are zero":
    check largestProduct("0000", 2) == 0

  test "reports zero if all spans include zero":
    check largestProduct("99099", 3) == 0

  test "rejects span longer than string length":
    expect ValueError:
      discard largestProduct("123", 4)

  test "reports 1 for empty string and empty product (0 span)":
    check largestProduct("", 0) == 1

  test "reports 1 for nonempty string and empty product (0 span)":
    check largestProduct("123", 0) == 1

  test "rejects empty string and nonzero span":
    expect ValueError:
      discard largestProduct("", 1)

  test "rejects invalid character in digits":
    expect ValueError:
      discard largestProduct("1234a5", 2)

  test "rejects negative span":
    expect ValueError:
      discard largestProduct("12345", -1)

  # Bonus
  test "finds the largest product of a big number from Project Euler problem 8":
    const n = "73167176531330624919225119674426574742355349194934" &
              "96983520312774506326239578318016984801869478851843" &
              "85861560789112949495459501737958331952853208805511" &
              "12540698747158523863050715693290963295227443043557" &
              "66896648950445244523161731856403098711121722383113" &
              "62229893423380308135336276614282806444486645238749" &
              "30358907296290491560440772390713810515859307960866" &
              "70172427121883998797908792274921901699720888093776" &
              "65727333001053367881220235421809751254540594752243" &
              "52584907711670556013604839586446706324415722155397" &
              "53697817977846174064955149290862569321978468622482" &
              "83972241375657056057490261407972968652414535100474" &
              "82166370484403199890008895243450658541227588666881" &
              "16427171479924442928230863465674813919123162824586" &
              "17866458359124566529476545682848912883142607690042" &
              "24219022671055626321111109370544217506941658960408" &
              "07198403850962455444362981230987879927244284909188" &
              "84580156166097919133875499200524063689912560717606" &
              "05886116467109405077541002256983155200055935729725" &
              "71636269561882670428252483600823257530420752963450"
    check largestProduct(n, 13) == 23_514_624_000
