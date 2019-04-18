function [ accuracy] = compute_result( trainsample1,testsample1, classnum,train_label,test_label,alpha,u)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tr_num=size(trainsample1,2);  
te_num=size(testsample1,2); 
Z=zeros(tr_num,te_num);
Lambda=zeros(tr_num,te_num);
I=eye(tr_num,tr_num);
value=zeros(1,40);
for i=1:40
    %updata W
    W=(trainsample1'*trainsample1+u*I)\(trainsample1'*testsample1-Lambda+u*Z);
    
    %updata Z
    Z=shrinkage(W+Lambda/u,alpha/u);
    
    %updata Lambda
    Lambda= Lambda+u*(W-Z);
    
    value(i)=norm(testsample1-trainsample1*W,'fro')+alpha*sum(sum(abs(Z)))+trace(Lambda'*(W-Z))+(u/2)*norm(W-Z,'fro');
     % k=exp(-norm(Y-X*W,'fro')^2);
end

[accuracy,pre_label]=computaccuracy(trainsample1,classnum,train_label,testsample1,test_label,W);

end

