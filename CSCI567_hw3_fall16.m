labels = double(rand(10,1)>0.5);
data = rand(10,5);
model = svmtrain(labels, data, '-s 0 -t 2 -c 1 -g 0.1')