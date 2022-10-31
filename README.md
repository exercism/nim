# Exercism Nim Track

Exercism exercises in Nim

## Contributing Guide

Please see the [contributing guide](https://exercism.org/docs/building/tracks).

## Testing

The file [`_test/check_exercises.nim`](https://github.com/exercism/nim/blob/main/_test/check_exercises.nim) checks that the example solution for every implemented exercise passes that exercise's test suite. This repo runs that file during CI, and you can also run it on your own machine.

To test all the exercises, run:

```shell
nim c -r check_exercises.nim
```

To test a selection of exercises, run:

```shell
nim c -r check_exercises.nim [exercise-name] [...]
```

This finds all the relevant tests, processes them into a new directory for testing, and runs them. For more information, please read the documentation comments in [`_test/check_exercises.nim`](https://github.com/exercism/nim/blob/main/_test/check_exercises.nim) or run `check_exercises` with the `--help` option.

### Nim icon

The Nim logo is assumed to be owned by Andreas Rumpf. It appears to be released under the MIT license, along with the Nim codebase. We've adapted the official Nim logo by changing the colors, which we believe falls under fair use.
