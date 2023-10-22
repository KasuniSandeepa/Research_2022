import unittest
import requests


class MyTestCase(unittest.TestCase):
    # def test_something(self):
    #     self.assertEqual(True, False)  # add assertion here ( Expected , Actual )

    def test_marketA_price(self):
        response = requests.get(url="http://192.168.8.118:5000/marketA",headers={'month': '2021-09'})
        data = response.json()
        self.assertEqual(125.95161290321428, data)

    def test_marketB_price(self):
        response = requests.get(url="http://192.168.8.118:5000/marketB",headers={'month': '2021-09'})
        data = response.json()
        self.assertEqual(76.56067587964286, data)

    def test_marketC_price(self):
        response = requests.get(url="http://192.168.8.118:5000/marketC",headers={'month': '2021-09'})
        data = response.json()
        self.assertEqual(48.4349080754213, data)

    def test_optimization(self):
        response = requests.get(url="http://192.168.8.118:5000/optimization", headers={'cost': '200000', 'month': '2021-09', 'quantityB':'1500', 'quantityS':'467'})
        data = response.json()
        self.assertEqual(200, response.status_code )
        self.assertEqual(1500, data["freshQuantity"] )
        self.assertEqual(466, data["processQuantityA"] )
        self.assertEqual(1, data["processQuantityB"] )
        self.assertEqual(224650.39, data["totalIncome"] )
        self.assertEqual(24650.39, data["totalProfit"] )
        self.assertEqual(188925, data["freshMarketIncome"] )
        self.assertEqual(35676.96, data["ProcessMarketIncomeA"] )
        self.assertEqual(48.43, data["ProcessMarketIncomeB"] )


if __name__ == '__main__':
    unittest.main()
