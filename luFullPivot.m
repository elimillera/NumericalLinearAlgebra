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


