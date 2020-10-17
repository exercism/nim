import unittest
import diamond

suite "Diamond":
  test "degenerate case with a single 'A' row":
    const expected = "A\n"
    check diamond('A') == expected

  test "degenerate case with no row containing 3 distinct groups of spaces":
    const expected = " A \n" &
                     "B B\n" &
                     " A \n"
    check diamond('B') == expected

  test "smallest non-degenerate case with odd diamond side length":
    const expected = "  A  \n" &
                     " B B \n" &
                     "C   C\n" &
                     " B B \n" &
                     "  A  \n"
    check diamond('C') == expected

  test "smallest non-degenerate case with even diamond side length":
    const expected = "   A   \n" &
                     "  B B  \n" &
                     " C   C \n" &
                     "D     D\n" &
                     " C   C \n" &
                     "  B B  \n" &
                     "   A   \n"
    check diamond('D') == expected

  test "largest possible diamond":
    const expected = "                         A                         \n" &
                     "                        B B                        \n" &
                     "                       C   C                       \n" &
                     "                      D     D                      \n" &
                     "                     E       E                     \n" &
                     "                    F         F                    \n" &
                     "                   G           G                   \n" &
                     "                  H             H                  \n" &
                     "                 I               I                 \n" &
                     "                J                 J                \n" &
                     "               K                   K               \n" &
                     "              L                     L              \n" &
                     "             M                       M             \n" &
                     "            N                         N            \n" &
                     "           O                           O           \n" &
                     "          P                             P          \n" &
                     "         Q                               Q         \n" &
                     "        R                                 R        \n" &
                     "       S                                   S       \n" &
                     "      T                                     T      \n" &
                     "     U                                       U     \n" &
                     "    V                                         V    \n" &
                     "   W                                           W   \n" &
                     "  X                                             X  \n" &
                     " Y                                               Y \n" &
                     "Z                                                 Z\n" &
                     " Y                                               Y \n" &
                     "  X                                             X  \n" &
                     "   W                                           W   \n" &
                     "    V                                         V    \n" &
                     "     U                                       U     \n" &
                     "      T                                     T      \n" &
                     "       S                                   S       \n" &
                     "        R                                 R        \n" &
                     "         Q                               Q         \n" &
                     "          P                             P          \n" &
                     "           O                           O           \n" &
                     "            N                         N            \n" &
                     "             M                       M             \n" &
                     "              L                     L              \n" &
                     "               K                   K               \n" &
                     "                J                 J                \n" &
                     "                 I               I                 \n" &
                     "                  H             H                  \n" &
                     "                   G           G                   \n" &
                     "                    F         F                    \n" &
                     "                     E       E                     \n" &
                     "                      D     D                      \n" &
                     "                       C   C                       \n" &
                     "                        B B                        \n" &
                     "                         A                         \n"
    check diamond('Z') == expected
