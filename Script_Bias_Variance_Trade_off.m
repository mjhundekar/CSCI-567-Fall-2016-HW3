%Random Data Set Part a) Randomly generate 100 datasets. Each dataset
%contains 10 samples y= 2*x*x + e, e is gaussian noise (0,0.01)
a = -1;
b = 1;
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


% part d
l = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1.0];
res_bias_d = [];
res_var_d = [];

for i = 1: length(l)
    set_bias = [];
    set_var = [];
    for j = 1:100
        curr_set = cell_Set_2{j};
        [b4, v4] = linear_regression_l2(curr_set, l(1,i));
        set_bias = [set_bias; b4];
        set_var = [set_var, v4];
    end
    res_bias_d = [res_bias_d; l(i), sum(set_bias)/100];
    res_var_d = [res_var_d; l(i), sum(set_var)/100 ];
end
