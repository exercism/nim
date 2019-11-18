# Word Count

Given a phrase, count the occurrences of each _word_ in that phrase.

For the purposes of this exercise you can expect that a _word_ will always be one of:

1. A _number_ composed of one or more ASCII digits (ie "0" or "1234") OR
2. A _simple word_ composed of one or more ASCII letters (ie "a" or "they") OR
3. A _contraction_ of two _simple words_ joined by a single apostrophe (ie "it's" or "they're")

When counting words you can assume the following rules:

1. The count is _case insensitive_ (ie "You", "you", and "YOU" are 3 uses of the same word)
2. The count is _unordered_; the tests will ignore how words and counts are ordered
3. Other than the apostrophe in a _contraction_ all forms of _punctuation_ are ignored
4. The words can be separated by _any_ form of whitespace (ie "\t", "\n", " ")

For example, for the phrase `"That's the password: 'PASSWORD 123'!", cried the Special Agent.\nSo I fled.` the count would be:

```text
that's: 1
the: 2
password: 2
123: 1
cried: 1
special: 1
agent: 1
so: 1
i: 1
fled: 1
```

## Hints

The return from `countWords` can be any hash table type with a key of `string` and a value of `int`.

Hash tables (also known as "dictionaries" or "maps" in other programming languages) are implemented by the `tables` module - see the documentation at https://nim-lang.org/docs/tables.html

For example, `countWords` could return a `TableRef[string, int]`

```nim
proc countWords*(sentence: string): TableRef[string, int] =
  ...
```


## Running the tests

To compile and run the tests, just run the following in your exercise directory:
```bash
$ nim c -r word_count_test.nim
```

## Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `$EXERCISM_WORKSPACE/nim/word-count` directory.

You can find your Exercism workspace by running `exercism debug` and looking for the line that starts with `Exercises Directory`.

## Need help?

These guides should help you,
* [Installing Nim](https://exercism.io/tracks/nim/installation)
* [Running the Tests](https://exercism.io/tracks/nim/tests)
* [Learning Nim](https://exercism.io/tracks/nim/learning)
* [Useful Nim Resources](https://exercism.io/tracks/nim/resources)


## Source

This is a classic toy problem, but we were reminded of it by seeing it in the Go Tour.

## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.
