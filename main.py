#%%
import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

x = np.linspace(0, 20, 100)
plt.plot(x, np.sin(x))
plt.show() 

#%%
import os

import numpy as np
import _pickle as pickle

#%%
def loadCIFAR10():
  filename = os.path.join(os.getcwd(), "cifar-10-batches-py", "data_batch_1")
  with open(filename, "rb") as f:
    out = pickle.load(f, encoding='latin1')

    images = out['data']
    #images = np.reshape(images, (10000, 3, 32, 32))
    labels = out['labels']

    print(images[0])

    imagearray = np.array(images)   #   (10000, 3072)
    labelarray = np.array(labels)   #   (10000,)

    print(imagearray[0])
    



def main():
  loadCIFAR10()

if __name__ == '__main__':
  main()