function A = stage1(M)
    %% create tocompare matrix NaN=0 
    A = M;
    [m,n] = size(A);
    tocompare = ones(m,n);
    for i = 1:m
        for j = 1:n
            if(isnan(M(i,j)))
                tocompare(i,j) = 0;
                % initiated with unknown=0
                A(i,j) = 0;
            end
        end
    end
    
    %% Similar to gradient descent
    %the reason why 1:15 is because the calculation accuracy in the matlab
    %is decimal point 15
    for step_size = 1:5
        A = stage2(A, tocompare, step_size);
       % A = stage3(A, tocompare, step_size);
    end
end
