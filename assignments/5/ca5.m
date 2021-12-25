function ca5(n)
e = ones(n,1);
Asparse = spdiags([e -4*e 6*e -4*e e],-2:2,n,n);
Asparse(1, 1) = 9; Asparse(n, n-1) = -2; Asparse(n-1, n) = -2; Asparse(n-1, n-1) = 5; Asparse(n, n) = 1;
L = 1.5; h = L/n; F = 0.4; b = (F * (h^4)) * ones(n, 1);
tic
z1 = Asparse\ b;
time1 = toc;
Adense = full(Asparse);
tic
z2 = Adense\ b;
time2 = toc;
tic
z0 = ones(n, 1);
[z3] = gs2(Asparse, b, z0, 1e-8, 1e5);
time3 = toc;
norm1 = norm(z1, 2); norm2 = norm(z2, 2); norm3 = norm(z3, 2);
fprintf("Part A:\n a.) cost = %d norm = %d\n b.) cost = %d norm = %d\n c.) cost = %d norm = %d\n",time1, norm1, time2, norm2, time3, norm3);
%PART-B
U = spdiags([e -2*e e], 0 : 2, n, n);
U(1, 1) = 2;
UT = U.';
tic
U_UT_B = (UT\ (U\b));
U_time = toc;
U_UT_B_NORM = norm(U_UT_B, 2);
fprintf("Part B:\n cost = %d norm = %d\n", U_time, U_UT_B_NORM);
%PART-C
u  = triu(Asparse, 1);  % upper triangular part of A
DpL= Asparse - u;       % =D+L
T  = -DpL \ u;
RHO = max(abs(eig(full(T))));
c_Asparse = condest(Asparse);
c_U = condest(U);
fprintf("Part C:\n condition number Asparse = %d\n condition number U = %d\n RHO = %d\n", c_Asparse, c_U, RHO);
%PART-D
x = (1:1:n);
plot(x, z1, "LINEWIDTH", 1.5);
title('Part D - Deflections');xlabel("X-Axis");ylabel("Y-Axis");grid on;
zmax = max(U_UT_B);
EI = (F * (L^4)) / (6 * zmax);
fprintf("Part-D\n Flexural Rigidity : %d\n ", EI);
end