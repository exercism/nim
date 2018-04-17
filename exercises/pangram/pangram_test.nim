import unittest

from pangram import is_pangram


test "sentence empty":
    check is_pangram("") == false

test "recognizes a perfect lower case pangram":
    check is_pangram("abcdefghijklmnopqrstuvwxyz") == true

test "test pangram with only lower case":
    check is_pangram("the quick brown fox jumps over the lazy dog") == true

test "missing character x":
    check is_pangram("a quick movement of the enemy will jeopardize five gunboats") == false

test "another missing character":
    check is_pangram("five boxing wizards jump quickly at it") == false

test "pangram with underscores":
    check is_pangram("the_quick_brown_fox_jumps_over_the_lazy_dog") == true

test "pangram with numbers":
    check is_pangram("the 1 quick brown fox jumps over the 2 lazy dogs") == true

test "missing letters replaced by numbers":
    check is_pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog") == false

test "pangram with mixedcase and punctuation":
    check is_pangram("Five quacking Zephyrs jolt my wax bed.") == true

test "upper and lower case versions of the same character":
    check is_pangram("the quick brown fox jumped over the lazy FX") == false

