from pineapple.intersectHighQuantity import *
from pineapple.intersectLowQuantity import *
from pineapple.intersectMediumQuantity import *
from pineapple.intersectionAvgQuantity import *

import pandas as pd


hR_hP_hT = getHighRate_HighPrice_HighTaste()
lR_hP_hT = getLowRate_HighPrice_HighTaste()
hR_hP_mT = getHighRate_HighPrice_MediumTaste()
lR_hP_mT = getLowRate_HighPrice_MediumTaste()
hR_hP_lT = getHighRate_HighPrice_LowTaste()
lR_hP_lT = getLowRate_HighPrice_LowTaste()

lR_mP_lT = getLowRate_MediumPrice_LowTaste()
lR_mP_mT = getLowRate_MediumPrice_MediumTaste()
lR_mP_hT = getLowRate_MediumPrice_HighTaste()
hR_mP_lT = getHighRate_MediumPrice_LowTaste()
hR_mP_mT = getHighRate_MediumPrice_MediumTaste()
hR_mP_hT = getHighRate_MediumPrice_HighTaste()

lR_lP_lT = getLowRate_LowPrice_LowTaste()
lR_lP_mT = getLowRate_LowPrice_MediumTaste()
lR_lP_hT = getLowRate_LowPrice_HighTaste()
hR_lP_lT = getHighRate_LowPrice_LowTaste()
hR_lP_mT = getHighRate_LowPrice_MediumTaste()
hR_lP_hT = getHighRate_LowPrice_HighTaste()

lR_aP_lT = getLowRate_AveragePrice_LowTaste()
lR_aP_mT = getLowRate_AveragePrice_MediumTaste()
lR_aP_hT = getLowRate_AveragePrice_HighTaste()
hR_aP_mT = getHighRate_AveragePrice_MediumTaste()
hR_aP_lT = getHighRate_AveragePrice_LowTaste()
hR_aP_hT = getHighRate_AveragePrice_HighTaste()

lR_lP_lT_hQ = getLowRate_LowPrice_LowTaste_HighQuantity()
hR_lP_lT_hQ = getHighRate_LowPrice_LowTaste_HighQuantity()
lR_lP_mT_hQ = getLowRate_LowPrice_MediumTaste_HighQuantity()
hR_lP_mT_hQ = getHighRate_LowPrice_MediumTaste_HighQuantity()
lR_lP_hT_hQ = getLowRate_LowPrice_HighTaste_HighQuantity()
hR_lP_hT_hQ = getHighRate_LowPrice_HighTaste_HighQuantity()
lR_aP_lT_hQ = getLowRate_AveragePrice_LowTaste_HighQuantity()
hR_aP_lT_hQ = getHighRate_AveragePrice_LowTaste_HighQuantity()
lR_aP_mT_hQ = getLowRate_AveragePrice_MediumTaste_HighQuantity()
hR_aP_mT_hQ = getHighRate_AveragePrice_MediumTaste_HighQuantity()
lR_aP_hT_hQ = getLowRate_AveragePrice_HighTaste_HighQuantity()
hR_aP_hT_hQ = getHighRate_AveragePrice_HighTaste_HighQuantity()
lR_mP_lT_hQ = getLowRate_MediumPrice_LowTaste_HighQuantity()
hR_mP_lT_hQ = getHighRate_MediumPrice_LowTaste_HighQuantity()
lR_mP_mT_hQ = getLowRate_MediumPrice_MediumTaste_HighQuantity()
hR_mP_mT_hQ = getHighRate_MediumPrice_MediumTaste_HighQuantity()
lR_mP_hT_hQ = getLowRate_MediumPrice_HighTaste_HighQuantity()
hR_mP_hT_hQ = getHighRate_MediumPrice_HighTaste_HighQuantity()
lR_hP_lT_hQ = getLowRate_HighPrice_LowTaste_HighQuantity()
hR_hP_lT_hQ = getHighRate_HighPrice_LowTaste_HighQuantity()
lR_hP_mT_hQ = getLowRate_HighPrice_MediumTaste_HighQuantity()
hR_hP_mT_hQ = getHighRate_HighPrice_MediumTaste_HighQuantity()
lR_hP_hT_hQ = getLowRate_HighPrice_HighTaste_HighQuantity()
hR_hP_hT_hQ = getHighRate_HighPrice_HighTaste_HighQuantity()

lR_lP_lT_mQ = getLowRate_LowPrice_LowTaste_MediumQuantity()
hR_lP_lT_mQ = getHighRate_LowPrice_LowTaste_MediumQuantity()
lR_lP_mT_mQ = getLowRate_LowPrice_MediumTaste_MediumQuantity()
hR_lP_mT_mQ = getHighRate_LowPrice_MediumTaste_MediumQuantity()
lR_lP_hT_mQ = getLowRate_LowPrice_HighTaste_MediumQuantity()
hR_lP_hT_mQ = getHighRate_LowPrice_HighTaste_MediumQuantity()
lR_aP_lT_mQ = getLowRate_AveragePrice_LowTaste_MediumQuantity()
hR_aP_lT_mQ = getHighRate_AveragePrice_LowTaste_MediumQuantity()
lR_aP_mT_mQ = getLowRate_AveragePrice_MediumTaste_MediumQuantity()
hR_aP_mT_mQ = getHighRate_AveragePrice_MediumTaste_MediumQuantity()
lR_aP_hT_mQ = getLowRate_AveragePrice_HighTaste_MediumQuantity()
hR_aP_hT_mQ = getHighRate_AveragePrice_HighTaste_MediumQuantity()
lR_mP_lT_mQ = getLowRate_MediumPrice_LowTaste_MediumQuantity()
hR_mP_lT_mQ = getHighRate_MediumPrice_LowTaste_MediumQuantity()
lR_mP_mT_mQ = getLowRate_MediumPrice_MediumTaste_MediumQuantity()
hR_mP_mT_mQ = getHighRate_MediumPrice_MediumTaste_MediumQuantity()
lR_mP_hT_mQ = getLowRate_MediumPrice_HighTaste_MediumQuantity()
hR_mP_hT_mQ = getHighRate_MediumPrice_HighTaste_MediumQuantity()
lR_hP_lT_mQ = getLowRate_HighPrice_LowTaste_MediumQuantity()
hR_hP_lT_mQ = getHighRate_HighPrice_LowTaste_MediumQuantity()
lR_hP_mT_mQ = getLowRate_HighPrice_MediumTaste_MediumQuantity()
hR_hP_mT_mQ = getHighRate_HighPrice_MediumTaste_MediumQuantity()
lR_hP_hT_mQ = getLowRate_HighPrice_HighTaste_MediumQuantity()
hR_hP_hT_mQ = getHighRate_HighPrice_HighTaste_MediumQuantity()

lR_lP_lT_aQ = getLowRate_LowPrice_LowTaste_AvgQuantity()
hR_lP_lT_aQ = getHighRate_LowPrice_LowTaste_AvgQuantity()
lR_lP_mT_aQ = getLowRate_LowPrice_MediumTaste_AvgQuantity()
hR_lP_mT_aQ = getHighRate_LowPrice_MediumTaste_AvgQuantity()
lR_lP_hT_aQ = getLowRate_LowPrice_HighTaste_AvgQuantity()
hR_lP_hT_aQ = getHighRate_LowPrice_HighTaste_AvgQuantity()
lR_aP_lT_aQ = getLowRate_AveragePrice_LowTaste_AvgQuantity()
hR_aP_lT_aQ = getHighRate_AveragePrice_LowTaste_AvgQuantity()
lR_aP_mT_aQ = getLowRate_AveragePrice_MediumTaste_AvgQuantity()
hR_aP_mT_aQ = getHighRate_AveragePrice_MediumTaste_AvgQuantity()
lR_aP_hT_aQ = getLowRate_AveragePrice_HighTaste_AvgQuantity()
hR_aP_hT_aQ = getHighRate_AveragePrice_HighTaste_AvgQuantity()
lR_mP_lT_aQ = getLowRate_MediumPrice_LowTaste_AvgQuantity()
hR_mP_lT_aQ = getHighRate_MediumPrice_LowTaste_AvgQuantity()
lR_mP_mT_aQ = getLowRate_MediumPrice_MediumTaste_AvgQuantity()
hR_mP_mT_aQ = getHighRate_MediumPrice_MediumTaste_AvgQuantity()
lR_mP_hT_aQ = getLowRate_MediumPrice_HighTaste_AvgQuantity()
hR_mP_hT_aQ = getHighRate_MediumPrice_HighTaste_AvgQuantity()
lR_hP_lT_aQ = getLowRate_HighPrice_LowTaste_AvgQuantity()
hR_hP_lT_aQ = getHighRate_HighPrice_LowTaste_AvgQuantity()
lR_hP_mT_aQ = getLowRate_HighPrice_MediumTaste_AvgQuantity()
hR_hP_mT_aQ = getHighRate_HighPrice_MediumTaste_AvgQuantity()
lR_hP_hT_aQ = getLowRate_HighPrice_HighTaste_AvgQuantity()
hR_hP_hT_aQ = getHighRate_HighPrice_HighTaste_AvgQuantity()


lR_lP_lT_lQ = getLowRate_LowPrice_LowTaste_LowQuantity()
hR_lP_lT_lQ = getHighRate_LowPrice_LowTaste_LowQuantity()
lR_lP_mT_lQ = getLowRate_LowPrice_MediumTaste_LowQuantity()
hR_lP_mT_lQ = getHighRate_LowPrice_MediumTaste_LowQuantity()
lR_lP_hT_lQ = getLowRate_LowPrice_HighTaste_LowQuantity()
hR_lP_hT_lQ = getHighRate_LowPrice_HighTaste_LowQuantity()
lR_aP_lT_lQ = getLowRate_AveragePrice_LowTaste_LowQuantity()
hR_aP_lT_lQ = getHighRate_AveragePrice_LowTaste_LowQuantity()
lR_aP_mT_lQ = getLowRate_AveragePrice_MediumTaste_LowQuantity()
hR_aP_mT_lQ = getHighRate_AveragePrice_MediumTaste_LowQuantity()
lR_aP_hT_lQ = getLowRate_AveragePrice_HighTaste_LowQuantity()
hR_aP_hT_lQ = getHighRate_AveragePrice_HighTaste_LowQuantity()
lR_mP_lT_lQ = getLowRate_MediumPrice_LowTaste_LowQuantity()
hR_mP_lT_lQ = getHighRate_MediumPrice_LowTaste_LowQuantity()
lR_mP_mT_lQ = getLowRate_MediumPrice_MediumTaste_LowQuantity()
hR_mP_mT_lQ = getHighRate_MediumPrice_MediumTaste_LowQuantity()
lR_mP_hT_lQ = getLowRate_MediumPrice_HighTaste_LowQuantity()
hR_mP_hT_lQ = getHighRate_MediumPrice_HighTaste_LowQuantity()
lR_hP_lT_lQ = getLowRate_HighPrice_LowTaste_LowQuantity()
hR_hP_lT_lQ = getHighRate_HighPrice_LowTaste_LowQuantity()
lR_hP_mT_lQ = getLowRate_HighPrice_MediumTaste_LowQuantity()
hR_hP_mT_lQ = getHighRate_HighPrice_MediumTaste_LowQuantity()
lR_hP_hT_lQ = getLowRate_HighPrice_HighTaste_LowQuantity()
hR_hP_hT_lQ = getHighRate_HighPrice_HighTaste_LowQuantity()



# #(high[Rs.172-198],medium[Rs.153-171], avg[Rs.137-152], low[Rs.120-136] )
# price = input("Enter Pineapple Price Range (Vhigh, high, avg, low) : ")
#
# #Tast Quality(Vhigh, low, Medium)
# tastQuality = input("Enter Tast Quality(High,Low,Medium) : ")
#
#
# #select from high(rating = 3)and low(rating= 1,2)
# rate = input("Enter Pineapple Rate(high, low) : ")
#
# quantity = input("Enter Pineapple quantity Range (Vhigh, high, avg, low) : ")


def buyerSelections(rate, tastQuality, quantity, price):
    if quantity == 'Vhigh':
    
        if price == 'Vhigh' and tastQuality == 'high' and rate == 'high' :
            return hR_hP_hT_hQ
        elif price == 'Vhigh' and tastQuality == 'medium' and rate == 'high':
            return hR_hP_mT_hQ
        elif price == 'Vhigh' and tastQuality == 'low' and rate == 'high':
            return hR_hP_lT_hQ
        elif price == 'Vhigh' and tastQuality == 'high' and rate == 'low':
            return lR_hP_hT_hQ
        elif price == 'Vhigh' and tastQuality == 'medium' and rate == 'low':
            return lR_hP_mT_hQ
        elif price == 'Vhigh' and tastQuality == 'low' and rate == 'low':
            return lR_hP_lT_hQ
        
        elif price == 'low' and tastQuality == 'high' and rate == 'high':
            return hR_lP_hT_hQ
        elif price == 'low' and tastQuality == 'medium' and rate == 'high':
            return hR_lP_mT_hQ
        elif price == 'low' and tastQuality == 'low' and rate == 'high':
            return hR_lP_lT_hQ
        elif price == 'low' and tastQuality == 'high' and rate == 'low':
            return lR_lP_hT_hQ
        elif price == 'low' and tastQuality == 'medium' and rate == 'low':
            return lR_lP_mT_hQ
        elif price == 'low' and tastQuality == 'low' and rate == 'low':
            return lR_lP_lT_hQ
        
        elif price == 'avg' and tastQuality == 'high' and rate == 'high':
            return hR_aP_hT_hQ
        elif price == 'avg' and tastQuality == 'medium' and rate == 'high':
            return hR_aP_mT_hQ
        elif price == 'avg' and tastQuality == 'low' and rate == 'high':
            return hR_aP_lT_hQ
        elif price == 'avg' and tastQuality == 'high' and rate == 'low':
            return lR_aP_hT_hQ
        elif price == 'avg' and tastQuality == 'medium' and rate == 'low':
            return lR_aP_mT_hQ
        elif price == 'avg' and tastQuality == 'low' and rate == 'low':
            return lR_aP_lT_hQ
        
        elif price == 'high' and tastQuality == 'high' and rate == 'high':
            return hR_mP_hT_hQ
        elif price == 'high' and tastQuality == 'medium' and rate == 'high':
            return hR_mP_mT_hQ
        elif price == 'high' and tastQuality == 'low' and rate == 'high':
            return hR_mP_lT_hQ
        elif price == 'high' and tastQuality == 'high' and rate == 'low':
            return lR_mP_hT_hQ
        elif price == 'high' and tastQuality == 'medium' and rate == 'low':
            return lR_mP_mT_hQ
        elif price == 'high' and tastQuality == 'low' and rate == 'low':
            return lR_mP_lT_hQ
    
    elif quantity == 'high':
        
         if price == 'Vhigh' and tastQuality == 'high' and rate == 'high' :
             return hR_hP_hT_mQ
         elif price == 'Vhigh' and tastQuality == 'medium' and rate == 'high':
             return hR_hP_mT_mQ
         elif price == 'Vhigh' and tastQuality == 'low' and rate == 'high':
             return hR_hP_lT_mQ
         elif price == 'Vhigh' and tastQuality == 'high' and rate == 'low':
             return lR_hP_hT_mQ
         elif price == 'Vhigh' and tastQuality == 'medium' and rate == 'low':
             return lR_hP_mT_mQ
         elif price == 'Vhigh' and tastQuality == 'low' and rate == 'low':
             return lR_hP_lT_mQ
         
         elif price == 'low' and tastQuality == 'high' and rate == 'high':
             return hR_lP_hT_mQ
         elif price == 'low' and tastQuality == 'medium' and rate == 'high':
             return hR_lP_mT_mQ
         elif price == 'low' and tastQuality == 'low' and rate == 'high':
             return hR_lP_lT_mQ
         elif price == 'low' and tastQuality == 'high' and rate == 'low':
             return lR_lP_hT_mQ
         elif price == 'low' and tastQuality == 'medium' and rate == 'low':
             return lR_lP_mT_mQ
         elif price == 'low' and tastQuality == 'low' and rate == 'low':
             return lR_lP_lT_mQ
         
         elif price == 'avg' and tastQuality == 'high' and rate == 'high':
             return hR_aP_hT_mQ
         elif price == 'avg' and tastQuality == 'medium' and rate == 'high':
             return hR_aP_mT_mQ
         elif price == 'avg' and tastQuality == 'low' and rate == 'high':
             return hR_aP_lT_mQ
         elif price == 'avg' and tastQuality == 'high' and rate == 'low':
             return lR_aP_hT_mQ
         elif price == 'avg' and tastQuality == 'medium' and rate == 'low':
             return lR_aP_mT_mQ
         elif price == 'avg' and tastQuality == 'low' and rate == 'low':
             return lR_aP_lT_mQ
         
         elif price == 'high' and tastQuality == 'high' and rate == 'high':
             return hR_mP_hT_mQ
         elif price == 'high' and tastQuality == 'medium' and rate == 'high':
             return hR_mP_mT_mQ
         elif price == 'high' and tastQuality == 'low' and rate == 'high':
             return hR_mP_lT_mQ
         elif price == 'high' and tastQuality == 'high' and rate == 'low':
             return lR_mP_hT_mQ
         elif price == 'high' and tastQuality == 'medium' and rate == 'low':
             return lR_mP_mT_mQ
         elif price == 'high' and tastQuality == 'low' and rate == 'low':
             return lR_mP_lT_mQ
         
    elif quantity == 'avg':        
              
         if price == 'Vhigh' and tastQuality == 'high' and rate == 'high' :
             return hR_hP_hT_aQ
         elif price == 'Vhigh' and tastQuality == 'medium' and rate == 'high':
             return hR_hP_mT_aQ
         elif price == 'Vhigh' and tastQuality == 'low' and rate == 'high':
             return hR_hP_lT_aQ
         elif price == 'Vhigh' and tastQuality == 'high' and rate == 'low':
             return lR_hP_hT_aQ
         elif price == 'Vhigh' and tastQuality == 'medium' and rate == 'low':
             return lR_hP_mT_aQ
         elif price == 'Vhigh' and tastQuality == 'low' and rate == 'low':
             return lR_hP_lT_aQ
         
         elif price == 'low' and tastQuality == 'high' and rate == 'high':
             return hR_lP_hT_aQ
         elif price == 'low' and tastQuality == 'medium' and rate == 'high':
             return hR_lP_mT_aQ
         elif price == 'low' and tastQuality == 'low' and rate == 'high':
             return hR_lP_lT_aQ
         elif price == 'low' and tastQuality == 'high' and rate == 'low':
             return lR_lP_hT_aQ
         elif price == 'low' and tastQuality == 'medium' and rate == 'low':
             return lR_lP_mT_aQ
         elif price == 'low' and tastQuality == 'low' and rate == 'low':
             return lR_lP_lT_aQ
         
         elif price == 'avg' and tastQuality == 'high' and rate == 'high':
             return hR_aP_hT_aQ
         elif price == 'avg' and tastQuality == 'medium' and rate == 'high':
             return hR_aP_mT_aQ
         elif price == 'avg' and tastQuality == 'low' and rate == 'high':
             return hR_aP_lT_aQ
         elif price == 'avg' and tastQuality == 'high' and rate == 'low':
             return lR_aP_hT_aQ
         elif price == 'avg' and tastQuality == 'medium' and rate == 'low':
             return lR_aP_mT_aQ
         elif price == 'avg' and tastQuality == 'low' and rate == 'low':
             return lR_aP_lT_aQ
         
         elif price == 'high' and tastQuality == 'high' and rate == 'high':
             return hR_mP_hT_aQ
         elif price == 'high' and tastQuality == 'medium' and rate == 'high':
             return hR_mP_mT_aQ
         elif price == 'high' and tastQuality == 'low' and rate == 'high':
             return hR_mP_lT_aQ
         elif price == 'high' and tastQuality == 'high' and rate == 'low':
             return lR_mP_hT_aQ
         elif price == 'high' and tastQuality == 'medium' and rate == 'low':
             return lR_mP_mT_aQ
         elif price == 'high' and tastQuality == 'low' and rate == 'low':
             return lR_mP_lT_aQ
         
    elif quantity == 'low':  
                
         if price == 'Vhigh' and tastQuality == 'high' and rate == 'high' :
             return hR_hP_hT_lQ
         elif price == 'Vhigh' and tastQuality == 'medium' and rate == 'high':
             return hR_hP_mT_lQ
         elif price == 'Vhigh' and tastQuality == 'low' and rate == 'high':
             return hR_hP_lT_lQ
         elif price == 'Vhigh' and tastQuality == 'high' and rate == 'low':
             return lR_hP_hT_lQ
         elif price == 'Vhigh' and tastQuality == 'medium' and rate == 'low':
             return lR_hP_mT_lQ
         elif price == 'Vhigh' and tastQuality == 'low' and rate == 'low':
             return lR_hP_lT_lQ
         
         elif price == 'low' and tastQuality == 'high' and rate == 'high':
             return hR_lP_hT_lQ
         elif price == 'low' and tastQuality == 'medium' and rate == 'high':
             return hR_lP_mT_lQ
         elif price == 'low' and tastQuality == 'low' and rate == 'high':
             return hR_lP_lT_lQ
         elif price == 'low' and tastQuality == 'high' and rate == 'low':
             return lR_lP_hT_lQ
         elif price == 'low' and tastQuality == 'medium' and rate == 'low':
             return lR_lP_mT_lQ
         elif price == 'low' and tastQuality == 'low' and rate == 'low':
             return lR_lP_lT_lQ
         
         elif price == 'avg' and tastQuality == 'high' and rate == 'high':
             return hR_aP_hT_lQ
         elif price == 'avg' and tastQuality == 'medium' and rate == 'high':
             return hR_aP_mT_lQ
         elif price == 'avg' and tastQuality == 'low' and rate == 'high':
             return hR_aP_lT_lQ
         elif price == 'avg' and tastQuality == 'high' and rate == 'low':
             return lR_aP_hT_lQ
         elif price == 'avg' and tastQuality == 'medium' and rate == 'low':
             return lR_aP_mT_lQ
         elif price == 'avg' and tastQuality == 'low' and rate == 'low':
             return lR_aP_lT_lQ
         
         elif price == 'high' and tastQuality == 'high' and rate == 'high':
             return hR_mP_hT_lQ
         elif price == 'high' and tastQuality == 'medium' and rate == 'high':
             return hR_mP_mT_lQ
         elif price == 'high' and tastQuality == 'low' and rate == 'high':
             return hR_mP_lT_lQ
         elif price == 'high' and tastQuality == 'high' and rate == 'low':
             return lR_mP_hT_lQ
         elif price == 'high' and tastQuality == 'medium' and rate == 'low':
             return lR_mP_mT_lQ
         elif price == 'high' and tastQuality == 'low' and rate == 'low':
             return lR_mP_lT_lQ
 
# output = buyerSelections()
# finalOutputBuyer = output[['farmerId', 'TasteQuality', 'price', 'Ratings', 'Quantity']]
# print(finalOutputBuyer['farmerId'])
# print(finalOutputBuyer['TasteQuality'])
# print(finalOutputBuyer['price'])
# print(finalOutputBuyer['Ratings'])
# print(finalOutputBuyer['Quantity'])