import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import pickle

data = pd.read_csv('pineapple/pineapple_wholesaler/wholesellerData.csv')

with open('pineapple/pineapple_wholesaler/clusterWholesalerQuantityModel.pkl', 'rb') as file:
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
plt.xlabel('Pineappple Quantity')
plt.ylabel('Ratings')
plt.title('Clusters of Quantity')

plt.scatter(model.cluster_centers_[:,0],model.cluster_centers_[:,1],color='black')


model.cluster_centers_

def getClusterWithLowestQuantityRange():
    if minClusterQ1 == 500 and maxClusterQ1 == 40000:
        return cluster1

    elif minClusterQ2 == 500 and maxClusterQ2 == 40000:
        return cluster2
    
    elif minClusterQ3 == 500 and maxClusterQ3 == 40000:
        return cluster3
    
    else :
        return cluster4
    
lowQuantity =  getClusterWithLowestQuantityRange()


def getClusterWithAverageQuantityRange():
    if maxClusterQ1 == 110000 and minClusterQ1 == 45000:
        return cluster1
    
    elif maxClusterQ2 == 110000 and minClusterQ2 == 45000:
        return cluster2
    
    elif maxClusterQ3 == 110000 and minClusterQ3 == 45000:
        return cluster3
    
    else :
        return cluster4
    
avgQuantity = getClusterWithAverageQuantityRange()
    
def getClusterWithMediumQuantityRange():
    if maxClusterQ1 == 200000 and minClusterQ1 == 150000:
        return cluster1
    
    elif maxClusterQ2 == 200000 and minClusterQ2 == 150000:
        return cluster2
    
    elif maxClusterQ3 == 200000 and minClusterQ3 == 150000:
        return cluster3
    
    else :
        return cluster4
    
mediumQuantity = getClusterWithMediumQuantityRange()
    
def getClusterWithHighQuantityRange():
    if maxClusterQ1 == 500000 and minClusterQ1 == 250000:
        return cluster1
    
    elif maxClusterQ2 == 500000 and minClusterQ2 == 250000:
        return cluster2
    
    elif maxClusterQ3 == 500000 and minClusterQ3 == 250000:
        return cluster3
    
    else :
        return cluster4
    
highQuantity = getClusterWithHighQuantityRange()
    
    
#cluster2 = data[data['cluster']==1]
#plt.scatter(cluster2['income'], cluster2['score'])

#cluster3 = data[data['cluster']==2]
#plt.scatter(cluster3['income'], cluster3['score'])

