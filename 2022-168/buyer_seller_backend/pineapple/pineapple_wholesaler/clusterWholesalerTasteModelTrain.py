import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import pickle

data = pd.read_csv('wholesellerData.csv')
# data.sample(98)

# visualize the data distribution
plt.scatter(data['Ratings'], data['TasteQuality'])

# calculate sum of squares errors for different K values
k_values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
wcss_error = []
for k in k_values:
    model = KMeans(n_clusters=k)
    model.fit(data[['Ratings', 'TasteQuality']])
    wcss_error.append(model.inertia_)

# sum of squares error for K=1 to k=10
wcss_error

# plot WCSS error corresponding to different K values
plt.xlabel('Number of Clusters (K)')
plt.ylabel('WCSS Error')
plt.title('k value for pineapple taste')
plt.plot(k_values, wcss_error)

# train model using k=6
model = KMeans(n_clusters=6)
pred = model.fit_predict(data[['Ratings', 'TasteQuality']])

data = {
    "model": model,
    "pred": pred,
}

with open('clusterWholesalerTasteModel.pkl', 'wb') as file:
    pickle.dump(data, file)