import unittest
import requests


class MyTestCase(unittest.TestCase):
    def test_something(self):
        self.assertEqual(1, 1)  # add assertion here

    def test_farmers_with_high_price(self):
        response = requests.get(url="http://192.168.8.118:5001/farmers", headers={'price': 'High', 'quantity': 'High', 'rate':'high', 'tasteQuality':'High','lat':'6.9660326','long':'80.1288372'})
        data = response.json()
        #153,172
        print(data)
        print(len(data))
        #print(data['data'][0]['price'])
        for i in range(len(data)):
            #print(data['data'][i])
            self.assertTrue(153 <= data[i]['price'] < 172)

        self.assertEqual(200, response.status_code )
        self.assertEqual(3,len(data))

    def test_farmers_with_very_high_price(self):
        response = requests.get(url="http://192.168.8.118:5001/farmers", headers={'price': 'Very High', 'quantity': 'High', 'rate':'high', 'tasteQuality':'High','lat':'6.9660326','long':'80.1288372'})
        data = response.json()
        #153,172
        #print(data['data'][0]['price'])
        for i in range(len(data)):
            #print(data['data'][i])
            self.assertTrue(172 <= data[i]['price'] < 199)

        self.assertEqual(200, response.status_code )
        self.assertEqual(5,len(data) )

    def test_wholesalers_with_high_price(self):
        response = requests.get(url="http://192.168.8.118:5001/wholesalers", headers={'price': 'High', 'quantity': 'High', 'rate':'high', 'tasteQuality':'High','lat':'6.9660326','long':'80.1288372'})
        data = response.json()
        for i in range(len(data)):
            self.assertTrue(153 <= data[i]['price'] < 172)

        self.assertEqual(200, response.status_code )
        self.assertEqual(5,len(data) )

    def test_wholesalers_with_very_high_price(self):
        response = requests.get(url="http://192.168.8.118:5001/wholesalers", headers={'price': 'Very High', 'quantity': 'High', 'rate':'high', 'tasteQuality':'High', 'lat':'6.9660326','long':'80.1288372'})
        data = response.json()
        #print(data[0]['price'])
        for i in range(len(data)):
            self.assertTrue(173 <= data[i]['price'] < 200)

        self.assertEqual(200, response.status_code )
        self.assertEqual(2,len(data))

if __name__ == '__main__':
    unittest.main()
