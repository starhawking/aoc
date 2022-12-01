import unittest
from ..dive.dive import CommandType
from ..dive.part2 import parse, reckon, SubState

SAMPLE = [
    ("forward 5", CommandType("z", 1, 5)),
    ("down 5", CommandType("y", 1, 5)),
    ("forward 8", CommandType("z", 1, 8)),
    ("up 3", CommandType("y", -1, 3)),
    ("down 8", CommandType("y", 1, 8)),
    ("forward 2", CommandType("z", 1, 2))
]

class TestParser(unittest.TestCase):


    def test_reckon(self):
        raw = (x[0] for x in SAMPLE)
        commands = map(parse, raw)
        position = reckon(commands)
        self.assertEqual(position.z, 15)
        self.assertEqual(position.y, 60)