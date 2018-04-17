function mat = matCreate2(n)
mat(n,n) = 0;

for i = 1:n
    for j = 1:n
        mat(i,j) = i^(j-1);
    end
end
end

