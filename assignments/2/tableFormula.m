function dimensions = tableFormula()
disp('part A');
w = 28; h = 25; b = 3.5;
theta = linspace(rad2deg(-pi),rad2deg(pi));
f = @(theta) h * cosd(theta) + b - w * sind(theta);
plot(theta,f(theta),"k-","LINEWIDTH",1.5);xlabel("X-Axis");ylabel("Y-Axis");grid on;
title("Part A - Roots Approximation");
fprintf('approximate Roots: %f , %f\nNumber of Roots: %d\n\n',-143.6, 46.9, 2);

disp('part B');
eqn = '25 * cos(theta) + 3.5 - 28 * sin(theta)';
[bisect_root, niter] = bisect2( eqn,[0,pi/2],0.0174533);
bisect_root = rad2deg(bisect_root);
disp('Bisection Method');
fprintf('Root: %f\nNumber of Iterations: %d\n\n',bisect_root, niter);

gfunc = 'asin((25*cos(theta)+3.5)/28)';
[xfinal, fp_niter] = fixedpt( gfunc, [-pi,pi], 0.0174533);
xfinal = rad2deg(xfinal);
disp('Fixed Point Method');
fprintf('Root: %f ,%f\nNumber of Iterations: %d\n\n', xfinal, fp_niter);

newton_derivative = '-25 * sin(theta) - 28 * cos(theta)';
newton_eqn = '25 * cos(theta) + 3.5 - 28 * sin(theta)';
[newton_root, newton_niter] = newton( newton_eqn, newton_derivative, 0, 0.0174533);
newton_root = rad2deg(newton_root);
disp('Newton Method');
fprintf('Root: %f\nNumber of Iterations: %d\n\n', newton_root, newton_niter);

disp('part C');
theta_1 = acos((-b*h + sqrt((b^2*h^2) + (h^2+w^2)*(w^2-b^2) ))/(h^2 + w^2));
theta_1 = rad2deg(theta_1);
fprintf('Exact Root: %f\n\n', theta_1);

disp('part D');
d2_approx = (h/(2 * sind(newton_root)));
c = b/tand(newton_root);
a = b/(tand(rad2deg(pi/2)-newton_root));
d1_approx = d2_approx - a - c;
fprintf('Approximate dimensions: \nd1: %f\nd2: %f\n\n', d1_approx, d2_approx);

d2_exact = (h/(2 * sind(theta_1)));
c = b/tand(theta_1);
a = b/(tand(rad2deg(pi/2)-theta_1));
d1_exact = d2_exact - a - c;
fprintf('Exact dimensions: \nd1: %f\nd2: %f\n', d1_exact, d2_exact);
r1 = abs((d1_exact-d1_approx)/d1_exact);r2 = abs((d2_exact-d2_approx)/d2_exact);
fprintf('relative error for d1: %f\nrelative error for d2: %f\nd1 and d2 are accurate within tolerance 0.1 inches\n', r1, r2);
end

