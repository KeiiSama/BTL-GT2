syms x y;

% Định nghĩa hàm số f(x, y)
f = y / (1 + x^2*y^2);

% Tính đạo hàm riêng của f theo x
fx = diff(f, x);

% Tính đạo hàm riêng của f theo y
fy = diff(f, y);

% Định nghĩa tập xác định
x_values = linspace(-5, 5, 100); % Ví dụ từ -5 đến 5

% Định nghĩa tập y tương ứng với mỗi giá trị của x
y_values = linspace(-5, 5, 100); % Ví dụ từ -5 đến 5

% Tính giá trị của hàm số f tại các điểm (x, y)
[X, Y] = meshgrid(x_values, y_values);
Z = double(subs(f, {x, y}, {X, Y}));

% Tính giá trị của đạo hàm riêng theo x tại các điểm (x, y)
FX = double(subs(fx, {x, y}, {X, Y}));

% Tính giá trị của đạo hàm riêng theo y tại các điểm (x, y)
FY = double(subs(fy, {x, y}, {X, Y}));

% Vẽ đồ thị f
figure;
surf(X, Y, Z);
title('Đồ thị của f(x, y)');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
colorbar;

% Vẽ đồ thị của đạo hàm riêng theo x
figure;
surf(X, Y, FX);
title('Đồ thị của đạo hàm riêng theo x');
xlabel('x');
ylabel('y');
zlabel('fx(x, y)');
colorbar;

% Vẽ đồ thị của đạo hàm riêng theo y
figure;
surf(X, Y, FY);
title('Đồ thị của đạo hàm riêng theo y');
xlabel('x');
ylabel('y');
zlabel('fy(x, y)');
colorbar;
