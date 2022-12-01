import unittest
from ..diags.diags import part1

SAMPLE = [
    "00100",
    "11110",
    "10110",
    "10111",
    "10101",
    "01111",
    "00111",
    "11100",
    "10000",
    "11001",
    "00010",
    "01010"
]
class TestDiags(unittest.TestCase):
    def test_gamma(self):
        expected = {
            "gamma": 22,
            "epsilon": 9
        }
        actual = part1(iter(SAMPLE))
        self.assertEqual(expected['gamma'], actual['gamma'])
        self.assertEqual(expected['epsilon'], actual['epsilon'])
