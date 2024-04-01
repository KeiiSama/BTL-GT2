% Định nghĩa hàm f(x, y)
syms x y h;
f = @(x, y) (y .* x.^3 - x .* y.^3) ./ (x.^2 + y.^2);

% Xác định fx(x, y) và fy(x, y) khi (x, y) != (0, 0)
f_x = diff(f, x);
f_y = diff(f, y);

% Hiển thị kết quả
disp('f_x = ');
disp(f_x);

disp('f_y = ');
disp(f_y);

% Tìm fx(0, 0) và fy(0, 0)
% Do f(0, 0) không thực hiện được nên ta đặt f(0, 0) = 0
f_at_0_0 = 0;

% Ta có
f_x = limit((f(x + h, y) - f(x, y)) / h, h, 0);
f_y = limit((f(x, y + h) - f(x, y)) / h, h, 0);

h = 1e-6;
fx_at_0_0 = (f(h, 0) - f_at_0_0) / h;
fy_at_0_0 = (f(0, h) - f_at_0_0) / h;

disp('f_x(0, 0) = ')
disp(fx_at_0_0);
disp('f_y(0, 0) = ')
disp(fy_at_0_0);

% Vẽ đồ thị f(x, y)

[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);

z = f(x, y);

surf(x, y, z);
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Đồ thị của hàm f(x, y)');