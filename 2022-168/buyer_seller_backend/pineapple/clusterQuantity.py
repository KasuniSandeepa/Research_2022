# -*- coding: utf-8 -*-
"""
Created on Thu May  5 16:23:46 2022

@author: Acer
"""

import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import pickle

data = pd.read_csv('pineapple/ratingprice.csv')
#data.sample(98)

with open('pineapple/clusterQuantityModel.pkl', 'rb') as file:
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
maxClusterQ1 = cluster1['Quantity'].max()
maxClusterQ2 = cluster2['Quantity'].max()
maxClusterQ3 = cluster3['Quantity'].max()
maxClusterQ4 = cluster4['Quantity'].max()


#get the minimum values of each cluster

minClusterQ1 = cluster1['Quantity'].min() 
minClusterQ2 = cluster2['Quantity'].min() 
minClusterQ3 = cluster3['Quantity'].min() 
minClusterQ4 = cluster4['Quantity'].min()  
cluster2.head(5)

plt.scatter(cluster1['Quantity'], cluster1['Ratings'])
plt.scatter(cluster2['Quantity'], cluster2['Ratings'])
plt.scatter(cluster3['Quantity'], cluster3['Ratings'])
plt.scatter(cluster4['Quantity'], cluster4['Ratings'])


plt.scatter(model.cluster_centers_[:,0],model.cluster_centers_[:,1],color='black')


model.cluster_centers_

def getClusterWithLowestQuantityRange():
    if minClusterQ1 == 15000 and maxClusterQ1 == 180000:
        return cluster1

    elif minClusterQ2 == 15000 and maxClusterQ2 == 180000:
        return cluster2
    
    elif minClusterQ3 == 15000 and maxClusterQ3 == 180000:
        return cluster3
    
    else :
        return cluster4
    
lowQuantity =  getClusterWithLowestQuantityRange()


def getClusterWithAverageQuantityRange():
    if maxClusterQ1 == 540000 and minClusterQ1 == 240000:
        return cluster1
    
    elif maxClusterQ2 == 540000 and minClusterQ2 == 240000:
        return cluster2
    
    elif maxClusterQ3 == 540000 and minClusterQ3 == 240000:
        return cluster3
    
    else :
        return cluster4
    
avgQuantity = getClusterWithAverageQuantityRange()
    
def getClusterWithMediumQuantityRange():
    if maxClusterQ1 == 1200000 and minClusterQ1 == 1200000:
        return cluster1
    
    elif maxClusterQ2 == 1200000 and minClusterQ2 == 1200000:
        return cluster2
    
    elif maxClusterQ3 == 1200000 and minClusterQ3 == 1200000:
        return cluster3
    
    else :
        return cluster4
    
mediumQuantity = getClusterWithMediumQuantityRange()
    
def getClusterWithHighQuantityRange():
    if maxClusterQ1 == 3000000 and minClusterQ1 == 3000000:
        return cluster1
    
    elif maxClusterQ2 == 3000000 and minClusterQ2 == 3000000:
        return cluster2
    
    elif maxClusterQ3 == 3000000 and minClusterQ3 == 3000000:
        return cluster3
    
    else :
        return cluster4
    
highQuantity = getClusterWithHighQuantityRange()
    
    
#cluster2 = data[data['cluster']==1]
#plt.scatter(cluster2['income'], cluster2['score'])

#cluster3 = data[data['cluster']==2]
#plt.scatter(cluster3['income'], cluster3['score'])

