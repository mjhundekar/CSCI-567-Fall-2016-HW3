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
