clear all
format long
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% Part (a): Set up Hilbert matrices and plot its norm and
% condition number.
nlist = (2:30); % matrix sizes
condH = [];
cond2H = [];    % empty matrix
normH = [];
norm2H = [];
for n = nlist
  Hn = hilb(n);
  normH = [normH, norm(Hn, 1)];
  norm2H = [norm2H, norm(Hn, 2)];
  condH = [condH, cond(Hn, 1)]; 
  cond2H = [cond2H, cond(Hn,2)];
  % ADD CODE TO COMPUTE COND(H) IN THE 1-NORM PLUS THE 1,2-NORMS
end
% ADD CODE TO PLOT CONDITION NUMBERS AND NORMS VERSUS n
semilogy(nlist, normH, "c-","LINEWIDTH",1.5);legend('1st norm');hold on;
semilogy(nlist, norm2H, "k-", 'DisplayName', 'norm 2',"LINEWIDTH",1.5);
semilogy(nlist, condH, "b-", 'DisplayName', 'cond 1',"LINEWIDTH",1.5);
semilogy(nlist, cond2H, "r-", 'DisplayName', 'cond 2',"LINEWIDTH",1.5);
title('Part A & B- Norms and Condition numbers');xlabel("n");ylabel("log(y)");grid on; 
% Part b:
% ADD THE THEOREALLY EXPECTED GROWTH TO YOUR PLOT
func = ((1+sqrt(2)) .^ (4 .* nlist))./(sqrt(nlist));
semilogy(nlist, func, "g-", 'DisplayName', 'BIG-O',"LINEWIDTH",1.5);hold off;
% %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% %Part (c): Compare performance for the ill-conditioned linear
% %system using: PLU decomposition, backslash, and Jacobi iteration.
% PLUerror = []; % list of 2-norm errors for PLU
% JACOBIerror = [];
% BACKSLAHerror = [];
% PLUtime = []; 
% JACOBItime = [];
% BACKSLAHtime = [];
% klist = [2 : 30]; % min/max matrix size
% for k = klist, 
%   Hk = hilb(k);  % generate Hilbert matrix
%   x = ones(k,1); % exact solution (all 1's)
%   b = Hk * x;    % compute RHS for this x
%   tic
%   % Compute the solution using 3 different methods:
%   [L, U, P] = lu(Hk);       
%   xPLU = U \ (L \ (P*b)); % solution from PLU-decomposition
%   PLUtime = [PLUtime, toc];
%   % ADD CODE TO COMPUTE SOLUTION USING '\' AND JACOBI
%   tic
%   x_cap_backslash = Hk.\ b;
%   BACKSLAHtime = [BACKSLAHtime, toc];
%   tic
%   [Jacobi_x, niter] = jacobi2( Hk, b, rand(k, 1), 1e-4, 219);
%   JACOBItime = [JACOBItime, toc];
%   PLUerror = [PLUerror, norm(xPLU-x,2)];
%   % ADD CODE TO COMPUTE ERRORS FOR '\' AND JACOBI
%   BACKSLAHerror = [BACKSLAHerror, norm( x_cap_backslash - x, 2)];
%   JACOBIerror = [JACOBIerror, norm(Jacobi_x - x, 2)];
% end
% % Plot solution errors
% semilogy(klist, PLUerror, "r-","LINEWIDTH",1.5);legend('PLU ERROR');hold on;
% semilogy(klist, BACKSLAHerror,"k-",'DisplayName', 'BACK SLASH ERROR',"LINEWIDTH",1.5);
% semilogy(klist, JACOBIerror, "b-", 'DisplayName', 'JACOBI ERROR',"LINEWIDTH",1.5);
% title('Part C - Error vs n = 2:30');xlabel("n");ylabel("log(y)");grid on;hold off;
% % % Plot solution time
% semilogy(klist, PLUtime, "r-","LINEWIDTH",1.5);legend('PLU time');hold on;
% semilogy(klist, BACKSLAHtime,"k-",'DisplayName', 'BACK SLASH time',"LINEWIDTH",1.5);
% semilogy(klist, JACOBItime, "b-", 'DisplayName', 'JACOBI time',"LINEWIDTH",1.5);
% title('Part C- Time for 3 matrix inversion algorithms');xlabel("n");ylabel("log(y)");grid on;hold off;
% % % ADD CURVES FOR '\' AND JACOBI TO THIS PLOT
% % %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% % % Part (d):
% llist = [2:30];
% arr = [];
% for l = llist, 
%   Hk = hilb(l);  % generate Hilbert matrix
%   M =Hk * inv(Hk);
%   arr = [arr, max(max(abs(M)))];
% end
% plot(llist, arr,"k-","LINEWIDTH",1.5);
% title('Part D- Error in inverse of Hilbert matrix');xlabel("X-Axis");ylabel("Y-Axis");grid on;
