function [ w,value ] = admm_nmr(y,X,M,E,Z,t,u,p,q,max_iter )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%updata w
value=[];
for i=1:max_iter
w=M*(y+E-Z/u);

%updata E
D=X*w-y+Z/u;
[E,nuclear_norm]=svd_shrinkage( D,p,q,u );

%updata Z

Z=Z+u*(X*w-E-y);

%compute objective function value
value(i)=nuclear_norm+(t/2)*norm(w,2)^2;
end
end

%nuclear_norm+(t/2)*norm(w,2)^2+trace(Z'*(X*w-E-y))+(u/2)*norm(X*w-E-y,2)^2;