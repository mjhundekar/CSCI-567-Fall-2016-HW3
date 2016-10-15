%Random Data Set Part a) Randomly generate 100 datasets. Each dataset
%contains 10 samples y= 2*x*x + e, e is gaussian noise (0,0.01)
a = -1;
b = 1;
func_names = ['G1'; 'G2'; 'G3'; 'G4'; 'G5'; 'G6'];
cell_Set_1 = cell(100,1);
for i = 1:100
    x = (b-a).*rand(10,1) + a;
    e = normrnd(0,0.01,10,1);
    y = 2*(x.^2) + e;
    cell_Set_1{i} =  [x,y];
end

%Part b

cell_Set_2 = cell(100,1);
for i = 1:100
    x = (b-a).*rand(100,1) + a;
    e = normrnd(0,0.01,100,1);
    y = 2*(x.^2) + e;
    cell_Set_2{i} = [x,y];
end


[b1,v1] = Bias_Variance_Trade_off(cell_Set_1);
[b2,v2] = Bias_Variance_Trade_off(cell_Set_2);

fprintf('\nThe Results of dataset size 100 with sample size 10');
fprintf('\nFunction\t\tBias\t\tVariance');
for i = 1:6
    fprintf('\n%s\t\t\t%10s\t\t%10s',func_names(i,:), num2str(b1(i)), num2str(v1(i)));
%     fprintf('\n%s\t\t\t%10f\t\t%10f',func_names(i,:), b1(i), v1(i));
end
fprintf('\n________________________________________________________________________\n')
fprintf('\nThe Results of dataset size 100 with sample size 100');
fprintf('\nFunction\t\tBias\t\tVariance');
for i = 1:6
    fprintf('\n%s\t\t\t%10s\t\t%10s',func_names(i,:), num2str(b2(i)), num2str(v2(i)));
%     fprintf('\n%s\t\t\t%10f\t\t%10f',func_names(i,:), b2(i), v2(i));
end
fprintf('\n________________________________________________________________________\n')
% part d
l = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1.0];
res_bias_d = [];
res_var_d = [];
res_d = ones(7,3);

for i = 1: length(l)
    set_bias = [];
    set_var = [];
    for j = 1:100
        curr_set = cell_Set_2{j};
        [b4, v4] = linear_regression_l2(curr_set, l(1,i));
        set_bias = [set_bias; b4];
        set_var = [set_var, v4];
    end
%     res_bias_d = [res_bias_d; l(i), sum(set_bias)/100];
%     res_var_d = [res_var_d; l(i), sum(set_var)/100 ];
    res_d(i,1) = l(i);
    res_d(i,2) = sum(set_bias)/100;
    res_d(i,3) = sum(set_var)/100;
end

% fprintf('\n________________________________________________________________________\n')
fprintf('\nThe Results of dataset size 100 with sample size 100 and Regularization');
fprintf('\nLamda\t\t\tBias\t\t\tVariance');
for i = 1:length(l)
    fprintf('\n%f\t\t%f\t\t%f',(res_d(i,1)), (res_d(i,2)), (res_d(i,3)));
%     fprintf('\n%f\t\t\t%f\t\t%f',num2str(l(i)), num2str(res_bias_d(i)), num2str(res_var_d(i)));
%     fprintf('\n%s\t\t\t%10f\t\t%10f',func_names(i,:), b2(i), v2(i));
end
fprintf('\n________________________________________________________________________\n')
