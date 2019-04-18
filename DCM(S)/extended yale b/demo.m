%Demo of DCM(S) on Extended Yale B
clc
clear
load('YaleB_32x32')
trainnum=15;
[ train_data,test_data,train_label,test_label ] = train_test( fea,gnd,trainnum);
classnum=length(unique(train_label));
le2_block_num=4;
le3_block_num=16;
w=32;
h=32;
alpha1=1e-4;
u1=1e-1;
alpha2=1e-4;
u2=1;
index=1;
layer_num=10;
%% Multi-level Image Coding
 %block1
le1_train=normc(train_data);
le1_test=normc(test_data);
le1_trainfeature=get_feature(le1_train,le1_train,train_label,alpha1,u1,index);
le1_testfeature=get_feature(le1_train,le1_test,train_label,alpha1,u1,index);

 %block4
le2_train=train_data;
le2_test=test_data;
le2_trainfeature=block4(le2_train,le2_train,train_label,alpha1,u1,le2_block_num,w,h,index);
le2_testfeature=block4(le2_train,le2_test,train_label,alpha1,u1,le2_block_num,w,h,index);
 
  %block16
le3_train=train_data;
le3_test=test_data;
le3_trainfeature=block16(le3_train,le3_train,train_label,alpha1,u1,le3_block_num,w,h,index);
le3_testfeature=block16(le3_train,le3_test,train_label,alpha1,u1,le3_block_num,w,h,index);
 
[Z1,~] = represent_coefficient(le1_trainfeature,le1_testfeature ,alpha2,u2,40);
%[accuracy1,~] = computaccuracy(le1_trainfeature,classnum,train_label,le1_testfeature,test_label,Z1)

[Z2,~] = represent_coefficient(le2_trainfeature,le2_testfeature ,alpha2,u2,40);
%[accuracy2,~] = computaccuracy(le2_trainfeature,classnum,train_label,le2_testfeature,test_label,Z2)

[Z3,~] = represent_coefficient(le3_trainfeature,le3_testfeature ,alpha2,u2,40);
%[accuracy3,~] = computaccuracy(le3_trainfeature,classnum,train_label,le3_testfeature,test_label,Z3)

%% Multi-layer Softmax Vector Coding
trainsample=[le1_trainfeature;le2_trainfeature;le3_trainfeature];
testsample=[le1_testfeature;le2_testfeature;le3_testfeature];  
layer_acc=deep_cascade( trainsample,testsample,train_label,test_label,alpha2,u2,index,layer_num,classnum );

%% result
acc = layer_acc(layer_num);
fprintf('The accuracy is %8.5f%%\n', acc*100) 

 