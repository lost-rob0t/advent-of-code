from strutils import parseInt
from math import sum
from part1 import load_input

proc sum3(input: seq[int]): int =
  var total = 0
  var last_sum = 0
  let end1 = input.len - 3
  for num in 0..end1:
    let sum = sum(input[num ..< num+3])
    if sum > last_sum and last_sum != 0:
      total += 1
    last_sum = sum
  return total

when isMainModule:
  let input = load_input("input.txt")
  let total = sum3(input)
  echo total
