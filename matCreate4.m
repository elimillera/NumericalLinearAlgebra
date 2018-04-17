function mat = matCreate4(n)
mat(n,n) = 0;

for i = 1:n
    for j = 1:n
        mat(i,j) = i^j + j^3 + 4*i;
    end
end
end

