import
  os, osproc, strutils, sequtils

type TTestResult = tuple[exercise: string, exitCode: int]

proc runTest(testFilePath: string): TTestResult =
  let
    exerciseDirPath = os.splitPath(testFilePath)[0]
    exerciseName = os.splitPath(exerciseDirPath)[1]
    moduleName = os.splitPath(testFilePath).tail.replace("_test", "")
    examplePath = os.joinPath(exerciseDirPath, "example.nim")
    modulePath = os.joinPath(exerciseDirPath, moduleName)

  os.copyFile(examplePath, modulePath)
  echo "\n ### " & exerciseName & " ###"
  let exitCode = osproc.execCmd("nim c -r --verbosity=0 " & testFilePath)
  os.removeFile(modulePath)
  (exerciseName, exitCode)

when isMainModule:
  var
    exercises: seq[string] = @[]
    failures: seq[string] = @[]

  let arguments = commandLineParams()

  if arguments.len == 0:
    exercises.add("*")
  else:
    exercises = arguments

  for exercise in exercises:
    for file in os.walkFiles(os.joinPath("./exercises", exercise, "*_test.nim")):
      let (exercise, exitCode) = runTest(file)
      if exitCode != 0:
        failures.add(exercise)

  if failures.len == 0:
    echo "SUCCESS"
  else:
    echo "FAILURES: " & failures.join(", ")
    programResult = 1
