function eigValsGreaterThanS = bisectionMethod1(s,A)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[M,N] = size(A);
A = A - s*eye(M);
[L,U] = luNoPivot(A);
alpha = diag(U);
I = find(alpha > 0);
eigValsGreaterThanS = size(I,1);


end

