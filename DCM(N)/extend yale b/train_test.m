function [ X,Y,train_label, test_label] = train_test( fea,gnd,trainnum )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
total_person=38;
%load('fea')
%load('gnd') 
gnd=gnd';%load labels
fea=fea';
X=[];
Y=[];
train_label=[];
test_label=[];
for i=1:total_person
   data=fea(:,(gnd==i)); 
   [m,n]=size(data);  %n为第i类的个数
   ind=randperm(n);
   label=ones(1,n)*i;
   %half=ceil(n/2);
   x=data(:,ind(1:trainnum));
   y=data(:,ind(trainnum+1:end));
   tr=label(:,ind(1:trainnum));
   te=label(:,ind(trainnum+1:end));
   X=[X,x];
   Y=[Y,y];
   train_label=[train_label,tr];
   test_label=[test_label,te];

end
end

