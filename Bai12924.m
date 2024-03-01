syms x y;
f = sqrt(4 - x^2 - 4*y^2);

f_x = diff(f, x); 
f_y = diff(f, y);

x_val = 1;
y_val = 0;

slope_x = double(subs(f_x, [x, y], [x_val, y_val]));
slope_y = double(subs(f_y, [x, y], [x_val, y_val]));

fprintf('fx(1, 0) = %f\n', slope_x);
fprintf('fy(1, 0) = %f\n', slope_y);

[X, Y] = meshgrid(-2:0.1:2);
Z = sqrt(4 - X.^2 - 4*Y.^2);

figure;
surf(X, Y, real(Z));

hold on;

xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Function f(x, y) = sqrt(4 - x^2 - 4y^2) and its Tangents at (1, 0)');

x1 = x_val;
y1 = sqrt(4 - x1^2 - 4*y_val^2);
x_range = linspace(x1 - 1, x1 + 1, 100);
y_x_tangent = slope_x*(x_range - x1) + y1;

y_range = linspace(y1 - 3, y1 - 1, 100);
x_y_tangent = slope_y*(y_range - y1) + x1;

scatter3(x_val, y_val, sqrt(4 - x_val^2 - 4*y_val^2), 50, 'r', 'filled');

plot3(x_range, ones(size(x_range))*y_val, slope_x*(x_range - x_val) + sqrt(4 - x_val^2 - 4*y_val^2), 'r', 'LineWidth', 2);
plot3(ones(size(y_range))*x_val, y_range, slope_y*(y_range - y_val) + sqrt(4 - x_val^2 - 4*y_val^2), 'g', 'LineWidth', 2);

hold off;
