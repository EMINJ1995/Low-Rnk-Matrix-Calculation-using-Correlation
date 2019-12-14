function [A,nr] = normalize(M)
A = M;
    [m,n] = size(A);
    tocompare = ones(m,n);
    for i = 1:m
        for j = 1:n
            if(isnan(M(i,j)))
                % initiated with unknown=0
                A(i,j) = 0;
            end
        end
    end
    nr=sqrt(sum(A.^2,1));
Anorm=bsxfun(@rdivide,A,nr)
A=Anorm
end