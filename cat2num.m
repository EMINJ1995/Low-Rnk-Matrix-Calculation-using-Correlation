function A = cat2num(M)
B=M;
[m,n]=size(M);
 for i = 1:m
        for j = 1:n
            if(M(i,j)=='y')
                B(i,j) = 1;
            elseif(M(i,j)=='n')
              B(i,j) = 2;
              elseif(M(i,j)=='republican')
              B(i,j) = 3;
            else(M(i,j)=='democrat')
               B(i,j) = 4; 
            end
        end
 end
 A=B;
end