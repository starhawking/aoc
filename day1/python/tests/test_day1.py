import unittest

from sonar_sweep.day1 import make_pairs, sweep

class TestSweep(unittest.TestCase):
    def test_sweep(self):
        provided = [
            199,
            200,
            208,
            210,
            200,
            207,
            240,
            269,
            260,
            263
        ]
        self.assertEqual(sweep(iter(provided)), 7)

    def test_make_pairs(self):
        provided = [1, 2, 3]
        expected = [(1,2), (2,3)]
        result = list(make_pairs(iter(provided)))
        self.assertEqual(expected, result)
