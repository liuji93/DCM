function [ new_feature] = get_newfeature( X,Y,t,u,p,q,max_iter,train_label)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
train_tol=size(X,2);
test_tol =size(Y,2);
classnum =length(unique(train_label));
I=eye(train_tol,train_tol); %the identity matrix
M=(X'*X+(t/u)*I)\X';
new_feature=[];
for i=1:test_tol
    y=Y(:,i);
    E=-y;
    Z=zeros(p*q,1);
    [w,value]=admm_nmr(y,X,M,E,Z,t,u,p,q,max_iter);
    re_y=X*w;
    for j=1:classnum
       mmu=zeros(train_tol,1);
        ind=(j==train_label);
        mmu(ind)=w(ind);
        r(j)=nuclear_norm(re_y-X*mmu,p,q); 
    end
    r=exp(-r)';
    r=r./sum(r);
    new_feature=[new_feature,r];
    r=[];
end
end

