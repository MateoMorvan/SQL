import numpy as np
import pandas as pd
import re
import matplotlib.pyplot as plt

from sklearn.linear_model import LinearRegression


CollegesDF = pd.read_csv("vue.csv")

CollegesDFnoNull = CollegesDF.fillna(0)
CollegesAr = CollegesDFnoNull.to_numpy() 

j=0
for i in CollegesAr :
    i[2] = len(i[2])
    j+=1
    i[1]=re.findall('\d\d\d\d',i[1])
    i[1]=int(i[1][0])

print(CollegesAr) 

def Centreduire(T):
    T=np.array(T,dtype=np.float64)
    (n,p)=T.shape
    res=np.zeros((n,p))
    TMoy=np.mean(T,axis=0)
    TEcart=np.std(T,axis=0)
    for j in range(p):
        res[:,j]=(T[:,j]-TMoy[j])/TEcart[j]
    return res

CollegesAr_Cr = Centreduire(CollegesAr)

print(CollegesAr_Cr) 

CollegesAr0 = CollegesDFnoNull._get_numeric_data().to_numpy()



def DiagBatons(Colonne):
    m= min(Colonne)
    M= max(Colonne)
    inter= np.linspace(m,M)
    plt.hist(Colonne,inter,histtype='bar',align='left',rwidth=0.1)
    plt.show()
    plt.figure()
    
    
#DiagBatons(CollegesAr0[:,0])

CollegesCov = np.cov(CollegesAr_Cr, rowvar=False)

print(CollegesCov)