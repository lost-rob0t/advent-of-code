import strutils
type
  Direction = enum
    down, up, forward
type
  Position = ref object
    x: int
    y: int
    aim: int
type
  Movement = object
    direction: Direction
    amount : int
proc getDirection(input: string): Movement =
  var data = input.split(" ")
  var direction: Direction
  if contains(data[0], "down"):
    direction = Direction.down
  if contains(data[0], "up"):
    direction = Direction.up
  if contains(data[0], "forward"):
    direction = Direction.forward
  let amount = parseInt(data[1])
  var movement: Movement
  movement.amount = amount
  movement.direction = direction
  return movement

proc getFinal(input: string): int =
  var pos = Position(x: 0, y: 0, aim: 0)
  let file = open(input, fmRead)
  defer: file.close()
  for line in file.lines:
    let movement = getDirection(line)
    if movement.direction == Direction.forward:
      pos.x += movement.amount
      pos.y += pos.aim * movement.amount
    if movement.direction == Direction.down:
      pos.aim += movement.amount
    if movement.direction == Direction.up:
      pos.aim -= movement.amount
    echo("Depth: ", pos.y, " Distance: ", pos.x, " Aim: ", pos.aim)
  return pos.y * pos.x

when isMainModule:
  echo(getFinal("input.txt"))
