# Exercism Nim Track

[![Build Status](https://travis-ci.org/exercism/nim.png?branch=master)](https://travis-ci.org/exercism/nim)

Exercism exercises in Nim

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

### How to run exercise's unit tests

The test runner that Travis CI uses is it's own Nim application found at `_test/check_exercises.nim` in the repository. To run the test locally you need to compile the application and then run it.

Then to run all the unit test, run 
```bash
$ nim c -r _test/check_exercises.nim
```

If you would like to run one or more unit test, run 
```bash
$ nim c -r _test/check_exercises.nim <exercise_name> <exercise_name>
```

This will run all the unit tests in the exercise folders, along with renaming the `example.nim` to the appropriate module name to be imported into the unit test. After the test is done, it will rename the file back to `example.nim`. If all test pass, then you will see `SUCCESS` as the last line, if there are any errors you will see `FAILURES` with a list of exercises that have a failing test.

### Nim icon
The Nim logo is assumed to be owned by Andreas Rumpf. It appears to be released under the MIT license, along with the Nim codebase. We've adapted the official Nim logo by changing the colors, which we believe falls under fair use.
