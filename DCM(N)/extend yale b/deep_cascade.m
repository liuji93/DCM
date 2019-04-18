function [ layer_acc ] = deep_cascade( X,Y,train_label,test_label,alpha,u,layer_num,classnum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
layer_acc=zeros(1,layer_num);
for i=1:layer_num
    train_soft=get_feature(X,X,train_label,alpha,u);
    test_soft =get_feature(X,Y,train_label,alpha,u);
    X=[X;train_soft];
    Y=[Y;test_soft];
    layer_acc(i)=compute_result( X,Y,classnum,train_label,test_label,alpha,u);
    train_soft=[];
    test_soft=[];
end

end

