function mat = matCreate3(n)
mat(n,n) = 0;

for i = 1:n
    for j = 1:n
        mat(i,j) = 3*i + 2*j;
    end
end
end

