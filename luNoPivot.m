function [L,U] = luNoPivot(mat)
    %Find size of matrix
    [numRows, numCols]  = size(mat);
    %Create identity matrix
    L = eye(numCols);
    U = mat;
    
    %LU factor.
    for i = 1:numCols
        for j = i+1:numRows
            L(j,i) = U(j,i)/U(i,i);
            U(j,:) = U(j,:) - L(j,i)*U(i,:);
        end
    end
end

