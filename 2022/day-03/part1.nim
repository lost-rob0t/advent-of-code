import strutils

type
  LifeSupport = ref object
    numbers: seq[string]
    life: int
    c02: int


proc load_file(input: string): seq[string] =
  let file = open(input, fmRead)
  defer: file.close()
  var line_bits: seq[string]
  for line in file.lines:
    line_bits.add(line)
  return line_bits
proc toString(str: seq[char]): string =
  result = newStringOfCap(len(str))
  for ch in str:
    add(result, ch)

proc partOne(input: seq[string], mode: string): int =
  var bits: seq[string]
  for index in 0..11:
    var zero = 0
    var one = 0
    for line in input:
      let v = toString(@[line[index]])
      if parseInt(v) == 1:
        one += 1
        when defined(info):
          echo("one")
      else:
        zero += 1
        when defined(info):
          echo("zero")
    if mode == "gamma":
      if one > zero:
        bits.add("1")
      else:
        bits.add("0")
    else:
      if one > zero:
        bits.add("0")
      else:
        bits.add("1")
  let bin = bits.join()
  when defined(info):
    echo bin
  return parseBinInt(bin)


proc filterBits(input: seq[string], pos: int, filter: int): seq[string] =
  var valid: seq[string]
  for line in input:
    let v = toString(@[line[pos]])
    if parseInt(v) == filter:
      valid.add(line)
  return valid

proc bitCount(input: seq[string], pos: int, mode: string): int =
  var one, zero: int
  for line in input:
    let v = toString(@[line[pos]])
    var zero = 0
    var one = 0
    for line in input:
      when defined(info):
        echo("Zero: ", zero, " One: ", one)
      let v = toString(@[line[pos]])
      if parseInt(v) == 1:
        one += 1
        when defined(info):
          echo("one")
      else:
        zero += 1
        when defined(info):
          echo("zero")
  if mode == "gamma":
    if one == zero:
      return 1
    if one > zero:
      return 1
    else:
      return 0
  else:
    if one == zero:
      return 0
    if one > zero:
      return 0
    else:
      return 1

proc partTwo(input: seq[string], mode: string): int =
  var left: seq[string]
  var correct: seq[int]
  for x in 0..11:
    let pop = bitCount(input, x, mode)
    if correct.len != 11:
      correct.add(pop)
    var valid = filterBits(input, x, pop)
    for y in valid:
      for l in y:
        let v = toString(@[y[l]])
        if parseInt(v) == correct[l]:
          left.add(y)
        else:
          echo left.len

  return partOne(left, mode)

when isMainModule:
  let input = load_file("input.txt")
  let gamma = partOne(input, "gamma")
  let epsilon = partOne(input, "ep")
  let life = partTwo(input, "gamma")
  let co = partTwo(input, "ep")
  echo gamma * epsilon
  echo "========================\nLife Info: "
  echo life * co
