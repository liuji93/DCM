function [ new_feature ] = block4( X,Y,train_label,alpha,u,block_num,w,h ,index)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
a=sqrt(block_num);
train_mat1=[];train_mat2=[];train_mat3=[];train_mat4=[];
test_mat1=[];test_mat2=[];test_mat3=[];test_mat4=[];

for i=1:size(X,2)
  im1=X(:,i);
  im1=reshape(im1,w,h);
  C=mat2cell(im1,ones(a,1)*w/a,ones(a,1)*h/a);  
  C=reshape(C,block_num,1); 
  train_mat1=[train_mat1,reshape(cell2mat(C(1)),w*h/block_num,1)];
  train_mat2=[train_mat2,reshape(cell2mat(C(2)),w*h/block_num,1)];
  train_mat3=[train_mat3,reshape(cell2mat(C(3)),w*h/block_num,1)];
  train_mat4=[train_mat4,reshape(cell2mat(C(4)),w*h/block_num,1)];
end

for j=1:size(Y,2)
  im2=Y(:,j);
  im2=reshape(im2,w,h);
  D=mat2cell(im2,ones(a,1)*w/a,ones(a,1)*h/a);  
  D=reshape(D,block_num,1); 
  test_mat1=[test_mat1,reshape(cell2mat(D(1)),w*h/block_num,1)];
  test_mat2=[test_mat2,reshape(cell2mat(D(2)),w*h/block_num,1)];
  test_mat3=[test_mat3,reshape(cell2mat(D(3)),w*h/block_num,1)];
  test_mat4=[test_mat4,reshape(cell2mat(D(4)),w*h/block_num,1)];   
end
train_mat1=normc(train_mat1); test_mat1=normc( test_mat1);
train_mat2=normc(train_mat2); test_mat2=normc( test_mat2);
train_mat3=normc(train_mat3); test_mat3=normc( test_mat3);
train_mat4=normc(train_mat4); test_mat4=normc( test_mat4);

  new_feature1 = get_feature( train_mat1,test_mat1,train_label,alpha,u,index);
  new_feature2 = get_feature( train_mat2,test_mat2,train_label,alpha,u,index );
  new_feature3 = get_feature( train_mat3,test_mat3,train_label,alpha,u,index );
  new_feature4 = get_feature( train_mat4,test_mat4,train_label,alpha,u,index );
  
  new_feature=max(new_feature1,new_feature2);%取最大值
  new_feature=max(new_feature,new_feature3);
  new_feature=max(new_feature,new_feature4);
end

