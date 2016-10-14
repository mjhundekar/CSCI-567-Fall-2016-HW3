% labels = double(rand(10,1)>0.5);
% data = rand(10,5);
% model = svmtrain(labels, data, '-s 0 -t 2 -c 1 -g 0.1')

orig_test  = load('phishing-test.mat');
orig_train = load('phishing-train.mat');

orig_test_features = orig_test.features;
orig_test_label = orig_test.label;
orig_train_features = orig_train.features;
orig_train_label = orig_train.label;

processed_test = data_pre_process(orig_test_features);
processed_train = data_pre_process(orig_train_features);
% length(orig_test_features(1,:));
% unq_elem = [];

%Use linear SVM in LIBSVM
Res_linear_svm = [];
C = ones(1,9);
for i=1:9
    C(i) = C(i)* (4^(i-7));
end
t = 0;
Max = -inf;
C_Max = -inf;
for i=1:9
    cmd = ['-t 0 -v 3 -q -c ', num2str(C(i))];
    fprintf('C = %f\n',C(i));
    tic
    M = libsvmtrain(double(orig_train_label'), double(processed_train) ,cmd);
    stop = toc;
    t = t + stop;
    if M > Max
        Max = M;
        C_Max = C(i);
        
    end
    Res_linear_svm = [Res_linear_svm; C(i), M, stop];
    fprintf('________________________________________________________________________\n')
end
fprintf('Average Time = %f\n', t/9);
fprintf('Best Accuracy = %f is obtained with C = %f\n\n',Max, C_Max);

fprintf('________________________________________________________________________\n')
fprintf('________________________________________________________________________\n')

% % Kernel SVM in LIBSVM
% % Polynomial kernel
% % Average Time = 1.238126
% % Best Accuracy = 96.400000 is obtained with C = 64.000000 and Degree = 3.000000
Res_poly_kernel = [];
Max = -inf;
C_Max = -inf;
d_max = -inf;
C = ones(1,11);
d = [1,2,3];
for i=1:11
    C(i) = C(i)* (4^(i-4));
end

for i=1:11
    for j=1:3
        cmd = ['-v 3 -t 1 -q -c ', num2str(C(i)), ' -d ', num2str(d(j)) ];
        fprintf('C = %f\n',C(i));
        fprintf('Degree = %f\n',d(j));
        tic
        M = libsvmtrain(double(orig_train_label'), double(processed_train) ,cmd);
        stop = toc;
        t = t + stop;
        if M > Max
            Max = M;
            C_Max = C(i);
            d_max = d(j);
        end
        Res_poly_kernel = [Res_poly_kernel; C(i), d(j), M, stop];
        fprintf('________________________________________________________________________\n')
    end
end
fprintf('Average Time = %f\n', t/33);
fprintf('Best Accuracy = %f is obtained with C = %f and Degree = %f\n\n',Max, C_Max, d_max);

fprintf('________________________________________________________________________\n')
fprintf('________________________________________________________________________\n')

% % Kernel SVM in LIBSVM
% % RBF kernel
% % Average Time = 2.769768
% % Best Accuracy = 96.900000 is obtained with C = 16.000000 and Gamma = 0.062500
Res_rbf_kernel = [];
Max = -inf;
C_Max = -inf;
gamma_max = -inf;
C = ones(1,11);
gamma = ones(1,7);
for i=1:11
    C(i) = C(i)* (4^(i-4));
    if i<8
        gamma(i) = gamma(i)* (4^(i-8));
    end
end

for i=1:11
    for j=1:7
        cmd = ['-v 3 -t 2 -q -c ', num2str(C(i)), ' -g ', num2str(gamma(j)) ];
        fprintf('C = %f\n',C(i));
        fprintf('Gamma = %f\n',gamma(j));
        tic
        M = libsvmtrain(double(orig_train_label'), double(processed_train) ,cmd);
        stop = toc;
        t = t + stop;
        if M > Max
            Max = M;
            C_Max = C(i);
            gamma_max = gamma(j);
        end
        fprintf('________________________________________________________________________\n')
        Res_rbf_kernel = [Res_rbf_kernel; C(i), gamma(j), stop];
    end
end
fprintf('Average Time = %f\n', t/33);
fprintf('Best Accuracy = %f is obtained with C = %f and Gamma = %f\n\n',Max, C_Max, gamma_max);

%Train USING RBF
% %  model = svmtrain(heart_scale_label, heart_scale_inst, '-c 1 -g 0.07');
% % [predict_label, accuracy, dec_values] = svmpredict(heart_scale_label, heart_scale_inst, model); 
% test the training data


cmd = ['-t 2 -c ', num2str(16), ' -g ', num2str(0.062500) ];
model = libsvmtrain(double(orig_train_label'), double(processed_train) ,cmd);
[predict_label, accuracy, dec_values] = svmpredict(double(orig_test_label'), double(orig_test_features), model); 