import std/[genasts, json, macros, options, os, sets, strutils, sugar]
when not defined(testing):
  import std/sequtils
from std/unicode import title
import jsony,  parsetoml

{.experimental: "strictFuncs".}

type
  ExerciseData = object
    exercise: string
    cases   : TestGroup
  TestGroup = seq[LabeledTestItem]
  TestKind = enum
    single, group
  LabeledTestItem = object
    case kind: TestKind
    of single:
      test: LabeledTest
    of group:
      tests: LabeledTestGroup
  LabeledTest = object
    uuid, reimplements: string
    description: string
    scenarios: seq[Scenario]
    property: string
    input: JsonNode
    expected: Expected
  LabeledTestGroup = object
    description: string
    scenarios: seq[Scenario]
    cases: TestGroup
  Expected = JsonNode
  Scenario = enum
    sBig_integer        = "big-integer",
    sFloating_point     = "floating-point",
    sImmutable          = "immutable",
    sLibrary_test       = "library-test",
    sLocal_Scope        = "local-scope",
    sUnicode            = "unicode",
    sInput_validation   = "input-validation",
    sRuntime_validation = "runtime-validation"

when defined(testing):
  type
    UniversalSet = object

  template contains*(s: UniversalSet, uuid: string): bool = true

when isMainModule:
  const
    probSpecExercisesDir {.strdefine.} = "../../problem-specifications/exercises"

const
  slug {.strdefine.} = "anagram"
  implementedTests =
    when not defined(testing):
      staticRead("../exercises/practice" / slug / ".meta/tests.toml")
        .parseString
        .getTable
        .pairs.toSeq
        .filter(
          test =>
            (if test[1].hasKey("include"): test[1]["include"].getBool else: true)
        )
        .map(test => test[0]).toHashSet
    else:
      UniversalSet()

func parseHook*(s: string, index: var int, testItem: var LabeledTestItem) =
  var jsonData: JsonNode
  parseHook(s, index, jsonData)
  if jsonData.hasKey("cases"):
    testItem = LabeledTestItem(
      kind: group,
      tests: jsonData.pretty.fromJson(LabeledTestGroup))
  else:
    testItem = LabeledTestItem(
      kind: single,
      test: jsonData.pretty.fromJson(LabeledTest))

func convertToNimArg*(jsonNode: JsonNode): NimNode =
  ## https://irclogs.nim-lang.org/16-01-2022.html#23:19:51
  result =
    case jsonNode.kind
      of JBool:
        newLit(jsonNode.getBool)
      of JInt:
        newLit(jsonNode.getInt)
      of JFloat:
        newLit(jsonNode.getFLoat)
      of JString:
        let strVal = jsonNode.getStr
        if " -> " in strVal or " => " in strVal: # TODO: deal with functions
          parseExpr(strVal.replace("->", "=>").replace("modulo", "mod"))
        else:
          newLit(strVal)
      of JNull:
        newNilLit()
      of JArray:
        if jsonNode.getElems.len > 0:
          let arg = nnkBracket.newTree()
          for entry in jsonNode:
            arg.add convertToNimArg(entry)
          prefix(arg, "@")
        else:
          newCall(
            nnkBracketExpr.newTree(
              ident "newSeq",
              ident "int"))
      of JObject:
        let tup = newNimNode(nnkTupleConstr)
        for key, value in jsonNode:
          tup.add(
            newColonExpr(
              ident key,
              convertToNimArg(value)))
        tup

func generateInputs*(inputs: JsonNode, callName: string): NimNode =
  if inputs.kind == JObject:
    newCall callName:
      collect:
        for input in inputs.keys:
          convertToNimArg inputs[input]
  else:
    newCall(callName, convertToNimArg(inputs))
      

func generateExpected*(expected: JsonNode): NimNode =
  if expected.kind == JObject and expected.hasKey("error"):
    error("I can't deal with errors yet")
    return
  result = convertToNimArg(expected)

func generateTest*(test: LabeledTest): NimNode =
  let testCall = generateInputs(test.input, test.property)

  result =
    if test.uuid in implementedTests:
      genast(desc = newLit(test.description), testCall, expected = generateExpected(test.expected)):
        test desc:
          check testCall == expected
    else:
      newEmptyNode()

func generateTests*(data: LabeledTestItem): NimNode =
  result = newStmtList()
  result.add:
    case data.kind
      of group:
        let tests = newStmtList()
        for testItem in data.tests.cases:
          tests.add generateTests(testItem)
        tests
      of single:
        generateTest(data.test)

func generateTests*(data: ExerciseData): NimNode =
  let
    underslug = data.exercise.replace("-", "_")
    stdImports =
      if underslug in ["accumulate", "list_ops"]:
        nnkBracket.newTree(
          ident "unittest",
          ident "sugar")
      else:
        ident "unittest"

  result =
    newStmtList(
      nnkImportStmt.newTree(
        infix(
          ident "std",
          "/",
          stdImports
        )
      ),
      nnkImportStmt.newTree(ident underslug)
    )

  if data.cases[0].kind == single:
      result.add(
        newCall(
          ident "suite",
          newLit(data.exercise.title & " tests"),
          newStmtList()))

  for testItem in data.cases:
    case testItem.kind
      of group:
        result.add(
          newCall(
            ident "suite",
            newLit(testItem.tests.description),
            generateTests(testItem)))
      of single:
        result[^1][^1].add generateTest(testItem.test)

      
        
when isMainModule:
  static:
    let
      canonicalJsonData = staticRead(probSpecExercisesDir / slug / "canonical-data.json").fromJson(ExerciseData)
      nimTestCode = generateTests(canonicalJsonData)
    echo repr nimTestCode
    when defined(writeTestFile):
      let underslug = canonicalJsonData.exercise.replace("-", "_")
      writeFile("test_" & underslug & ".nim", nimTestCode.repr.strip & '\n')
    else:
      warning("The test aren't saved without `-d:writeTestFile`")
