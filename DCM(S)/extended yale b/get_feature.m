function [ new_feature ] = get_feature( X,Y,train_label,alpha,u,index )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
classnum=length(unique(train_label));
tr_num=size(X,2);
te_num=size(Y,2);
Z=zeros(tr_num,te_num);
Lambda=zeros(tr_num,te_num);
I=eye(tr_num,tr_num);
new_feature=[];
value=[];
for i=1:50
    %updata W
    W=(X'*X+u*I)\(X'*Y-Lambda+u*Z);
    
    %updata Z
    Z=shrinkage(W+Lambda/u,alpha/u);
    
    %updata Lambda
    Lambda= Lambda+u*(W-Z);
    value(i)=norm(Y-X*W,'fro')+alpha*sum(sum(abs(Z)))+trace(Lambda'*(W-Z))+(u/2)*norm(W-Z,'fro');
end
if index>0
    W=W;
else 
    W=W-diag(diag(W));
end
for i=1:te_num
    xp = W(:,i);
    for j=1:classnum
        mmu=zeros(tr_num,1);
        ind=(j==train_label);
        mmu(ind)=xp(ind);
        r(j)=norm(Y(:,i)-X*mmu);
    end
    r=exp(-r)';
    r=r/sum(r);
    new_feature=[new_feature,r];
    r=[];
end

