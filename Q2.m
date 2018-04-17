function [C,e1,e2,e3] = Q2(A,x)
b = A*x;

[L1,U1] = luNoPivot(A);
[L2,U2,P2] = lu(A);
[L3,U3,P3,Q3] = luFullPivot(A);

%No Pivoting
%Ax = b
%LUx = b
%Ux = L'b
%x = U'L'b
x1 = inv(U1) * inv(L1) * b;
e1 = norm(x1 - x);

%Partial Pivoting
%Ax = b
%PA = LU
%A = P'LU
%P'LUx = b
%x = U'L'Pb
x2 = inv(U2) * inv(L2) * P2 * b; 
e2 = norm(x2 - x);

%Full Pivoting
%Ax = b
%PAQ = LU
%A = PLUQ
%Ax = b
%PLUQx = b
%x = Q * U' * L' * P * b
x3 = Q3 * inv(U3) * inv(L3) * P3 *b;
e3 = norm(x3 - x);

C = norm(A)*norm(inv(A));

end

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

function [L,U,P,Q] = luFullPivot(mat)
%Find size of matrix
    [numRows, numCols]  = size(mat);
    %Create identity matrix
    L = eye(numCols);
    U = mat;
    %Permutation vectors
    p = 1:numRows;
    q = 1:numCols;
    %Permutation Matricies
    P = eye(numRows);
    Q = eye(numCols);
    
    %LU factor.
    for i = 1:numCols
        %Maximum along Columns
        [Y,Ind] = max(abs(U(i:numRows,i:numCols)),[],1);
        [Y2,Ind2] = max(abs(Y));
        colInd = Ind2 - 1 + i;
        %Maximum along Rows
        [Y3, Ind3] = max(abs(U(i:numRows,i:numCols)),[],2);
        [Y4, Ind4] = max(abs(Y3));
        rowInd = Ind4 - 1 + i;
        %Row permutation
        if(rowInd ~= i)
            p([rowInd, i]) = p([i,rowInd]);
        end
        %Column Permutation
        if(colInd ~= i)
            q([colInd,i]) = q([i,colInd]);
        end
        %permute L
        if i ~= 1
            %not sure why this works.
            L = L - eye(numRows);
            L([rowInd,i],:) = L([i,rowInd],:);
            L = L + eye(numRows);
        end
        %permute U
        U(:,[colInd,i]) = U(:,[i,colInd]);
        U([rowInd,i],:) = U([i,rowInd],:);
        %Factor
        for j = i+1:numRows
            L(j,i) = U(j,i)/U(i,i);
            U(j,:) = U(j,:) - L(j,i)*U(i,:);
        end
        
    end
    %Permutation vectors -> matrix
    P = P(p,:);
    Q = Q(:,q);
end