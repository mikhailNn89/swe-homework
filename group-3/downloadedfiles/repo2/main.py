import unittest
import b1.rym as rym

class Test(unittest.TestCase):
	def test_354(self):
		self.assertEqual(rym.to_roman("354"), "CCCLIV")
	def test_10(self):
		self.assertEqual(rym.to_roman("10"), "X")



if __name__ == '__main__':
	unittest.main()
