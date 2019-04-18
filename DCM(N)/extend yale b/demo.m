%Demo of DCM(N) on Extended Yale B dataset
clc
clear
load('YaleB_32x32'); 
results = zeros(4,10);
trainnum      = 15;
le2_block_num = 4;
le3_block_num = 16;
p             = 32;
q             = 32;
t             = 1;
u             = 1;
alpha         = 1e-4;
mu            = 1.5;
layer_num     = 1;
max_iter      = 30;

[train_data,test_data,train_label, test_label] = train_test( fea,gnd,trainnum );
classnum = length(unique(train_label));

%% Multi-level Image Coding
 %block1

le1_train=normc(train_data);
le1_test=normc(test_data);
le1_trainfeature=get_newfeature(le1_train,le1_train,t,u,p,q,max_iter,train_label);
le1_testfeature=get_newfeature(le1_train,le1_test,t,u,p,q,max_iter,train_label);

 %block4

le2_train=normc(train_data);
le2_test=normc(test_data);
le2_trainfeature=block4(le2_train,le2_train,train_label,t,u,le2_block_num,p,q,max_iter);
le2_testfeature=block4(le2_train,le2_test,train_label,t,u,le2_block_num,p,q,max_iter);
 
  %block16

le3_train=normc(train_data);
le3_test=normc(test_data);
le3_trainfeature=block16(le3_train,le3_train,train_label,t,u,le3_block_num,p,q,max_iter);
le3_testfeature=block16(le3_train,le3_test,train_label,t,u,le3_block_num,p,q,max_iter);
  
  %% Multi-layer Softmax Vector Coding
 trainsample = [le1_trainfeature;le2_trainfeature;le3_trainfeature];
 testsample  = [le1_testfeature;le2_testfeature;le3_testfeature]; 
 [layer_acc] = deep_cascade(trainsample,testsample,train_label,test_label,alpha,mu,layer_num,classnum);
 %% result
 acc         = layer_acc(layer_num);
 fprintf('The accuracy is %8.5f%%\n',acc*100) 