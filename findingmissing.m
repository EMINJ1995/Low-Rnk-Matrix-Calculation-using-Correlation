function A = findingmissing(d,sortdis,k,dis,sample)

m=ismissing(d);
[r1,c1]=size(d);

%mis=m(:,1);
[i1 j1]=find(m);
kmisuni=unique(i1);
[r2,c2]=size(dis);
[r,c]=size(kmisuni);
z1=zeros(r1,c1,r);
z2=zeros(r1,c1,r);
z=zeros(r1,c1,r);
distance=zeros(r1,r1,r);
initia=zeros(r,c1);
for i=1:r        
kvalue=k(kmisuni(i));

kvalue=kvalue+1;
%beta=sortdis(kmisuni(i),kvalue);
    for(f=1:kvalue)
       
            [val,Index]=min(dis(kmisuni(i),:));
            dis(kmisuni(i),Index)=10;
           
    z(f,:,i)=d(Index,:);
    s(f,:,i)=sample(Index,:);
    knnid(f,i)=Index;
   
    end
% LRMC and no-zero rows will be transfer as size of z is more.

z1(:,:,i)=stage1(z(:,:,i));

end
% to find missing data row in every matrix
for i=1:r
for j=1:r
if(find(knnid(:,j)==kmisuni(i)))
    missdata(j,i)=find(knnid(:,j)==kmisuni(i));
end
end
end
for i=1:r
nz=nonzeros(missdata(:,i));
[r3,c3]=size(nz);
if(r3==1) % misssing row existing in only one matrix
    o=kmisuni(i);
     for rr=1:c1
      if(sample(o,rr)==0)
  d(o,rr)=z1(1,rr,i)
      end
  end
else
    u=0;
    for it2=1:r
        
        if(missdata(it2,i)==0)
           %do nothing 
    
        else % fetch row from z1 to z2
         u=u+1;
    z2(u,:,i)=z1(missdata(it2,i),:,it2);
    s2(u,:,i)=s(missdata(it2,i),:,it2);
        end
    end
X=z2(any(z2(:,:,i) ~= 0,2),:,i);
s3=s2(any(s2(:,:,i) ~= 0,2),:,i);
distance=correlation(X,s3);
distance=round(distance,5);
sigma=std(distance);

[r4,c4]=size(sigma);
if(det(distance)~=0)
    C = bsxfun(@rdivide,distance,sigma);
else
  C=distance;
end
Csq=C.*C;
ri1=exp(-(C));
o=kmisuni(i);
[m,n]=size(X);
En1=zeros(1,n);
ri2=0;
for e=1:m
   En1=En1+(ri1(1,e)*X(e,:)); 
   ri2=ri2+ri1(1,e);
   disp=ri2
   En2=En1/ri2;
end
  initia(i,:) =En1;
  initia1(i,:)=En2;
  for rr=1:c1
      if(sample(o,rr)==0)
  d(o,rr)=En2(1,rr);
      end
  end
end
end
A=d;
end
