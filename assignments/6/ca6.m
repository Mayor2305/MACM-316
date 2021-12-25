function ca6()
% Part a
x = [0.0 1.0 2.0 2.0 3.0];
y = [0.0 3.0 3.0 4.0 5.0];
t = 0 : 1 : 4;
points = linspace(0, 4, 10000);

pp_y = spline (t, x);
pp_x = spline (t, y);
R_T = ppval(pp_y, points);
S_T = ppval(pp_x, points);

plot(x, y, 'bd', points, R_T, 'r' , 'LineWidth', 1.5);
legend ('Data Points','R(t)');
title 'x = R(t)';
xlabel('t');
ylabel('R(t)');
print -djpeg 'PartA-1.jpg';

plot(x, y, 'bd', points, S_T, 'r' , 'LineWidth', 1.5);
title 'y = S(t)';
xlabel('t');
ylabel('y');
legend ('Data Points','S(t)')
print -djpeg 'PartA-2.jpg'

plot(x, y, 'bd', R_T, S_T, 'r' , 'LineWidth', 1.5);
legend ('Data Points','S(t) vs R(t)');
title  'S(t) vs R(t)';
xlabel('R(t)');
ylabel('S(t)');
print -djpeg 'PartA-3.jpg';

%part - b
x = [2.75 1.3 -0.25 0.0 0.25 -1.3 -2.5 -1.3 0.25 0.0 -0.25 1.3 2.75];
y = [-1.0 -0.75 0.8 2.0 0.8 -0.25 0.0 0.25 -1.3 -2.5 -1.3 -0.25 -1.0];
t = -3 : 0.5 : 3;
points = linspace(-3, 3, 10000);

pp_y = spline (t, x);
pp_x = spline (t, y);
R_T = ppval(pp_y, points);
S_T = ppval(pp_x, points);


plot(x, y, 'Kd', R_T, S_T, 'r' , 'LineWidth', 1.5);
legend ('Data Points','R(t)')
title 'x = R(t)';
xlabel('t');
ylabel('R(t)');
print -djpeg 'PartB.jpg'

%part - C

[list_A] = perspline(t, x);
[list_B] = perspline(t, y);
[list_C] = perspline(list_A, list_B);

%part -D

figure('position', get(0,'screensize')) % largest window possible
axes('position', [0 0 1 1])
axis square % display your drawing on-screen
[x,y] = ginput; % record mouse clicks until ’Enter’
close % get rid of huge window
save mydatafile.mat x y
t = linspace(0 , 1, length(x));

[list_A] = perspline(t, x');
[list_B] = perspline(t, y');
[list_C] = perspline(list_A, list_B);

hold on; plot(x, y, 'rd', 'LineWidth',3); hold off;


end