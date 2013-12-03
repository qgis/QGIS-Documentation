__author__ = 'timlinux'

import unittest
from basic_functions import total


class MyTestCase(unittest.TestCase):
    def test_total(self):
        my_list = [1, 2, 4, 6, 8, 11.2]
        my_total = total(the_list=my_list, the_round_flag=True)
        self.assertEquals(my_total, 32.0)
        my_total = total(the_list=my_list, the_round_flag=False)
        self.assertEquals(my_total, 32.2)

if __name__ == '__main__':
    unittest.main()
