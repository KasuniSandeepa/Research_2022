import flask
from flask import request
import pandas as pd
import json

from location import getNearFarmers, getNearWholesalers
from pineapple.inputWholeSaleBuyer import buyerSelections
from pineapple.pineapple_wholesaler.farmerInput import farmerSelections

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/farmers', methods=['GET'])
def getFarmers():
    print("inside farmers")
    price = request.headers.get('price')
    quantity = request.headers.get('quantity')
    tastQuality = request.headers.get('tasteQuality')
    rate = request.headers.get('rate')
    lat = request.headers.get('lat')
    long = request.headers.get('long')
    lat = float(lat or 0)
    long = float(long or 0)
    print(price)
    print(quantity)
    print(tastQuality)
    print(rate)
    print(lat)
    print(long)

    if (price == "Very High"):
        price = "Vhigh"
    elif (price == "High"):
        price = "high"
    elif (price == "Average"):
        price = "avg"
    else:
        price = "low"

    if (quantity == "Very High"):
        quantity = "Vhigh"
    elif (quantity == "High"):
        quantity = "high"
    elif (quantity == "Average"):
        quantity = "avg"
    else:
        quantity = "low"

    if (tastQuality == "High"):
        tastQuality = "high"
    elif (tastQuality == "Average"):
        tastQuality = "medium"
    else:
        tastQuality = "low"

    output = buyerSelections(rate, tastQuality, quantity, price)
    print(output)
    if output is None:
        print("Data Frame is empty")
        result = None
        # parsed = json.loads(result)
        data = []
        resultFarmer = json.dumps(data, indent=2)
        return resultFarmer

    finalOutputBuyer = output[['farmerId', 'TasteQuality', 'price', 'Ratings', 'Quantity','City','Latitude','Longitude','Adrress']]
    size = len(finalOutputBuyer)
    if size > 1:
        finalOutputBuyer = getNearFarmers(output, lat, long, size)

    print(finalOutputBuyer)
    print(len(finalOutputBuyer))

    finalOutputBuyer = finalOutputBuyer.drop_duplicates(subset=['farmerId'])
    result = finalOutputBuyer.to_json(orient="records")
    parsed = json.loads(result)
    resultFarmer = json.dumps(parsed, indent=2)

    return resultFarmer

@app.route('/wholesalers', methods=['GET'])
def getWholesalers():
    print("inside wholesalers")
    price = request.headers.get('price')
    quantity = request.headers.get('quantity')
    tastQuality = request.headers.get('tasteQuality')
    rate = request.headers.get('rate')
    lat = request.headers.get('lat')
    long = request.headers.get('long')
    lat = float(lat or 0)
    long = float(long or 0)
    print(price)
    print(quantity)
    print(tastQuality)
    print(rate)

    if (price == "Very High"):
        price = "Vhigh"
    elif (price == "High"):
        price = "high"
    elif (price == "Average"):
        price = "avg"
    else:
        price = "low"

    if (quantity == "Very High"):
        quantity = "Vhigh"
    elif (quantity == "High"):
        quantity = "high"
    elif (quantity == "Average"):
        quantity = "avg"
    else:
        quantity = "low"

    if (tastQuality == "High"):
        tastQuality = "high"
    elif (tastQuality == "Average"):
        tastQuality = "medium"
    else:
        tastQuality = "low"

    output = farmerSelections(price, tastQuality, rate, quantity)
    print(output)
    if output is None:
        print("Data Frame is empty")
        result = None
        # parsed = json.loads(result)
        data = []
        resultWholesaler = json.dumps(data, indent=2)
        return resultWholesaler

    finalOutputFarmer = output[['WholesellerId','TasteQuality','price','Ratings','Quantity','City','Latitude','Longitude', 'Address']]
    size = len(finalOutputFarmer)
    if size>1:
        finalOutputFarmer = getNearWholesalers(output, lat, long, size)

    print("finalOutput")

    print(len(finalOutputFarmer))
    finalOutputFarmer = finalOutputFarmer.drop_duplicates(subset=['WholesellerId'])

    finalOutputFarmer = finalOutputFarmer.drop_duplicates(subset=['WholesellerId'])
    result = finalOutputFarmer.to_json(orient="records")
    parsed = json.loads(result)
    resultWholesaler = json.dumps(parsed, indent=2)

    return resultWholesaler

#base ip address
app.run(debug=False,host='192.168.191.165',port=5001)
