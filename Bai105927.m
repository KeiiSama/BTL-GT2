% Định nghĩa hàm f(x, y)
f = @(x, y) (y .* x.^3 - x .* y.^3) ./ (x.^2 + y.^2);

% Tạo ma trận tọa độ x và y
[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);

% Tính giá trị của hàm f(x, y)
z = f(x, y);

% Vẽ đồ thị
surf(x, y, z);
title('Đồ thị của hàm f(x, y)');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
