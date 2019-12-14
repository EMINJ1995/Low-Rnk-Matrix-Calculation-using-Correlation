
function A = NRMSO(X,Y)
  A=0; 
 Z1 = X-Y;
 Z2 = Y;
 SUMX=0;
 SUMY=0;
    [m,n] = size(Z1);
    
    for i = 1:m
        for j = 1:n
          SUMX = SUMX + (Z1(i,j))^2;
          SUMY = SUMY + (Z2(i,j))^2;
        end
    end

        A = sqrt(SUMX)/sqrt(SUMY);
end
