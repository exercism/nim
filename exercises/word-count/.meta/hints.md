The return from `countWords` is a `TableRef[string, int]`, which is a hash table (or dictionary in other programming languages) with a key of `string` and a value of `int`. Look at Nim's documentation on `tables` at https://nim-lang.org/docs/tables.html

For the procedure signature, the return will be of type `TableRef[string, int]`

```nim
proc countWords*(sentence: string): TableRef[string, int] =
  ...
```