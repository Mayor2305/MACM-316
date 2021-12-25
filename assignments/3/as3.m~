function a = yourfunc()
x = -2: 0.01 : 3;
f =@(x) (((1-x).*((3+x).^(1/3)))./(x.*((4-x).^(1/2))))-3.06;
plot(x,f(x), "k-","LINEWIDTH",1.5);xlabel("X-Axis");ylabel("Y-Axis");grid on;
title("Part A - Non Linear Root Finding");
fprintf('Part A - Non Linear Root Finding \napproximate Root: %f \nNumber of Roots: %d\n\n',0.19, 1);

eqn =  '(((1-x).*(3+x).^(1/3))./ (x.* (4-x).^ (1/2)))-3.06';
[bisect_root, niter] = bisect2( eqn,[0.1,1.0]);
disp('Part-B Bisection Method');
fprintf('Root: %f\nNumber of Iterations: %d\n\n',bisect_root, niter);

newton_derivative = '(((1/3).*(1-x).*(3+x).^(-2/3) - ((3+x).^(1/3)) - ((4-x).^(1/2)) + ((1/2).*x.*(4-x).^(-1/2)))./(x.^2.*(4-x)))';
newton_eqn = '(((1-x).*(3+x).^(1/3))/ (x.* (4-x).^ (1/2)))-3.06';
[newton_root, newton_niter] = newton( newton_eqn, newton_derivative, 1.0);
disp('Part-B Newton Method');
fprintf('Root: %f\nNumber of Iterations: %d\n\n', newton_root, newton_niter);
end

