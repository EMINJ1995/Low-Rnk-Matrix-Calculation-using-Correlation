function A = correlation(d,s)
[m n]=size(d);
compare=s;
duplicate=d;
xi=ones(1,n);
xj=ones(1,n);
l=1;
wj=ones((m*m),n);
wt=0;
for i=1:m
    for k=1:m
        wt=0;
       for j=1:n
        xi(j)=duplicate(i,j);
        xj(j)=duplicate(k,j);
        if((compare(i,j) == 0)||(compare(k,j) == 0))
            w(j)=0.2;
        
        else
            w(j)=1;
        end
         wj(l,j)=w(j); 
         wt=wt+w(j);
       end
         wxi=0;
         wxj=0;
         wxis=0;
         wxjs=0;
         wxij=0;
        for j=1:n
            w(j)=w(j)/wt;
            wxi=wxi+xi(j)*w(j);
            
            wxj=wxj+xj(j)*w(j);
          
        end
         for j=1:n
            xi(j)=xi(j)-wxi;
            xj(j)=xj(j)-wxj;
         end
          for j=1:n
               wxis=wxis+xi(j)*w(j)*xi(j);
         wxjs=wxjs+xj(j)*w(j)*xj(j);
            wxij=wxij+w(j)*xi(j)*xj(j);
          end
            cor=(wxij/sqrt(wxis*wxjs));
            dis(i,k)=1-abs(cor);
    end
      l=l+1;
    end
A=dis;
end

