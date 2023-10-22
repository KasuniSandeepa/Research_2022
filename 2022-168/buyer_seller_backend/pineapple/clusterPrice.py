import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import pickle

data = pd.read_csv('pineapple/ratingprice.csv')
#data.sample(98)

with open('pineapple/clusterPriceModel.pkl', 'rb') as file:
    result = pickle.load(file)

# see predicted clusters
pred = result['pred']
model = result['model']

# see predicted clusters
pred

data['cluster'] = pred

#data.head(98)

# centers of clusters
model.cluster_centers_

# visualize clusted data
cluster1 = data[data['cluster']==0]
cluster2 = data[data['cluster']==1]
cluster3 = data[data['cluster']==2]
cluster4 = data[data['cluster']==3] 

#get the maximum values of each cluster
maxCluster1 = cluster1['price'].max()
maxCluster2 = cluster2['price'].max()
maxCluster3 = cluster3['price'].max()
maxCluster4 = cluster4['price'].max()

#get the minimum values of each cluster
minCluster1 = cluster1['price'].min() 
minCluster2 = cluster2['price'].min() 
minCluster3 = cluster3['price'].min() 
minCluster4 = cluster4['price'].min() 


cluster2.head(5)

plt.scatter(cluster1['price'], cluster1['Ratings'])
plt.scatter(cluster2['price'], cluster2['Ratings'])
plt.scatter(cluster3['price'], cluster3['Ratings'])
plt.scatter(cluster4['price'], cluster4['Ratings'])

plt.scatter(model.cluster_centers_[:,0],model.cluster_centers_[:,1],color='black')


model.cluster_centers_

def getClusterWithLowestPriceRange():
    if minCluster1 == 120 and maxCluster1 == 136:
        return cluster1

    elif minCluster2 == 120 and maxCluster2 == 136:
        return cluster2
    
    elif minCluster3 == 120 and maxCluster3 == 136:
        return cluster3
    
    else :
        return cluster4
    
low =  getClusterWithLowestPriceRange()


def getClusterWithAveragePriceRange():
    if maxCluster1 == 152 and minCluster1 == 137:
        return cluster1
    
    elif maxCluster2 == 152 and minCluster2 == 137:
        return cluster2
    
    elif maxCluster3 == 152 and minCluster3 == 137:
        return cluster3
    
    else :
        return cluster4
    
avg = getClusterWithAveragePriceRange()
    
def getClusterWithMediumPriceRange():
    if maxCluster1 == 171 and minCluster1 == 153:
        return cluster1
    
    elif maxCluster2 == 171 and minCluster2 == 153:
        return cluster2
    
    elif maxCluster3 == 171 and minCluster3 == 153:
        return cluster3
    
    else :
        return cluster4
    
medium = getClusterWithMediumPriceRange()
    
def getClusterWithHighPriceRange():
    if maxCluster1 == 198 and minCluster1 == 172:
        return cluster1
    
    elif maxCluster2 == 198 and minCluster2 == 172:
        return cluster2
    
    elif maxCluster3 == 198 and minCluster3 == 172:
        return cluster3
    
    else :
        return cluster4
    
high = getClusterWithHighPriceRange()
    
#cluster2 = data[data['cluster']==1]
#plt.scatter(cluster2['income'], cluster2['score'])

#cluster3 = data[data['cluster']==2]
#plt.scatter(cluster3['income'], cluster3['score'])