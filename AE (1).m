function A = AE(X, Y)
  A=0; 
 
 SUM=0;
 
    [m,n] = size(X);
    total=m*n;
    for i = 1:m
        for j = 1:n
          if(X(i,j)==Y(i,j))
             SUM=SUM+1;
          end
        end
    end

        A = SUM/total;
end
