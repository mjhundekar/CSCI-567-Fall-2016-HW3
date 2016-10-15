function [b, v] = SSE_g1(x, y)
%SSE_g1 Summary of this function goes here
%   Detailed explanation goes here
set_size = length(y);
w = 1;
b = 0;
b = sum((y - w).^2);
v=0;
b=b/set_size;
v=v/set_size;

end

