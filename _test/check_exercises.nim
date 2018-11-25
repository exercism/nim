import
  os, osproc, re, strutils

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
  var failures: seq[string] = @[]
  for dir in os.walkDir("./exercises"):
    for file in os.walkFiles(os.joinPath(dir.path, "*_test.nim")):
      let (exercise, exitCode) = runTest(file)
      if exitCode != 0:
        failures.add(exercise)

  if failures.len == 0:
    echo "SUCCESS"
  else:
    echo "FAILURES: " & strutils.join(failures, ", ")
    programResult = 1
