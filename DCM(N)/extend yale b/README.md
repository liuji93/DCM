Paper : Deep Cascade Model based Face Recognition: When Deep-layered Learning Meets Small Data<br />
Author : Lei Zhang, Ji Liu, Bob Zhang, David Zhang, and Ce Zhang<br />
Published in Transactions on Image Processing<br />
Contact : jiliu@cqu.edu.cn<br />

This package contains cleaned up codes for the submodel DCM(N), including:<br />
demo.m: the main demo codes<br />
train_test.m: the codes split dataset into training set and testing set<br />
get_newfeature.m: the codes transform image features into softmax features<br />
admm_nmr.m: the codes solve nuclear-norm matrix regression matrix regression<br />
block4.m: the codes transform image features into softmax features in second channel of Multi-level Image Coding part<br /> 
block16.m: the codes transform image features into softmax features in third channel of Multi-level Image Coding part<br /> 
deep_cascade.m: the codes for Multi-layer Softmax Vector Coding part<br />
get_feature.m: the codes compute softmax features in Multi-layer Softmax Vector Coding part<br />
shrinkage.m: shrinkage algorithm in SRC model<br />
svd_shrinkage.m: svd shrinkage algorithm in NMR model<br />
nuclear_norm.m: the codes compute nuclear norm.<br />
YaleB_32x32.mat: Extended Yale B dataset
