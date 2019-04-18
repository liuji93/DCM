function [accuracy,pre_label]=computaccuracy(trainsample,classnum,train_label,testsample,test_label,W)
test_tol=size(testsample,2);
train_tol=size(trainsample,2);
pre_label=zeros(1,test_tol);
%h = waitbar(0,'Please wait...');
for i=1:test_tol
    xp = W(:,i);
    for j=1:classnum
        mmu=zeros(train_tol,1);
        ind=(j==train_label);
        mmu(ind)=xp(ind);
        r(j)=norm(testsample(:,i)-trainsample*mmu);
    end
    [temp,index]=min(r);
    pre_label(i)=index;
    % computations take place here
    per = i / test_tol;
    %waitbar(per, h ,sprintf('%2.0f%%',per*100))
end
%close(h)
accuracy=sum(pre_label==test_label)/test_tol;

