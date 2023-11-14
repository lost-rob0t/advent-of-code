import strutils
import tables
type
  Guide = enum
    rock = 1
    paper = 2
    scissors = 3


proc readInput(path: string): seq[string] =
  let f = open(path, fmRead)
  defer: f.close()
  var data: seq[string]
  for line in f.lines:
    data.add(line)
  result = data


proc solvePart1(data: seq[string]): int =
  var i, x: int
  for line in data:
    echo line
    var elf: Guide
    var me: Guide

    let d = line.split(" ")
    case d[0]:
      of "A":
        elf = Guide.rock
      of "B":
        elf = Guide.paper
      of "C":
        elf = Guide.scissors
      else:
        discard

    case d[1]:
      of "X":
        me = Guide.rock
      of "Y":
        me = Guide.paper
      of "Z":
        me = Guide.scissors
      else:
        discard


      of y[0] ==
    if elf ==:
      i += ord(elf) + 6
      x += ord(me)
    elif me > elf:
      x += ord(me)
      x += 6
    else:
      i += ord(elf) + 3
      x += ord(me) + 3

    result = x

proc solvePartAI(data: seq[string]): int =
  var total_score = 0
  for line in data:
    var opponent_shape: Guide
    var your_shape: Guide
    let d = line.split(" ")
    case d[0]:
      of "A":
        opponent_shape = Guide.rock
      of "B":
        opponent_shape = Guide.paper
      of "C":
        opponent_shape = Guide.scissors
      else:
        discard

    case d[1]:
      of "X":
        your_shape = Guide.rock
      of "Y":
        your_shape = Guide.paper
      of "Z":
        your_shape = Guide.scissors
      else:
        discard

    if opponent_shape > your_shape:
      total_score += ord(opponent_shape) + 6
    elif your_shape > opponent_shape:
      total_score += ord(your_shape)
      total_score += 6
    else:
      total_score += ord(opponent_shape) + 3
      total_score += ord(your_shape) + 3
    result = total_score
let data = readInput("input.txt")
let data1 = readInput("input.txt")
echo data
echo "Me: ", solvePart1(data)
echo "Me1: ", solvePart1(data1)
echo "Ai: ", solvePartAI(data)
