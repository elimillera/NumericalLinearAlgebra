function [L,U] = symlu(mat)
[numRows, numCols] = size(mat);
L = eye(numRows);
U = mat;

for i = 1:numRows
    for j = i+1:numCols
        %Find entires of L using only upper triangular part of U
        L(j,i) = U(i,j)/U(i,i);
        for k = j:numCols
            U(j,k) = U(j,k) - U(i,k)*L(j,i);
        end
    end
end
U = triu(U);

end

