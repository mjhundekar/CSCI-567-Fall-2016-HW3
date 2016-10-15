function [b, v] = SSE_g2(x, y)
%SSE_g2 Summary of this function goes here
%   Detailed explanation goes here
set_size = length(y);
w0 = ones(set_size, 1);
mdl =  glmfit(w0, y, 'normal', 'constant', 'off');
ypred = glmval(mdl, w0, 'identity', 'constant', 'off');
b = sum((y - ypred).^2);
mean_ypred = mean(ypred);
v = sum( (ypred - mean_ypred).^2 );
b=b/set_size;
v=v/set_size;
end

