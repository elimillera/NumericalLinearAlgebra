function mat = hhAlg(w, A)
    mat(size(A,1),size(A,2)) = 0;
    idit = eye(size(A,1));
    for i = 1:size(A,1)
        %ith row in hh matrix
        vec = w(i)*w;
        hhvec = idit(:,i) - 2* vec;
        for j = 1:size(A,2)
            %jth col in A matrix
            vec2 = A(:,j);
            mat(i,j) = hhvec' * vec2;
        end
    end
end