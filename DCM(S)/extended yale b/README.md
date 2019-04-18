Paper : Deep Cascade Model based Face Recognition: When Deep-layered Learning Meets Small Data<br />
Author : Lei Zhang, Ji Liu, Bob Zhang, David Zhang, and Ce Zhang<br />
Published in Transactions on Image Processing<br />
Contact : jiliu@cqu.edu.cn<br />

This package contains cleaned up codes for the submodel DCM(S), including:<br />
demo.m: the main demo codes<br />
train_test.m: the codes split dataset into training set and testing set<br />
get_feature.m: the codes solve SRC model and compute softmax features <br />
block4.m: the codes transform image features into softmax features in second channel of Multi-level Image Coding part<br /> 
block16.m: the codes transform image features into softmax features in third channel of Multi-level Image Coding part<br /> 
deep_cascade.m: the codes for Multi-layer Softmax Vector Coding part<br />
shrinkage.m: shrinkage algorithm in SRC model<br />
YaleB_32x32.mat: Extended Yale B dataset
