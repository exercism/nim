import std/[genasts, macros, strutils, sugar]

import ../generator

func generateTestMacro(procType: NimNode): NimNode =
  let
    procName = procType.strVal
    macroName = ident "test" & procName.capitalizeAscii
    transformedParams =
      collect:
        for paramDef in procType.getTypeImpl[0][1..^1]:
          paramDef.expectKind nnkIdentDefs
          paramDef[2].expectKind nnkEmpty

          newIdentDefs(
            ident paramDef[0].strVal,
            nnkCommand.newTree(
              ident "static",
              ident paramDef[1].strVal),
            newEmptyNode())
    inputNames =
      collect:
        for identDef in transformedParams:
          identDef[0]
    macroBody =
      newCall(
        procName,
        inputNames
      )

  result =  genast(macroName, macroBody) do:
    macro macroName(): untyped =
      macroBody  # echo treerepr result
  result.params.add transformedParams


macro generateTestMacros(p: varargs[typed]): untyped =
  result = nnkStmtList.newNimNode()
  for procType in p:
    case procType.kind
    of nnkSym:
      result.add generateTestMacro procType
    of nnkClosedSymChoice:
      for choice in procType:
        result.add generateTestMacro choice
    else:
      error("Don't know how to deal with " & repr(procType) & " with a node kind of " & $procType.kind)
    

# generateTestMacros convertToNimArg, generateTest, generateTests, generateExpected, generateInputs

generateTestMacros(generateTests)

macro typedTest(x: typed) =
  echo treerepr x
  echo x.kind
  # echo treerepr x[0].gettypeimpl
  # echo treerepr x[1].gettypeimpl

typedTest(generateTests)
typedTest(generateInputs)

# echo testConvertToNimArg(%*[1, 2, 3, 4])
