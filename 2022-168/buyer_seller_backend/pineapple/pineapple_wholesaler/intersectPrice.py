from pineapple.pineapple_wholesaler.clusterPrice import *
from pineapple.pineapple_wholesaler.clusterTaste import *

highPriceRange = getClusterWithHighPriceRange()

mediumPriceRange = getClusterWithMediumPriceRange()

averagePriceRange = getClusterWithAveragePriceRange()

lowPriceRange = getClusterWithLowestPriceRange() 

lowTasteLowRate = getClusterWithLowTasteAndLowRate()

lowTasteHighRate = getClusterWithLowTasteAndHighRate()

mediumTasteLowRate = getClusterWithMediumTasteAndLowRate()

mediumTasteHighRate = getClusterWithMediumTasteAndHighRate()

highTasteLowRate = getClusterWithHighTasteAndLowRate()

highTasteHighRate = getClusterWithHighTasteAndHighRate()


#for high price range
def getHighRate_HighPrice_HighTaste():
    intersectedValue = pd.merge(highPriceRange, highTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

v1 = getHighRate_HighPrice_HighTaste()

def getLowRate_HighPrice_HighTaste():
    intersectedValue = pd.merge(highPriceRange, highTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

v2 = getLowRate_HighPrice_HighTaste()

def getHighRate_HighPrice_MediumTaste():
    intersectedValue = pd.merge(highPriceRange, mediumTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

v3 = getHighRate_HighPrice_MediumTaste()

def getLowRate_HighPrice_MediumTaste():
    intersectedValue = pd.merge(highPriceRange, mediumTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

v4 = getLowRate_HighPrice_MediumTaste()

def getHighRate_HighPrice_LowTaste():
    intersectedValue = pd.merge(highPriceRange, lowTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

v5 = getHighRate_HighPrice_LowTaste()

def getLowRate_HighPrice_LowTaste():
    intersectedValue = pd.merge(highPriceRange, lowTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

v6 = getLowRate_HighPrice_LowTaste()

#for medium price range
def getHighRate_MediumPrice_HighTaste():
    intersectedValue = pd.merge(mediumPriceRange, highTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

m1 = getHighRate_MediumPrice_HighTaste()

def getLowRate_MediumPrice_HighTaste():
    intersectedValue = pd.merge(mediumPriceRange, highTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

m2 = getLowRate_MediumPrice_HighTaste()

def getHighRate_MediumPrice_MediumTaste():
    intersectedValue = pd.merge(mediumPriceRange, mediumTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

m3 = getHighRate_MediumPrice_MediumTaste()

def getLowRate_MediumPrice_MediumTaste():
    intersectedValue = pd.merge(mediumPriceRange, mediumTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

m4 = getLowRate_MediumPrice_MediumTaste()

def getHighRate_MediumPrice_LowTaste():
    intersectedValue = pd.merge(mediumPriceRange, lowTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

m5 = getHighRate_MediumPrice_LowTaste()

def getLowRate_MediumPrice_LowTaste():
    intersectedValue = pd.merge(mediumPriceRange, lowTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

m6 = getLowRate_MediumPrice_LowTaste()

#for average price range
def getHighRate_AveragePrice_HighTaste():
    intersectedValue = pd.merge(averagePriceRange, highTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

a1 = getHighRate_AveragePrice_HighTaste()

def getLowRate_AveragePrice_HighTaste():
    intersectedValue = pd.merge(averagePriceRange, highTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

a2 = getLowRate_AveragePrice_HighTaste()

def getHighRate_AveragePrice_MediumTaste():
    intersectedValue = pd.merge(averagePriceRange, mediumTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

a3 = getHighRate_AveragePrice_MediumTaste()

def getLowRate_AveragePrice_MediumTaste():
    intersectedValue = pd.merge(mediumPriceRange, mediumTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

a4 = getLowRate_AveragePrice_MediumTaste()

def getHighRate_AveragePrice_LowTaste():
    intersectedValue = pd.merge(averagePriceRange, lowTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

a5 = getHighRate_AveragePrice_LowTaste()

def getLowRate_AveragePrice_LowTaste():
    intersectedValue = pd.merge(averagePriceRange, lowTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

a6 = getLowRate_MediumPrice_LowTaste()

#for low price range
def getHighRate_LowPrice_HighTaste():
    intersectedValue = pd.merge(lowPriceRange, highTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

l1 = getHighRate_LowPrice_HighTaste()

def getLowRate_LowPrice_HighTaste():
    intersectedValue = pd.merge(lowPriceRange, highTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

l2 = getLowRate_LowPrice_HighTaste()

def getHighRate_LowPrice_MediumTaste():
    intersectedValue = pd.merge(lowPriceRange, mediumTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

l3 = getHighRate_LowPrice_MediumTaste()

def getLowRate_LowPrice_MediumTaste():
    intersectedValue = pd.merge(lowPriceRange, mediumTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

l4 = getLowRate_LowPrice_MediumTaste()

def getHighRate_LowPrice_LowTaste():
    intersectedValue = pd.merge(lowPriceRange, lowTasteHighRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

l5 = getHighRate_LowPrice_LowTaste()

def getLowRate_LowPrice_LowTaste():
    intersectedValue = pd.merge(lowPriceRange, lowTasteLowRate, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

l6 = getLowRate_LowPrice_LowTaste()








