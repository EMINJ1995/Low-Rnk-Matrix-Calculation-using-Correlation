function A=normcat(B,C)
[r c]=size(B);
for i=1:r
    for j=1:c
        if(isnan(B(i,j)))
            B(i,j)=0;
        end
       % C(i,j)=round(C(i,j));
    end
end
% to restrict min and max encoded numerical data of categorical
for j=1:c
    
   uni=nonzeros(unique(B(:,j)));
    [m n]=size(uni);
    for i=1:r
        d=(C(i,j));
           un=nonzeros(uni-1);
           un=un+1;
           x=d-un
           if((find((un)==d)))
             
           else
               k=find(min(x)==x);
               d=un(k);
               C(i,j)=(d);
           end
       
           
    end
    
end
A=C;
end