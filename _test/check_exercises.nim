import
  os, osproc, re, strutils

type TTestResult = tuple[exercise: string, exitCode: int]

proc determineModuleName(testFilePath: string): string =
  let
    errorMsg = osproc.execCmdEx("nimrod c --verbosity=0 " & testFilePath).output
    quotedModuleName = re.findAll(errorMsg, re"\'\w+\'")[0]
  quotedModuleName[1 .. -2]

proc runTest(testFilePath: string): TTestResult =
  let
    moduleName = determineModuleName(testFilePath)
    exerciseDirPath = os.splitPath(testFilePath)[0]
    exerciseName = os.splitPath(exerciseDirPath)[1]
    examplePath = os.joinPath(exerciseDirPath, "example.nim")
    modulePath = os.joinPath(exerciseDirPath, moduleName & ".nim")
  os.moveFile(examplePath, modulePath)
  echo "### " & exerciseName & " ###"
  let exitCode = osproc.execCmd("nimrod c -r --verbosity=0 " & testFilePath)
  os.moveFile(modulePath, examplePath)
  (exerciseName, exitCode)

when isMainModule:
  var failures: seq[string] = @[]
  for file in os.walkFiles("./*/*_test.nim"):
    let (exercise, exitCode) = runTest(file)
    if exitCode != 0:
      failures.add(exercise)

  if failures.len == 0:
    echo "SUCCESS"
  else:
    echo "FAILURES: " & strutils.join(failures, ", ")
