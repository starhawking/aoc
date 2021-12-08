#!/usr/bin/env python3
import functools
import fileinput
from typing import Iterable, Mapping, NamedTuple, Optional, Tuple

class CommandType(NamedTuple):
    axis: str
    direction: int
    magnitude: int

# Invert the Y axis since we care about depth.
COMMAND_MAPPINGS = {
    "forward": lambda x: CommandType("z", 1, int(x)),
    "up": lambda x: CommandType("y", -1, int(x)),
    "down": lambda x: CommandType("y", 1, int(x)),
}

def cmd_not_found(*args, **kwargs) -> None:
    return None

def parse(raw: str) -> Optional[CommandType]:
    cmd_name, _, cmd_value = raw.partition(' ')
    parse_func = COMMAND_MAPPINGS.get(cmd_name, cmd_not_found)
    return parse_func(cmd_value)

def aggregate(agg: Mapping[str, int], cmd: CommandType):
    axis = cmd.axis
    axis_before = agg.get(axis, 0)
    agg[axis] = axis_before + cmd.direction * cmd.magnitude
    return agg

def reckon(commands: Iterable[CommandType]) -> Mapping[str, int]:
    return functools.reduce(aggregate, commands, {})

def main():
    raw = fileinput.input()
    commands = map(parse, raw)
    position = reckon(commands)
    answer = functools.reduce(lambda l, r: l * r, position.values(), 1)
    print(f"Position {position}")
    print(f"Answer {answer}")

if __name__ == '__main__':
    main()