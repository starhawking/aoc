import unittest

from sonar_sweep.day1 import make_window, windowed_sweep

class TestSweep(unittest.TestCase):
    def test_windowed_sweep(self):
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
        self.assertEqual(
            windowed_sweep(iter(provided), window=3),
            5
        )

    def test_make_window_2(self):
        provided = [1, 2, 3]
        expected = [(1,2), (2,3)]
        result = list(make_window(iter(provided), window=2))
        self.assertEqual(expected, result)
    
    def test_make_window_3_too_short(self):
        provided = [1, 2]
        expected = []
        result = list(make_window(iter(provided), window=3))
        self.assertEqual(expected, result)

    def test_make_window_3(self):
        provided = [1, 2, 3, 4, 5]
        expected = [(1, 2, 3), (2, 3, 4), (3, 4, 5)]
        result = list(make_window(iter(provided), window=3))
        self.assertEqual(expected, result)