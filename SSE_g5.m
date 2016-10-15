function [b, v] = SSE_g5(x, y)
%SSE_g2 Summary of this function goes here
%   Detailed explanation goes here
set_size = length(y);
x = [ones(set_size, 1), x, x.^2, x.^3];
mdl =  glmfit(x, y, 'normal', 'constant', 'off');
ypred = glmval(mdl, x, 'identity', 'constant', 'off');
b = sum((y - ypred).^2);
mean_ypred = mean(ypred);
v = sum( (ypred - mean_ypred).^2 );
b=b/set_size;
v=v/set_size;
end