import strutils
proc readInput(path: string): seq[seq[int]] =
  let f = open(path, fmRead)
  defer: f.close()
  var data: seq[seq[int]]
  var elf: seq[int]
  for line in f.lines:
    if line.len != 0:
      elf.add(line.parseInt)
    else:
      data.add(elf)
      elf = @[]
  result = data
proc solve(input: seq[seq[int]]): seq[int] =
  var x: seq[int]
  for elf in input:
    var i: int
    for cal in elf:
      i += cal
    x.add(i)
  result = x

proc main(input: string): seq[int] =
  let input = readInput(input)
  let a = input.solve()
  echo a.max
echo main("input.txt")
