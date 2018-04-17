function eigValsLessThanS = bisectionMethod2Tri(s,A)
eigValsLessThanS = 0;
[M,N] = size(A);
A = A - s*eye(N);
alpha(1) = 1;

for i = 1:M
   if i == 1
       alpha(i+1) = A(i,i);
       continue
   end
   alpha(i+1) = A(i,i)*alpha(i) - A(i-1,i)*A(i,i-1)*alpha(i-1);
end
for j = 2:size(alpha,2)
    if sign(alpha(j)) ~= sign(alpha(j-1))
        eigValsLessThanS = eigValsLessThanS + 1;
    end
end


end

