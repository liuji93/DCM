function [  new_feature  ] = block16(X,Y,train_label,t,u,block_num,w,h,max_iter )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a=sqrt(block_num);
p=w/a;
q=h/a;
train_mat1=[];train_mat2=[];train_mat3=[];train_mat4=[];train_mat5=[];train_mat6=[];train_mat7=[];train_mat8=[];
train_mat9=[];train_mat10=[];train_mat11=[];train_mat12=[];train_mat13=[];train_mat14=[];train_mat15=[];train_mat16=[];

test_mat1=[];test_mat2=[];test_mat3=[];test_mat4=[];test_mat5=[];test_mat6=[];test_mat7=[];test_mat8=[];
test_mat9=[];test_mat10=[];test_mat11=[];test_mat12=[];test_mat13=[];test_mat14=[];test_mat15=[];test_mat16=[];

for i=1:size(X,2)
  im1=X(:,i);
  im1=reshape(im1,w,h);
  C=mat2cell(im1,ones(a,1)*w/a,ones(a,1)*h/a);  
  C=reshape(C,block_num,1); 
  train_mat1=[train_mat1,reshape(cell2mat(C(1)),w*h/block_num,1)];
  train_mat2=[train_mat2,reshape(cell2mat(C(2)),w*h/block_num,1)];
  train_mat3=[train_mat3,reshape(cell2mat(C(3)),w*h/block_num,1)];
  train_mat4=[train_mat4,reshape(cell2mat(C(4)),w*h/block_num,1)];
  train_mat5=[train_mat5,reshape(cell2mat(C(5)),w*h/block_num,1)];
  train_mat6=[train_mat6,reshape(cell2mat(C(6)),w*h/block_num,1)];
  train_mat7=[train_mat7,reshape(cell2mat(C(7)),w*h/block_num,1)];
  train_mat8=[train_mat8,reshape(cell2mat(C(8)),w*h/block_num,1)];
  train_mat9=[train_mat9,reshape(cell2mat(C(9)),w*h/block_num,1)];
  train_mat10=[train_mat10,reshape(cell2mat(C(10)),w*h/block_num,1)];
  train_mat11=[train_mat11,reshape(cell2mat(C(11)),w*h/block_num,1)];
  train_mat12=[train_mat12,reshape(cell2mat(C(12)),w*h/block_num,1)];
  train_mat13=[train_mat13,reshape(cell2mat(C(13)),w*h/block_num,1)];
  train_mat14=[train_mat14,reshape(cell2mat(C(14)),w*h/block_num,1)];
  train_mat15=[train_mat15,reshape(cell2mat(C(15)),w*h/block_num,1)];
  train_mat16=[train_mat16,reshape(cell2mat(C(16)),w*h/block_num,1)];
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
  test_mat5=[test_mat5,reshape(cell2mat(D(5)),w*h/block_num,1)];
  test_mat6=[test_mat6,reshape(cell2mat(D(6)),w*h/block_num,1)];
  test_mat7=[test_mat7,reshape(cell2mat(D(7)),w*h/block_num,1)];
  test_mat8=[test_mat8,reshape(cell2mat(D(8)),w*h/block_num,1)];
  test_mat9=[test_mat9,reshape(cell2mat(D(9)),w*h/block_num,1)];
  test_mat10=[test_mat10,reshape(cell2mat(D(10)),w*h/block_num,1)];
  test_mat11=[test_mat11,reshape(cell2mat(D(11)),w*h/block_num,1)];
  test_mat12=[test_mat12,reshape(cell2mat(D(12)),w*h/block_num,1)];
  test_mat13=[test_mat13,reshape(cell2mat(D(13)),w*h/block_num,1)];
  test_mat14=[test_mat14,reshape(cell2mat(D(14)),w*h/block_num,1)];
  test_mat15=[test_mat15,reshape(cell2mat(D(15)),w*h/block_num,1)];
  test_mat16=[test_mat16,reshape(cell2mat(D(16)),w*h/block_num,1)];
end
%降维
% train_mat1=normc(train_mat1); test_mat1=normc(test_mat1);
% train_mat2=normc(train_mat2); test_mat2=normc(test_mat2);
% train_mat3=normc(train_mat3); test_mat3=normc(test_mat3);
% train_mat4=normc(train_mat4); test_mat4=normc(test_mat4);
% train_mat5=normc(train_mat5); test_mat5=normc(test_mat5);
% train_mat6=normc(train_mat6); test_mat6=normc(test_mat6);
% train_mat7=normc(train_mat7); test_mat7=normc(test_mat7);
% train_mat8=normc(train_mat8); test_mat8=normc(test_mat8);
% train_mat9=normc(train_mat9); test_mat9=normc(test_mat9);
% train_mat10=normc(train_mat10); test_mat10=normc(test_mat10);
% train_mat11=normc(train_mat11); test_mat11=normc(test_mat11);
% train_mat12=normc(train_mat12); test_mat12=normc(test_mat12);
% train_mat13=normc(train_mat13); test_mat13=normc(test_mat13);
% train_mat14=normc(train_mat14); test_mat14=normc(test_mat14);
% train_mat15=normc(train_mat15); test_mat15=normc(test_mat15);
% train_mat16=normc(train_mat16); test_mat16=normc(test_mat16);

  new_feature1 = get_newfeature( train_mat1,test_mat1,t,u,p,q,max_iter,train_label);
  new_feature2 = get_newfeature( train_mat2,test_mat2,t,u,p,q,max_iter,train_label);
  new_feature3 = get_newfeature( train_mat3,test_mat3,t,u,p,q,max_iter,train_label);
  new_feature4 = get_newfeature( train_mat4,test_mat4,t,u,p,q,max_iter,train_label);
  new_feature5 = get_newfeature( train_mat5,test_mat5,t,u,p,q,max_iter,train_label);
  new_feature6 = get_newfeature( train_mat6,test_mat6,t,u,p,q,max_iter,train_label);
  new_feature7 = get_newfeature( train_mat7,test_mat7,t,u,p,q,max_iter,train_label);
  new_feature8 = get_newfeature( train_mat8,test_mat8,t,u,p,q,max_iter,train_label);
  new_feature9 = get_newfeature( train_mat9,test_mat9,t,u,p,q,max_iter,train_label);
  new_feature10 = get_newfeature( train_mat10,test_mat10,t,u,p,q,max_iter,train_label);
  new_feature11 = get_newfeature( train_mat11,test_mat11,t,u,p,q,max_iter,train_label);
  new_feature12 = get_newfeature( train_mat12,test_mat12,t,u,p,q,max_iter,train_label);
  new_feature13 = get_newfeature( train_mat13,test_mat13,t,u,p,q,max_iter,train_label);
  new_feature14 = get_newfeature( train_mat14,test_mat14,t,u,p,q,max_iter,train_label);
  new_feature15 = get_newfeature( train_mat15,test_mat15,t,u,p,q,max_iter,train_label);
  new_feature16 = get_newfeature( train_mat16,test_mat16,t,u,p,q,max_iter,train_label);
   
  new_feature=max(new_feature1,new_feature2);%取最大值
  new_feature=max(new_feature,new_feature3);
  new_feature=max(new_feature,new_feature4);
  new_feature=max(new_feature,new_feature5);
  new_feature=max(new_feature,new_feature6);
  new_feature=max(new_feature,new_feature7);
  new_feature=max(new_feature,new_feature8);
  new_feature=max(new_feature,new_feature9);
  new_feature=max(new_feature,new_feature10);
  new_feature=max(new_feature,new_feature11);
  new_feature=max(new_feature,new_feature12);
  new_feature=max(new_feature,new_feature13);
  new_feature=max(new_feature,new_feature14);
  new_feature=max(new_feature,new_feature15);
  new_feature=max(new_feature,new_feature16);
%new_feature=(1/16)*( new_feature1+ new_feature2+ new_feature3+ new_feature4+ new_feature5+ new_feature6+ new_feature7+ new_feature8+ new_feature9+ new_feature10+ new_feature11+ new_feature12 +new_feature13+ new_feature14+ new_feature15+ new_feature16);

end

