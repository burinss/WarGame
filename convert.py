import numpy as np
import matplotlib.pyplot as plt 
import cv2
import os
import json

jsonData = []

picturesDirectory = 'province'
files = os.listdir(picturesDirectory)

for filename in files:
	img = cv2.imread(picturesDirectory +'\\'+ filename,cv2.IMREAD_UNCHANGED)
	print(filename)
	alpha = img[:,:,3]

	alpha[380,722]=0

	minx = 4096
	miny = 4096
	maxx = 0
	maxy = 0
	for i in range(alpha.shape[0]):
		for j in range(alpha.shape[1]):
			if alpha[i][j]>0.5:
				if (j<minx):
					minx=j
				if (i<miny):
					miny=i
				if (j>maxx):
					maxx=j
				if (i>maxy):
					maxy=i

	print(minx)
	print(miny)
	print(maxx)
	print(maxy)

	#crop = img[miny:maxy, minx:maxx].copy()
	#cv2.imwrite('cropped\\'+filename, crop)

	jsonData+=[json.dumps({"Name": filename, "x": minx, "y": miny}, sort_keys=True)]

f = open("data.json","w")
f.write(json.dumps(jsonData))
f.close()
