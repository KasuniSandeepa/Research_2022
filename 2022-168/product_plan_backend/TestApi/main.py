# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import pickle
from statsmodels.tsa.arima_model import ARIMAResults
import statsmodels
from statsmodels.tsa.arima_model import ARIMA
import statsmodels.tsa.arima_model as sm
from pulp import *

from lp import optimizationLp


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.
    print(pickle.format_version)
    print(statsmodels.__version__)




def get_price_market_A(month):
    with open('market_A_model.pkl', 'rb') as file:
        data = pickle.load(file)
    fc_series = data['forecast_series']
    print(fc_series)
    pred123 = fc_series.get(key=month)
    print(pred123)

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')
    #get_price_market_A("2022-05")
    result = optimizationLp(1200, "2022-01", 100, 200)
    print(result["freshQuantity"])


# See PyCharm help at https://www.jetbrains.com/help/pycharm/
