function [b, v] = linear_regression_l2(curr_set, l)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
len = length(curr_set(:,1));

X_in = curr_set(:,1);
X_in = [ones(len,1), X_in, X_in.^2];
Y_in = curr_set(:,2);

X_t = transpose(X_in);
X_t_X = X_t * X_in;
L_I = l * eye(3) * len;

X_t_X_LI_inv = pinv(X_t_X + L_I);
W_out = X_t_X_LI_inv * X_t * Y_in;

W_out = transpose(W_out);
% W_out = transpose( pinv( X_in' * X_in + (l * eye(3) * length(Y_in) ) ) * X_in' * Y_in );

Y = Predict_Y(W_out, X_in);
b = sum((Y_in - Y).^2)/100;
m = mean(Y);
v = sum((Y -m).^2)/100;
end

