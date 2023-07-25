import dgl

from scipy.sparse import coo_matrix
import numpy as np

#a = dgl.data.CoraGraphDataset()
#a = dgl.data.RedditDataset()
#a = dgl.data.PubmedGraphDataset()
#a = dgl.data.CiteseerGraphDataset()
a = dgl.data.PPIDataset()

g = a[0]

#### storing matrix A ######
m = g.adj(scipy_fmt='coo')

#file = open("Cora_A.txt", "w")
#file = open("Reddit_A.txt", "w")
#file = open("Pubmed_A.txt", "w")
#file = open("Citeseer_A.txt", "w")
file = open("PPI_A.txt", "w")


print(str(m.shape[0])+" "+str(m.shape[1]), file=file)
print(m.data.size, file=file)

for i in range(m.data.size):
    print(str(m.row[i])+" "+str(m.col[i])+" "+str(m.data[i]), file=file)

file.close()

#### storing features #####
#file = open("Cora_feat.txt", "w")
#file = open("Pubmed_feat.txt", "w")
#file = open("Citeseer_feat.txt", "w")
file = open("PPI_feat.txt", "w")

features = g.ndata['feat']
features_coo = coo_matrix(features)
rows, cols = features_coo.nonzero()

print(str(features.shape[0])+" "+str(features.shape[1]), file=file)
print(len(rows), file=file)

for i in range(len(rows)):
    print(str(rows[i])+" "+str(cols[i])+" " +str(float(features[rows[i]][cols[i]])), file=file)

file.close()

