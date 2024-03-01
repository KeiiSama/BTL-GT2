
syms x y;
f = 16 - 4*x^2 - y^2;

f_x = diff(f, x); 
f_y = diff(f, y);

x_val = 1;
y_val = 2;

slope_x = double(subs(f_x, [x, y], [x_val, y_val]));
slope_y = double(subs(f_y, [x, y], [x_val, y_val]));

fprintf('fx(1, 2) = %f\n', slope_x);
fprintf('fy(1, 2) = %f\n', slope_y);

% Vẽ đồ thị hàm số và tiếp tuyến
[X, Y] = meshgrid(-5:0.1:5);
Z = 16 - 4*X.^2 - Y.^2;

figure;
surf(X, Y, Z);

hold on;

% Đánh dấu điểm (1, 2, 8) bằng màu đỏ
scatter3(x_val, y_val, 16 - 4*x_val^2 - y_val^2, 50, 'r', 'filled');

% Tiêu đề và tên các trục tọa độ
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Function f(x, y) = 16 - 4x^2 - y^2 and its Tangents at (1, 2)');

% Định nghĩa phương trình của các đường tiếp tuyến
% Đường tiếp tuyến theo hướng x:
% y - y1 = m(x - x1) => y = m*(x - x1) + y1
x1 = x_val;
y1 = 16 - 4*x1^2 - y_val^2;
x_range = linspace(x1 - 2, x1 + 2, 100); % Tạo 100 điểm x trong khoảng x1 - 2 đến x1 + 2
y_x_tangent = slope_x*(x_range - x1) + y1; % Tính giá trị y tương ứng

% Đường tiếp tuyến theo hướng y:
% x - x1 = m(y - y1) => x = m*(y - y1) + x1
y_range = linspace(y1 - 8, y1 - 4, 100); % Tạo 100 điểm y trong khoảng y1 - 8 đến y1 - 4
x_y_tangent = slope_y*(y_range - y1) + x1; % Tính giá trị x tương ứng

% Vẽ đường tiếp tuyến
plot3(x_range, ones(size(x_range))*y_val, slope_x*(x_range - x_val) + 16 - 4*x_val^2 - y_val^2, 'r', 'LineWidth', 2); % Đường tiếp tuyến theo hướng x
plot3(ones(size(y_range))*x_val, y_range, slope_y*(y_range - y_val) + 16 - 4*x_val^2 - y_val^2, 'g', 'LineWidth', 2); % Đường tiếp tuyến theo hướng y

hold off;