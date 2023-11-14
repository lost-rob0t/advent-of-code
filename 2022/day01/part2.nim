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

proc findMaxN(input: seq[int], n: int): int =
  var input2 = input
  var data: seq[int]
  for x in countup(0, n):
    var maxNow = input2.max
    data.add(maxNow)
    let maxI = input2.find(maxNow)
    input2.delete(maxI)
  var i: int
  for x in data:
    i += x
  result = i
proc main(input: string)  =
  let input = readInput(input)
  let a = input.solve()
  echo max(a)
  echo findMaxN(a, 2)
main("input.txt")
