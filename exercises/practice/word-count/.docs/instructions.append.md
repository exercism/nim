# Hints

The return from `countWords` can be any hash table type with a key of `string` and a value of `int`.

Hash tables (also known as "dictionaries" or "maps" in other programming languages) are implemented by the `tables` module - see the documentation at https://nim-lang.org/docs/tables.html

For example, `countWords` could return a `TableRef[string, int]`

```nim
proc countWords*(sentence: string): TableRef[string, int] =
  ...
```
