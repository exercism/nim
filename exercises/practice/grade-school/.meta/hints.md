## Hints

To get the test passing, you are going to need to create some types for your code to work on, you need an object for `School` to hold a sequence of type `Student`, which will be a tuple of `string` and `int` to hold name and grade for the students.

Here is some code for the types that could be helpful when getting started

```nim
type
  Student* = tuple[name: string, grade: int]
  School* = object
    students*: seq[Student]
```
