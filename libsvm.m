
orig_test  = load('phishing-test.mat');
orig_train = load('phishing-train.mat');

orig_test_features = orig_test.features;
orig_test_label = orig_test.label;
orig_train_features = orig_train.features;
orig_train_label = orig_train.label;

processed_test = data_pre_process(orig_test_features);
processed_train = data_pre_process(orig_train_features);
%Train USING RBF
% %  model = svmtrain(heart_scale_label, heart_scale_inst, '-c 1 -g 0.07');
% % [predict_label, accuracy, dec_values] = svmpredict(heart_scale_label, heart_scale_inst, model); 
% test the training data


cmd = ['-t 2 -c ', num2str(16), ' -g ', num2str(0.062500) ];
model = libsvmtrain(double(orig_train_label'), double(processed_train) ,cmd);
[predict_label, accuracy, dec_values] = svmpredict(double(orig_test_label'), double(orig_test_features), model); 