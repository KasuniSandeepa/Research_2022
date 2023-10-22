import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import pickle


data = pd.read_csv('pineapple/ratingprice.csv')
#data.sample(98)

with open('pineapple/clusterTasteModel.pkl', 'rb') as file:
    result = pickle.load(file)

# see predicted clusters
pred = result['pred']
model = result['model']

data['cluster'] = pred

#data.head(98)

# centers of clusters
model.cluster_centers_

# visualize clusted data

cluster1 = data[data['cluster']==0]
cluster2 = data[data['cluster']==1]
cluster3 = data[data['cluster']==2]
cluster4 = data[data['cluster']==3] 
cluster5 = data[data['cluster']==4]
cluster6 = data[data['cluster']==5]

cluster2.head(5)

plt.scatter(cluster1['TasteQuality'], cluster1['Ratings'])
plt.scatter(cluster2['TasteQuality'], cluster2['Ratings'])
plt.scatter(cluster3['TasteQuality'], cluster3['Ratings'])
plt.scatter(cluster4['TasteQuality'], cluster4['Ratings'])
plt.scatter(cluster5['TasteQuality'], cluster5['Ratings'])
plt.scatter(cluster6['TasteQuality'], cluster6['Ratings'])


plt.scatter(model.cluster_centers_[:,0],model.cluster_centers_[:,1],color='black')


model.cluster_centers_

#get the maximum taste values of each cluster
maxClusterTaste1 = cluster1['TasteQuality'].max()
maxClusterTaste2 = cluster2['TasteQuality'].max()
maxClusterTaste3 = cluster3['TasteQuality'].max()
maxClusterTaste4 = cluster4['TasteQuality'].max()
maxClusterTaste5 = cluster5['TasteQuality'].max()
maxClusterTaste6 = cluster6['TasteQuality'].max()


#get the minimum taste values of each cluster
minClusterTaste1 = cluster1['TasteQuality'].min() 
minClusterTaste2 = cluster2['TasteQuality'].min() 
minClusterTaste3 = cluster3['TasteQuality'].min() 
minClusterTaste4 = cluster4['TasteQuality'].min() 
minClusterTaste5 = cluster5['TasteQuality'].min() 
minClusterTaste6 = cluster6['TasteQuality'].min() 

#get the maximum rating values of each cluster
maxClusterRate1 = cluster1['Ratings'].max()
maxClusterRate2 = cluster2['Ratings'].max()
maxClusterRate3 = cluster3['Ratings'].max()
maxClusterRate4 = cluster4['Ratings'].max()
maxClusterRate5 = cluster5['Ratings'].max()
maxClusterRate6 = cluster6['Ratings'].max()

#get the minimum rating values of each cluster
minClusterRate1 = cluster1['Ratings'].min() 
minClusterRate2 = cluster2['Ratings'].min() 
minClusterRate3 = cluster3['Ratings'].min() 
minClusterRate4 = cluster4['Ratings'].min() 
minClusterRate5 = cluster5['Ratings'].min() 
minClusterRate6 = cluster6['Ratings'].min() 


def getClusterWithLowTasteAndLowRate():
    if maxClusterTaste1 == 1 and maxClusterRate1 == 2:
        return cluster1
    elif maxClusterTaste2 == 1 and maxClusterRate2 == 2:
        return cluster2
    elif maxClusterTaste3 == 1 and maxClusterRate3 == 2:
        return cluster3
    elif maxClusterTaste4 == 1 and maxClusterRate4 == 2:
        return cluster4
    elif maxClusterTaste5 == 1 and maxClusterRate5 == 2:
        return cluster5
    else:
        return cluster6
    
def getClusterWithLowTasteAndHighRate():
    if maxClusterTaste1 == 1 and maxClusterRate1 == 3:
        return cluster1
    elif maxClusterTaste2 == 1 and maxClusterRate2 == 3:
        return cluster2
    elif maxClusterTaste3 == 1 and maxClusterRate3 == 3:
        return cluster3
    elif maxClusterTaste4 == 1 and maxClusterRate4 == 3:
        return cluster4
    elif maxClusterTaste5 == 1 and maxClusterRate5 == 3:
        return cluster5
    else:
        return cluster6
    
def getClusterWithMediumTasteAndLowRate():
    if maxClusterTaste1 == 2 and maxClusterRate1 == 2:
        return cluster1
    elif maxClusterTaste2 == 2 and maxClusterRate2 == 2:
        return cluster2
    elif maxClusterTaste3 == 2 and maxClusterRate3 == 2:
        return cluster3
    elif maxClusterTaste4 == 2 and maxClusterRate4 == 2:
        return cluster4
    elif maxClusterTaste5 == 2 and maxClusterRate5 == 2:
        return cluster5
    else:
        return cluster6
    
def getClusterWithMediumTasteAndHighRate():
    if maxClusterTaste1 == 2 and maxClusterRate1 == 3:
        return cluster1
    elif maxClusterTaste2 == 2 and maxClusterRate2 == 3:
        return cluster2
    elif maxClusterTaste3 == 2 and maxClusterRate3 == 3:
        return cluster3
    elif maxClusterTaste4 == 2 and maxClusterRate4 == 3:
        return cluster4
    elif maxClusterTaste5 == 2 and maxClusterRate5 == 3:
        return cluster5
    else:
        return cluster6
    
def getClusterWithHighTasteAndLowRate():
    if maxClusterTaste1 == 3 and maxClusterRate1 == 2:
        return cluster1
    elif maxClusterTaste2 == 3 and maxClusterRate2 == 2:
        return cluster2
    elif maxClusterTaste3 == 3 and maxClusterRate3 == 2:
        return cluster3
    elif maxClusterTaste4 == 3 and maxClusterRate4 == 2:
        return cluster4
    elif maxClusterTaste5 == 3 and maxClusterRate5 == 2:
        return cluster5
    else:
        return cluster6
    
def getClusterWithHighTasteAndHighRate():
    if maxClusterTaste1 == 3 and maxClusterRate1 == 3:
        return cluster1
    elif maxClusterTaste2 == 3 and maxClusterRate2 == 3:
        return cluster2
    elif maxClusterTaste3 == 3 and maxClusterRate3 == 3:
        return cluster3
    elif maxClusterTaste4 == 3 and maxClusterRate4 == 3:
        return cluster4
    elif maxClusterTaste5 == 3 and maxClusterRate5 == 3:
        return cluster5
    else:
        return cluster6
    
#cluster2 = data[data['cluster']==1]
#plt.scatter(cluster2['income'], cluster2['score'])

#cluster3 = data[data['cluster']==2]
#plt.scatter(cluster3['income'], cluster3['score'])