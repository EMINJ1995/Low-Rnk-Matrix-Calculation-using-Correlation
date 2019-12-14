function A=Categ(d,GL)
endata=GL;
[high,low]=size(endata);
d1=round(d,0);
[m,n]=size(d1);
for i=1:m
    for j=1:n
      if(d1(i,j)<low)
         d1(i,j)=low;
      elseif(d1(i,j)>high)
          d1(i,j)>high;
      end
    d2(i,j)=endata((d1(i,j)),1); 
    end
end
A=d2;
end