import json
import flask
import pickle
from datetime import datetime
from flask import request
from lp import optimizationLp
from productPrices import *

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=['GET'])
def home():
    return "<h1>SIPFAA</h1><p>This site is a prototype API for differentiation plan.</p>"


@app.route('/name', methods=['GET'])
def name():
    return "<h1>SIPFAA - Differentiation plan</h1>"


@app.route('/marketA', methods=['GET'])
def get_price_market_A():
    month = request.headers.get('month')
    print("Month", month)
    # load model
    with open('market_A_model.pkl', 'rb') as file:
        data = pickle.load(file)

    fc_series = data['forecast_series']
    priceA = fc_series.get(key=month)
    print("PriceA", priceA)
    return str(priceA)


@app.route('/marketB', methods=['GET'])
def get_price_market_B():
    month = request.headers.get('month')
    print("Month", month)
    # load model
    with open('market_B_model.pkl', 'rb') as file:
        data = pickle.load(file)

    fc_series = data['forecast_series']
    priceB = fc_series.get(key=month)
    print("PriceB", priceB)
    return str(priceB)


@app.route('/marketC', methods=['GET'])
def get_price_market_C():
    month = request.headers.get('month')
    print("Month", month)
    # load model
    with open('market_C_model.pkl', 'rb') as file:
        data = pickle.load(file)

    fc_series = data['forecast_series']
    priceC = fc_series.get(key=month)
    print("priceC", priceC)
    return str(priceC)


@app.route('/optimization', methods=['GET'])
def optimization():
    cost = request.headers.get('cost')
    month = request.headers.get('month')
    quantityB = request.headers.get('quantityB')
    quantityS = request.headers.get('quantityS')

    cost = cost.replace(',', "")
    cost = cost.replace('Rs', "")

    result = optimizationLp(cost, month, quantityB, quantityS)
    return json.dumps(result)


@app.route('/getProductPrices', methods=['GET'])
def getProductPrices():
    request.headers.get('quantityD')

    result = {
        "juicePrice": get_juice_price(),
        "jamPrice": get_jam_price(),
        "chunkPrice": get_chunk_price(),
        "chutneyPrice": get_chutney_price(),
        "sausePrice": get_suause_price(),
        "stickPrice": get_sticks_price(),
        "chunkSyrupPrice": get_chunks_syrup_price(),
    }

    return json.dumps(result)

@app.route('/getProductPrices1', methods=['GET'])
def getProductPrices1():
    request.headers.get('quantityD')

    result = {
        "juicePrice": get_juice_price(),
        "jamPrice": get_jam_price(),
        "chunkPrice": get_chunk_price(),
        # "chutneyPrice": get_chutney_price(),
        # "sausePrice": get_suause_price(),
        # "stickPrice": get_sticks_price(),
        # "chunkSyrupPrice": get_chunks_syrup_price(),
    }

    return json.dumps(result)

@app.route('/getProductPrices2', methods=['GET'])
def getProductPrices2():
    request.headers.get('quantityD')

    result = {
        # "juicePrice": get_juice_price(),
        # "jamPrice": get_jam_price(),
        # "chunkPrice": get_chunk_price(),
        "chutneyPrice": get_chutney_price(),
        "sausePrice": get_suause_price(),
        "stickPrice": get_sticks_price(),
        "chunkSyrupPrice": get_chunks_syrup_price(),
    }

    return json.dumps(result)

app.run(debug=False, host='192.168.8.118', port=5000)
