import unittest

from ..dive.dive import CommandType, parse, reckon

SAMPLE = [
    ("forward 5", CommandType("z", 1, 5)),
    ("down 5", CommandType("y", 1, 5)),
    ("forward 8", CommandType("z", 1, 8)),
    ("up 3", CommandType("y", -1, 3)),
    ("down 8", CommandType("y", 1, 8)),
    ("forward 2", CommandType("z", 1, 2))
]

class TestParser(unittest.TestCase):
    def test_parse(self):
        for raw, expected in SAMPLE:
            actual = parse(raw)
            #print(f"{raw}\t{expected}\t{actual}")
            with self.subTest(raw=raw):
                self.assertEqual(expected, tuple(parse(raw)))

    def test_reckon(self):
        provided = (x for _, x in SAMPLE)
        self.assertEqual(
            reckon(provided),
            {"z": 15, "y": 10}
        )