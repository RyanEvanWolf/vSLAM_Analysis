#!/usr/bin/env python
import pandas as pd
import matplotlib.pyplot as plt
import pylab
from scipy.stats import norm

import numpy as np


pd.read_csv("/home/ryan/temp.csv").plot()#.hist(bins=500)
#pd.read_csv("D1_time.csv")["fMapTime"].plot.hist(bins=500)
#Data=pd.read_csv("D1_time.csv")

#plt.hist(Data["fMapTime"],bins=25)

plt.show()