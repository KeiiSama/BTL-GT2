syms x y;

% Định nghĩa hàm số f(x, y)
f = x^2 * y^3;

% Tính đạo hàm riêng theo biến x (fx)
fx = diff(f, x);

% Tính đạo hàm riêng theo biến y (fy)
fy = diff(f, y);

% In ra đạo hàm riêng fx và fy
disp(['f_x = ', char(fx)]);
disp(['f_y = ', char(fy)]);

% Vẽ đồ thị của hàm số f(x, y), fx, fy
[X, Y] = meshgrid(-2:0.1:2, -2:0.1:2);
F = X.^2 .* Y.^3;
Fx = 2*X.*Y.^3;
Fy = 3*X.^2.*Y.^2;

figure;
subplot(1, 3, 1);
surf(X, Y, F);
title('f(x, y)');
xlabel('x');
ylabel('y');
zlabel('f');

subplot(1, 3, 2);
surf(X, Y, Fx);
title('f_x');
xlabel('x');
ylabel('y');
zlabel('f_x');

subplot(1, 3, 3);
surf(X, Y, Fy);
title('f_y');
xlabel('x');
ylabel('y');
zlabel('f_y');
