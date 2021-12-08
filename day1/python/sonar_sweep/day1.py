#!/usr/bin/env python3
from collections.abc import Iterable
import fileinput
from functools import reduce
import sys
from typing import Generator, Tuple, TypeVar, Union

Number = Union[int, float]
def sweep(readings: Iterable[Number]) -> int:
    pairs = make_pairs(readings)
    comparisons = map(lambda x: int(x[0] < x[1]), pairs)
    return reduce(lambda l, r: l + r, comparisons, 0)

R = TypeVar('R')
def make_pairs(raw: Iterable[R]) -> Generator[Tuple[R, R], None, None]:
    last = next(raw)
    while True:
        try:
            current = next(raw)
        except StopIteration:
            break
        yield (last, current)
        last = current

def parse(lines: Iterable[str]) -> Iterable[Number]:
    for line in lines:
        try:
            yield int(line)
        except ValueError:
            pass
        else:
            continue

        try:
            yield float(line)
        except ValueError:
            pass
        else:
            continue
        print(line, file=sys.stderr)

def main():
    print(sweep(parse(fileinput.input())))

if __name__ == '__main__':
    main()
    