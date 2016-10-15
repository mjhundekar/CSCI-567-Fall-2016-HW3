function [ res_Bias, res_Var ] = Bias_Variance_Trade_off( ip_set )
%Bias_Variance_Trade_off Summary of this function goes here
%   Detailed explanation goes here

sample_size = length(ip_set{1});
set_size = 100;
res_Bias = [];
res_Var = [];
if sample_size == 10
    figure('Name','Mean-Squared-Error (a)');
else
    figure('Name','Mean-Squared-Error (b)');
end
%g1(x)
g1_Bias = [];
g1_Var = [];
for i=1:set_size
    curr_set = ip_set{i};
    % calculate bias and variance for current set
    [b, v] = SSE_g1(curr_set(:,1), curr_set(:,2));
    g1_Bias = [g1_Bias; b];
    g1_Var = [g1_Var, v];
end
res_Bias = [res_Bias; (sum(g1_Bias)/100)];
res_Var = [res_Var; (sum(g1_Var)/100)];
subplot(2,3,1)
histogram(g1_Bias);
title('MSE G1');
%#############################################################################################


%g2(x)
g2_Bias = [];
g2_Var = [];
for i=1:set_size
    curr_set = ip_set{i};
    % calculate bias and variance for current set
    [b, v] = SSE_g2(curr_set(:,1), curr_set(:,2));
    g2_Bias = [g2_Bias; b];
    g2_Var = [g2_Var, v];
end
res_Bias = [res_Bias; (sum(g2_Bias)/100)];
res_Var = [res_Var; (sum(g2_Var)/100)];
subplot(2,3,2)
histogram(g2_Bias);
title('MSE G2');
%#############################################################################################


%g3(x)
g3_Bias = [];
g3_Var = [];
for i=1:set_size
    curr_set = ip_set{i};
    % calculate bias and variance for current set
    [b, v] = SSE_g3(curr_set(:,1), curr_set(:,2));
    g3_Bias = [g3_Bias; b];
    g3_Var = [g3_Var, v];
end
res_Bias = [res_Bias; (sum(g3_Bias)/100)];
res_Var = [res_Var; (sum(g3_Var)/100)];
subplot(2,3,3)
histogram(g3_Bias);
title('MSE G3');
%#############################################################################################


%g4(x)
g4_Bias = [];
g4_Var = [];
for i=1:set_size
    curr_set = ip_set{i};
    % calculate bias and variance for current set
    [b, v] = SSE_g4(curr_set(:,1), curr_set(:,2));
    g4_Bias = [g4_Bias; b];
    g4_Var = [g4_Var, v];
end
res_Bias = [res_Bias; (sum(g4_Bias)/100)];
res_Var = [res_Var; (sum(g4_Var)/100)];
subplot(2,3,4)
histogram(g4_Bias);
title('MSE G4');
%#############################################################################################


%g5(x)
g5_Bias = [];
g5_Var = [];
for i=1:set_size
    curr_set = ip_set{i};
    % calculate bias and variance for current set
    [b, v] = SSE_g5(curr_set(:,1), curr_set(:,2));
    g5_Bias = [g5_Bias; b];
    g5_Var = [g5_Var, v];
end
res_Bias = [res_Bias; (sum(g5_Bias)/100)];
res_Var = [res_Var; (sum(g5_Var)/100)];
subplot(2,3,5)
histogram(g5_Bias);
title('MSE G5');
%#############################################################################################


%g6(x)
g6_Bias = [];
g6_Var = [];
for i=1:set_size
    curr_set = ip_set{i};
    % calculate bias and variance for current set
    [b, v] = SSE_g6(curr_set(:,1), curr_set(:,2));
    g6_Bias = [g6_Bias; b];
    g6_Var = [g6_Var, v];
end
res_Bias = [res_Bias; (sum(g6_Bias)/100)];
res_Var = [res_Var; (sum(g6_Var)/100)];
subplot(2,3,6)
histogram(g6_Bias);
title('MSE G6');
%#############################################################################################