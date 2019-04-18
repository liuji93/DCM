function [ a] =nuclear_norm(Y,p,q )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Y=reshape(Y,p,q);
[U,S,V]=svd(Y);
S=diag(S);
a=sum(S);
end

