function [A,GL]=Categorical(d)
if(iscategorical(d)==0)
d1=categorical(d{:,:});
else
    d1=d;
end
[m,n]=size(d1);
d2=d1(1,:);
[G,GN,GL] = grp2idx(d2)
for i=1:m
    d2=d1(i,:);
    n=grp2idx(d2);
    num(i,:)=n';
end
A=num;
end
