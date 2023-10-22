from pulp import *
from fractions import Fraction
from market_prices import get_price_market_B, get_price_market_C, get_price_market_A


def optimizationLp(cost, month, quantityB, quantityS):
    cost = float(cost or 0)
    quantityB = float(quantityB or 0)
    quantityS = float(quantityS or 0)
    cost = float(cost or 0)
    print(type(cost))
    print(type(month))
    print(type(quantityB))
    print(type(quantityS))

    priceA = round(float(get_price_market_A(month) or 0), 2)
    priceB = round(float(get_price_market_B(month) or 0), 2)
    priceC = round(float(get_price_market_C(month) or 0), 2)

    print(priceA)
    print(priceB)
    print(priceC)

    profit = LpProblem("Example of standard maximum problem", LpMaximize)

    # nonnegativity constraints
    z1 = LpVariable("z1", 1)
    z2 = LpVariable("z2", 1)

    # objective function
    profit += ((priceA * quantityB + priceB * z1 + priceC * z2) - cost)

    zero = 0

    # main constraints
    profit += z1 + z2 <= quantityS, "constraint 1",

    # double check the problem
    print(profit)

    # The problem is solved using PuLP's choice of Solver
    profit.solve()

    # status of the solution
    print(f"Status: {LpStatus[profit.status]}")

    # Individual decision_variables
    print("Individual decision_variables: ")
    for v in profit.variables():
        print(v.name, "=", v.varValue)

    # maximum value of the objective function
    print("Optimal Profit for the problem: ", value(profit.objective))

    print(" ")
    print("******************************************************************************")
    total_amount = quantityB + quantityS
    fresh_market_income = quantityB * priceA
    process_market_income_1 = profit.variables()[0].varValue * priceB
    process_market_income_2 = profit.variables()[1].varValue * priceC
    total_income = fresh_market_income + process_market_income_1 + process_market_income_2

    print("***** Optimal Product Differentiation Plan *****")
    print(" ")
    print("Total quantity of Pineapple : ", total_amount)
    print("Quantity of Pineapples for Fresh Pineapple Market        : ", quantityB)
    print("Quantity of Pineapples for Processed Pineapple Market A  : ", profit.variables()[0].varValue)
    print("Quantity of Pineapples for Processed Pineapple Market B  : ", profit.variables()[1].varValue)
    print(" ")
    print("Predicted Prices Per 1 kg")
    print("Fresh Market Price (According to the harvested season)      : Rs.", round(priceA, 2))
    print("Process Market A Price  (According to the harvested season) : Rs.", round(priceB, 2))
    print("Process Market B Price  (According to the harvested season) : Rs.", round(priceC, 2))
    print(" ")
    print("Fresh Market Income                                        : Rs.", round(fresh_market_income, 2))
    print("Process Market Income  A                                   : Rs.", round(process_market_income_1, 2))
    print("Process Market Income  b                                   : Rs.", round(process_market_income_2, 2))
    print(" ")
    print("Total Income   : Rs.", round(total_income, 2))
    print("Total Profit   : Rs.", round(value(profit.objective), 2))
    print("**********************************************************************************")
    print("")

    # Create Dictionary.
    result = {
        "freshQuantity": quantityB,
        "processQuantityA": profit.variables()[0].varValue,
        "processQuantityB": profit.variables()[1].varValue,
        "totalIncome": round(total_income, 2),
        "totalProfit": round(value(profit.objective), 2),
        "freshMarketIncome": round(fresh_market_income, 2),
        "ProcessMarketIncomeA": round(process_market_income_1, 2),
        "ProcessMarketIncomeB": round(process_market_income_2, 2),
    }

    # Dictionary to JSON Object using dumps() method
    # Return JSON Object
    return result
