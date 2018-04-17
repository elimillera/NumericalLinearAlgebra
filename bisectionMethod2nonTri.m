function eigValsLessThanS = bisectionMethod2nonTri(s,A)
[M,N] = size(A);
eigValsLessThanS = 0;
A = A - s*eye(N);
alpha(1) = 1;
for i = 1:N
   alpha(i+1) = det(A(1:i,1:i));
end
for j = 2:size(alpha,2)
    if sign(alpha(j-1)) ~= sign(alpha(j))
        eigValsLessThanS = eigValsLessThanS + 1;
    end
end
end

