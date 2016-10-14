function [ processed_features ] = data_pre_process( features )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
count = 0;
mod_feature = [];
for i=1:length(features(1,:))
    C = unique(features(:,i));
    new_features = features(:,i);
    if length(C) == 3 % split current column into 3 columns
        count = count + 1;
%         i
        % set -1, 0 to 0 and 1 as 1
        curr_col = features(:,i);
        curr_col(curr_col == -1) = 0;
        curr_col_1 = curr_col;
        % set 1, -1 to 0 and 0 to 1
        curr_col = features(:,i);
        curr_col(curr_col == -1) = 2;
        curr_col(curr_col == 1) = 2;
        curr_col(curr_col == 0) = 1;
        curr_col(curr_col == 2) = 0;
        curr_col_0 = curr_col;
        
        % set 1, 0 to 0 and -1 to 1
        curr_col = features(:,i);
        curr_col(curr_col == 1) = 0;
        curr_col(curr_col == -1) = 1;
        curr_col_m1 = curr_col;
        % remove current row and append the 3 new ones at the end
        %features(:,i) = [];
        new_features = [];
        new_features = [new_features, curr_col_0, curr_col_1, curr_col_m1];
        mod_feature = [mod_feature, new_features];
        continue
    end
    
    if length(C) == 2
        if isequal(C, [1, -1]) || isequal(C, [-1, 1])
            curr_col = features(:,i);
            curr_col(curr_col == -1) = 0;
            new_features = curr_col;
            
        else if isequal(C, [-1, 0]) || isequal(C, [0, -1])
                curr_col = features(:,i);
                curr_col(curr_col == 0) = 1;
                curr_col(curr_col == -1) = 0;
                new_features = curr_col;
            end
        end
        mod_feature = [mod_feature, new_features];
        continue
    else
        mod_feature = [mod_feature, new_features];
        
    end



end
% count
processed_features = mod_feature;   
end



