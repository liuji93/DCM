function [Z,value] = represent_coefficient(X,Y ,alpha,u,max_iter)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
tr_num=size(X,2);                          %number of training data
te_num=size(Y,2);                          %number od testing data

Z=zeros(tr_num,te_num);
Lambda=zeros(tr_num,te_num);
I=eye(tr_num,tr_num);
value=[];
% updata variable
for i=1:max_iter
    %updata W
    W=(X'*X+u*I)\(X'*Y-Lambda+u*Z);
    
    %updata Z
    Z=shrinkage(W+Lambda/u,alpha/u);
    
    %updata Lambda
    Lambda= Lambda+u*(W-Z);
    
    value(i)=norm(Y-X*Z,'fro')+alpha*sum(sum(abs(Z)));
end

end

