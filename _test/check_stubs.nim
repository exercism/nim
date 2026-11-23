import std/[os, osproc, strformat, strutils]

iterator walkExerciseDirs: string =
  const repoRootDir = currentSourcePath().parentDir().parentDir()
  for exerciseKind in ["concept", "practice"]:
    for exerciseDir in walkDirs(repoRootDir / "exercises" / exerciseKind / "*"):
      yield exerciseDir

proc checkStubs: seq[string] =
  ## Compiles and runs the test file for every exercise, using the user-facing
  ## solution stub.
  ##
  ## Returns the exercise slugs for which the corresponding test file either:
  ##
  ## - compiles with an error
  ##
  ## - runs without an error (the solution stub is supposed to fail the tests)
  result = @[]
  stderr.writeLine "Checking stubs..."
  for exerciseDir in walkExerciseDirs():
    let slug = exerciseDir.lastPathPart()
    let testPath = exerciseDir / &"test_{slug.replace('-', '_')}.nim"
    stderr.writeLine &"{slug}"
    const nimOptions = "--hints:off --usenimcache --filenames:canonical " &
                       "--spellSuggest:0 --styleCheck:error"
    let (outpCompile, errCompile) = execCmdEx(&"nim c {nimOptions} {testPath}")
    if errCompile == 0:
      let (outpRun, errRun) = execCmdEx(&"nim r --hints:off {testPath}")
      if errRun == 0:
        stderr.write outpRun
        stderr.writeLine &"Error: the {slug} stub passed the tests\n"
        result.add slug
    else:
      stderr.writeLine outpCompile
      result.add slug

proc main =
  let errorSlugs = checkStubs()
  if errorSlugs.len > 0:
    let msg = fmt"""

      Error: there were {errorSlugs.len} exercises with a problematic stub:
      {errorSlugs.join(", ")}""".unindent()
    echo msg
    quit 1
  else:
    const msg = """

      Success. Every exercise has a test file and stub that:
      - compiles without error
      - runs with an error (we want the stub to fail the tests)""".unindent()
    echo msg

when isMainModule:
  main()
