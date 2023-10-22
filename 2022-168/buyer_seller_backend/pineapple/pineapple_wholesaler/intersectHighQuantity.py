from pineapple.pineapple_wholesaler.intersectPrice import *
from pineapple.pineapple_wholesaler.clusterQuantity import *
from pineapple.pineapple_wholesaler.clusterPrice import *


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

clusteredHighQuantity = getClusterWithHighQuantityRange()

clusteredMediumQuantity = getClusterWithMediumQuantityRange()

clusteredAverageQuantity = getClusterWithAverageQuantityRange()

clusteredLowestQuantity = getClusterWithLowestQuantityRange()


#for higher quantity
def getHighRate_HighPrice_HighTaste_HighQuantity():
    intersectedValue = pd.merge(hR_hP_hT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_hP_hT_hQ = getHighRate_HighPrice_HighTaste_HighQuantity()

def getLowRate_HighPrice_HighTaste_HighQuantity():
    intersectedValue = pd.merge(lR_hP_hT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_hP_hT_hQ = getLowRate_HighPrice_HighTaste_HighQuantity()

def getHighRate_HighPrice_MediumTaste_HighQuantity():
    intersectedValue = pd.merge(hR_hP_mT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_hP_mT_hQ = getHighRate_HighPrice_MediumTaste_HighQuantity()

def getLowRate_HighPrice_MediumTaste_HighQuantity():
    intersectedValue = pd.merge(lR_hP_mT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_hP_mT_hQ = getLowRate_HighPrice_MediumTaste_HighQuantity()

def getHighRate_HighPrice_LowTaste_HighQuantity():
    intersectedValue = pd.merge(hR_hP_lT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_hP_lT_hQ = getHighRate_HighPrice_LowTaste_HighQuantity()

def getLowRate_HighPrice_LowTaste_HighQuantity():
    intersectedValue = pd.merge(lR_hP_lT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_hP_lT_hQ = getLowRate_HighPrice_LowTaste_HighQuantity()
#####

def getHighRate_MediumPrice_HighTaste_HighQuantity():
    intersectedValue = pd.merge(hR_mP_hT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_mP_hT_hQ = getHighRate_MediumPrice_HighTaste_HighQuantity()

def getLowRate_MediumPrice_HighTaste_HighQuantity():
    intersectedValue = pd.merge(lR_mP_hT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_mP_hT_hQ = getLowRate_MediumPrice_HighTaste_HighQuantity()

def getHighRate_MediumPrice_MediumTaste_HighQuantity():
    intersectedValue = pd.merge(hR_mP_mT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_mP_mT_hQ = getHighRate_MediumPrice_MediumTaste_HighQuantity()

def getLowRate_MediumPrice_MediumTaste_HighQuantity():
    intersectedValue = pd.merge(lR_mP_mT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_mP_mT_hQ = getLowRate_MediumPrice_MediumTaste_HighQuantity()

def getHighRate_MediumPrice_LowTaste_HighQuantity():
    intersectedValue = pd.merge(hR_mP_lT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_mP_lT_hQ = getHighRate_MediumPrice_LowTaste_HighQuantity()

def getLowRate_MediumPrice_LowTaste_HighQuantity():
    intersectedValue = pd.merge(lR_mP_lT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_mP_lT_hQ = getLowRate_MediumPrice_LowTaste_HighQuantity()

########
#for average price range
def getHighRate_AveragePrice_HighTaste_HighQuantity():
    intersectedValue = pd.merge(hR_aP_hT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_aP_hT_hQ = getHighRate_AveragePrice_HighTaste_HighQuantity()

def getLowRate_AveragePrice_HighTaste_HighQuantity():
    intersectedValue = pd.merge(lR_aP_hT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_aP_hT_hQ = getLowRate_AveragePrice_HighTaste_HighQuantity()

def getHighRate_AveragePrice_MediumTaste_HighQuantity():
    intersectedValue = pd.merge(hR_aP_mT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_aP_mT_hQ = getHighRate_AveragePrice_MediumTaste_HighQuantity()

def getLowRate_AveragePrice_MediumTaste_HighQuantity():
    intersectedValue = pd.merge(lR_aP_mT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_aP_mT_hQ = getLowRate_AveragePrice_MediumTaste_HighQuantity()

def getHighRate_AveragePrice_LowTaste_HighQuantity():
    intersectedValue = pd.merge(hR_aP_lT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_aP_lT_hQ = getHighRate_AveragePrice_LowTaste_HighQuantity()

def getLowRate_AveragePrice_LowTaste_HighQuantity():
    intersectedValue = pd.merge(lR_aP_lT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_aP_lT_hQ = getLowRate_AveragePrice_LowTaste_HighQuantity()


#for low price range
def getHighRate_LowPrice_HighTaste_HighQuantity():
    intersectedValue = pd.merge(hR_lP_hT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_lP_hT_hQ = getHighRate_LowPrice_HighTaste_HighQuantity()

def getLowRate_LowPrice_HighTaste_HighQuantity():
    intersectedValue = pd.merge(lR_lP_hT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_lP_hT_hQ = getLowRate_LowPrice_HighTaste_HighQuantity()

def getHighRate_LowPrice_MediumTaste_HighQuantity():
    intersectedValue = pd.merge(hR_lP_mT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_lP_mT_hQ = getHighRate_LowPrice_MediumTaste_HighQuantity()

def getLowRate_LowPrice_MediumTaste_HighQuantity():
    intersectedValue = pd.merge(lR_lP_mT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_lP_mT_hQ = getLowRate_LowPrice_MediumTaste_HighQuantity()

def getHighRate_LowPrice_LowTaste_HighQuantity():
    intersectedValue = pd.merge(hR_lP_lT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

hR_lP_lT_hQ = getHighRate_LowPrice_LowTaste_HighQuantity()

def getLowRate_LowPrice_LowTaste_HighQuantity():
    intersectedValue = pd.merge(lR_lP_lT, clusteredHighQuantity, how = 'inner', on = ['price','Ratings','TasteQuality','Quantity'])
    return intersectedValue

lR_lP_lT_hQ = getLowRate_LowPrice_LowTaste_HighQuantity()
