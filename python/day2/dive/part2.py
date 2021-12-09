#!/usr/bin/env python3
import functools
import fileinput
from typing import Callable, Iterable, Mapping, NamedTuple, Optional, Tuple

class SubState(NamedTuple):
    aim: int
    x: int # Not Actually Used
    y: int # Depth
    z: int # Forward / Backward

class Command(NamedTuple):
    name: str
    value: int

def cmd_forward(value: int, state: SubState) -> SubState:
    return SubState(
        aim=state.aim,
        x=state.x,
        y=(state.y + state.aim * value),
        z=(state.z + value)
    )

def cmd_up(value: int, state: SubState) -> SubState:
    return SubState(state[0] - value, *state[1:])

def cmd_down(value: int, state: SubState) -> SubState:
    return SubState(state[0] + value, *state[1:])

# Feed the sub some curry
COMMAND_MAPPINGS = {
    "forward": lambda x: functools.partial(cmd_forward, int(x)),
    "up": lambda x: functools.partial(cmd_up, int(x)),
    "down": lambda x: functools.partial(cmd_down, int(x)),
}

def parse(raw: str) -> Optional[Callable]:
    cmd_name, _, cmd_value = raw.partition(' ')
    parse_func = COMMAND_MAPPINGS.get(cmd_name, lambda x: x)
    return parse_func(cmd_value)

def reckon(
    commands: Iterable[Callable],
    begin: Optional[SubState] = None) -> SubState:
    if not begin:
        begin = SubState(0,0,0,0)
    return functools.reduce(lambda x, y: y(x), commands, begin)

def main():
    raw = fileinput.input()
    commands = map(parse, raw)
    position = reckon(commands)
    answer = position.y * position.z
    print(f"Position {position}")
    print(f"Answer {answer}")

if __name__ == '__main__':
    main()