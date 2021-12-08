#!/usr/bin/env python3
from collections.abc import Iterable
from collections import deque
import fileinput
from functools import reduce
import itertools
import sys
from typing import Generator, Tuple, TypeVar, Union

Number = Union[int, float]
def sweep(readings: Iterable[Number]) -> int:
    pairs = make_pairs(readings)
    comparisons = map(lambda x: int(x[0] < x[1]), pairs)
    return reduce(lambda l, r: l + r, comparisons, 0)

def windowed_sweep(readings: Iterable[Number], window: int) -> int:
    windowed = make_window(readings, window)
    aggregate_readings = map(sum, windowed)
    pairs = make_pairs(aggregate_readings)
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
def make_window(
    raw: Iterable[R],
    window: int = 2
) -> Iterable[Tuple[R]]:
    running = deque(maxlen=window)

    # Prime the deque with the initial window size
    for _, x in zip(range(window), raw):
        running.append(x)

    # Bail if we don't have enough
    if len(running) < window:
        return

    while True:
        yield tuple(running)

        try:
            running.append(next(raw))
        except StopIteration:
            break


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
    raw_1, raw_2 = itertools.tee(parse(fileinput.input()))
    part_1 = sweep(raw_1)
    part_2 = windowed_sweep(raw_2, window=3)

    print(f"Part 1: {part_1}")
    print(f"Part 2: {part_2}")


if __name__ == '__main__':
    main()
    