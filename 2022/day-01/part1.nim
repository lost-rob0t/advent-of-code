from strutils import parseInt
proc load_input*(file: string): seq[int] =
  let file = open(file, fmRead)
  defer: file.close()
  var input: seq[int]
  for line in file.lines:
    input.add(parseInt(line))
  result = input
proc count_change(input: seq[int]): int =
  var last_result: int
  var total: int
  for x in input:
    if x >= last_result:
      total += 1
    last_result = x
  return total - 1
when isMainModule:
  let input = load_input("input.txt")
  echo count_change(input)
