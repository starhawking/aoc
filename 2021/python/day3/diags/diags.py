import fileinput
import functools
import itertools
from typing import Iterable, Mapping, Optional, Tuple

CountState = Mapping[str, int]

def count(acc: Optional[CountState], value: str) -> CountState:
    if not acc:
        acc = {}
    curr = acc.get(value, 0)
    acc[value] = curr + 1
    return acc

# Crow was a typo, but I couldn't bring myself to fix it
def process_crow(
    acc: Optional[Tuple[CountState]],
    row: str
) -> Tuple[CountState]:

    # Initialize our accumulator with empty aggregates
    # if we didn't get one
    if not acc:
        acc = tuple(map(lambda _: {}, row))

    updated_row = map(lambda x: count(x[1], x[0]), zip(row, acc))
    return tuple(updated_row)

def final_bit(bit_state: CountState) -> str:
    """
    Most Common Bit
    """
    if bit_state['1'] > bit_state['0']:
        return {'gamma': '1', 'epsilon': '0'}
    return {'gamma': '0', 'epsilon': '1'}

def part1(raw: Iterable[str]) -> dict:
    aggregates = functools.reduce(process_crow, raw, None)
    by_name = [final_bit(x) for x in aggregates]
    gamma = "".join([x['gamma'] for x in by_name])
    as_strings = {
        'gamma': "".join([x['gamma'] for x in by_name]),
        'epsilon': "".join([x['epsilon'] for x in by_name])
    }
    return {k: int("0b" + v, base=2) for k, v in as_strings.items()}
def main():
    samples = fileinput.input()
    results = part1(samples)
    print(f"values {results}")
    print(f"result {results['gamma'] * results['epsilon']}")


if __name__ == "__main__":
    main()