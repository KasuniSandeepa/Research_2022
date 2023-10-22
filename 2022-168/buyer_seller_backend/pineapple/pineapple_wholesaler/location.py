#!/usr/bin/env python
# coding: utf-8

# In[1]:


import matplotlib.pyplot as plt
from IPython import get_ipython
from scipy import stats
import pandas as pd
import pandas as pd
import numpy as np
import scipy.stats as sp
import datetime as dt
# get_ipython().run_line_magic('matplotlib', 'inline')
import csv


# In[2]:


hotels = pd.read_csv("locations.csv")
hotels.head()


# In[3]:


hotels=hotels.rename(columns = {'Latitude':'lat','Longitude':'lon'})


# In[4]:


hotels.info()


# In[5]:


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


# In[106]:


def find_nearest(lat, long):
    distances = hotels.apply(
        lambda row: dist(lat, long, row['lat'], row['lon']),
        axis=1)
    hotels.loc[distances.idxmin(0), 'Capital']
    #print(distances.idxmin())
   # print(hotels.loc[np.argpartition(distances, 3), 'Capital'])
   # print(distances[np.argpartition(distances, 3)[:3]])
    idx = np.argpartition(distances, 3)
    #print(idx)
   # print(distances[idx[:5]])
    return hotels.loc[distances[idx[:3]].sort_values().index, 'Capital']


# In[108]:


find_nearest(6.5500,79.9836 )


# In[23]:





# In[ ]:



