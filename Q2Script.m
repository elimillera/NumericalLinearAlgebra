%Q2 Script
A = matCreate1(2);
B = rand(4);
C = matCreate2(8);
D = rand(16);
E = matCreate3(20);
F = rand(30);
G = matCreate4(40);
H = rand(60);

x = 1:60;
x = x';

[Ca, e1a, e2a, e3a] = Q2(A,x(1:2));
[Cb, e1b, e2b, e3b] = Q2(B,x(1:4));
[Cc, e1c, e2c, e3c] = Q2(C,x(1:8));
[Cd, e1d, e2d, e3d] = Q2(D,x(1:16));
[Ce, e1e, e2e, e3e] = Q2(E,x(1:20));
[Cf, e1f, e2f, e3f] = Q2(F,x(1:30));
[Cg, e1g, e2g, e3g] = Q2(G,x(1:40));
[Ch, e1h, e2h, e3h] = Q2(H,x(1:60));

conds = [Ca, Cb, Cc, Cd, Ce, Cf, Cg, Ch]
e1s = [e1a, e1b, e1c, e1d, e1e, e1f, e1g, e1h]
e2s = [e2a, e2b, e2c, e2d, e2e, e2f, e2g, e2h]
e3s = [e3a, e3b, e3c, e3d, e3e, e3f, e3g, e3h]

%Log of conditions and errors.
hold on
lconds = log(conds);
plot(lconds)
le1s = log(e1s);
plot(le1s)
le2s = log(e2s);
plot(le2s)
le3s = log(e3s);
plot(le3s)
hold off