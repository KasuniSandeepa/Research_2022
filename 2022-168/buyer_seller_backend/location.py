## for data
import numpy as np
import pandas as pd
## for plotting
import matplotlib.pyplot as plt
import seaborn as sns
## for geospatial
import folium
import geopy
## for machine learning
from sklearn import preprocessing, cluster
import scipy
## for deep

from math import radians, cos, sin, asin, sqrt
def dist(lat1, long1, lat2, long2):
    """
Replicating the same formula as mentioned in Wiki
    """
    # convert decimal degrees to radians
    lat1, long1, lat2, long2 = map(radians, [lat1, long1, lat2, long2])
    # haversine formula
    dlon = long2 - long1
    dlat = lat2 - lat1
    a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
    c = 2 * asin(sqrt(a))
    # Radius of earth in kilometers is 6371
    km = 6371* c
    return km

def getNearFarmers(farmers,lat,long,size):
    if size > 5:
        size = 5
    else:
        size = size -1
    farmers = farmers.rename(columns={'Latitude': 'lat', 'Longitude': 'lon'})
    print(farmers)
    distances = farmers.apply(
        lambda row: dist(lat, long, row['lat'], row['lon']),
        axis=1)
    idx = np.argpartition(distances, size)
    return farmers.loc[distances[idx[:size]].sort_values().index]

def getNearWholesalers(wholesalers,lat,long,size):
    if size > 5:
        size = 5
    else:
        size = size -1
    wholesalers = wholesalers.rename(columns={'Latitude': 'lat', 'Longitude': 'lon'})
    print(wholesalers)
    distances = wholesalers.apply(
        lambda row: dist(lat, long, row['lat'], row['lon']),
        axis=1)
    idx = np.argpartition(distances, size)
    return wholesalers.loc[distances[idx[:size]].sort_values().index]