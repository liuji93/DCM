function [ E,nuclear_norm] = svd_shrinkage(D,p,q,u )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
D=reshape(D,p,q);
[U,S,V]=svd(D);
st=diag(max(0,diag(S)-1/u));
E=U(:,1:size(st,1))*st*V(:,1:size(st,1))';
nuclear_norm=sum(diag(st));
E=reshape(E,p*q,1);
% SS=S;
% SS=diag(SS);
% a=length(SS);
% SS=SS-1/u;
% SS(SS<0)=0;
% nuclear_norm=sum(SS);
% SS=diag(SS);
% S(1:a,1:a)=SS;
% D=U*S*V';
% D=reshape(D,p*q,1);
end

