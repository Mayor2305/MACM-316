% a)
t = [0 1 2 3 4];
x = [0.0 1.0 2.0 2.0 3.0];
y = [1.0 3.0 3.0 4.0 5.0];
xx = linspace(0, 4, 1000);
grid on
pp1 = spline(t, y);
St = ppval(pp1, xx);
pp2 = spline(t, x);
Rt = ppval(pp2, xx);
plot(x, y, 'ro', xx, Rt)
title 'x = R(t)'
xlabel('t')
ylabel('x')
legend ('Original Data','R(t)', 'location', 'best')
plot(x, y, 'ro', xx, St)
title 'y = S(t)'
xlabel('t')
ylabel('y')
legend ('Original Data','S(t)', 'location', 'best')
plot(x, y, 'ro', Rt, St)
title  'S(t) vs R(t)'
xlabel('R(t)')
ylabel('S(t)')
legend ('Original Data','S(t) vs R(t)', 'location', 'best')
% b)
x2 = [2.75 1.3 -0.25 0.0 0.25 -1.3 -2.5 -1.3 0.25 0.0 -0.25 1.3 2.75];
y2 = [-1.0 -0.75 0.8 2.0 0.8 -0.25 0.0 0.25 -1.3 -2.5 -1.3 -0.25 -1.0];
t2 = [-3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3];
xx2 = linspace(-3, 3, 1000);
pp3 = spline(t2, x2);
Rt2 = ppval(pp3, xx2)
pp4 = spline(t2, y2);
St2 = ppval(pp4, xx2)
plot(x2, y2, 'bo', xx, Rt2)
title  'x = R_2(t)'
xlabel('t')
ylabel('x')
legend ('Original Data','R_2(t)', 'location', 'best')
plot(x2, y2, 'bo', xx, St2)
title  'y = S_2(t)'
xlabel('t')
ylabel('y')
legend ('Original Data','S_2(t)', 'location', 'best')
plot(x2, y2, 'bo', Rt2, St2)
title  'R_2(t) vs S_2(t)'
xlabel('R_2(t)')
ylabel('S_2(t)')
legend ('Original Data','R_2(t) vs S_2(t)', 'location', 'best')
% c)
[ylist1] = perspline(t2, x2, 1);
[ylist2] = perspline(t2, y2, 1);
[ylist3] = perspline(ylist1, ylist2, 0);
% d)
%figure('position', get(0,'screensize')) % biggest window possible
%axes('position', [0 0 1 1]) % domain [0,1] x [0,1]
%axis square % x,y axes equal
%[x,y] = ginput; % record mouse clicks
%close % get rid of huge window
%save mydatafile.mat x y % save the data points
% I renamed the variables x and y to xd and yd in the variable editor
td = linspace(0, 1, length(xd))
[ylist1] = perspline(td, xd', 1);
[ylist2] = perspline(td, yd', 1);
[ylist3] = perspline(ylist1, ylist2, 0);




















