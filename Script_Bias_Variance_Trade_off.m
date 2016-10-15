% a = 50;
% b = 100;
% r = (b-a).*rand(1000,1) + a;

%Random Data Set Part a) Randomly generate 100 datasets. Each dataset
%contains 10 samples y= 2*x*x + e, e is gaussian noise (0,0.01)
a = -1;
b = 1;
% set1_x = [];
% set1_y = [];
cell_Set_1 = cell(100,1);
for i = 1:100
    x = (b-a).*rand(10,1) + a;
    e = normrnd(0,0.01,10,1);
    y = 2*(x.^2) + e;
    cell_Set_1{i} =  [x,y];
%     set1_x(i,:) = x'; %each row is 1 set of x
%     set1_y(i,:) = y';
end

%Part b
% set2_x = [];
% set2_y = [];
cell_Set_2 = cell(100,1);
for i = 1:100
    x = (b-a).*rand(100,1) + a;
    e = normrnd(0,0.01,100,1);
    y = 2*(x.^2) + e;
    cell_Set_2{i} = [x,y];
%     set2_x(i,:) = x'; %each row is 1 set of x
%     set2_y(i,:) = y';
end


[b1,v1] = Bias_Variance_Trade_off(cell_Set_1);
[b2,v2] = Bias_Variance_Trade_off(cell_Set_2);


% part d
l = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1.0];
