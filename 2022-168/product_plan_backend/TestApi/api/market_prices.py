import pickle

def get_price_market_A(month):
    print("Month",month)
    # load model
    with open('market_A_model.pkl', 'rb') as file:
        data = pickle.load(file)

    fc_series = data['forecast_series']
    priceA = fc_series.get(key=month)
    print("PriceB", priceA)
    return str(priceA)

def get_price_market_B(month):
    print("Month",month)
    # load model
    with open('market_B_model.pkl', 'rb') as file:
        data = pickle.load(file)

    fc_series = data['forecast_series']
    priceB = fc_series.get(key=month)
    print("PriceB",priceB)
    return str(priceB)


def get_price_market_C(month):
    print("Month",month)
    # load model
    with open('market_C_model.pkl', 'rb') as file:
        data = pickle.load(file)

    fc_series = data['forecast_series']
    priceC = fc_series.get(key=month)
    print("priceC",priceC)
    return str(priceC)

