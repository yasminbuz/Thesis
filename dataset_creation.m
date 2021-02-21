
% Create time windows for each state 
a = awake_preprocessed.trial{1, 1}(1:8, 380000:400000); 
b = light_preprocessed.trial{1, 1} (1:8, 980000:1000000);
c = medium_preprocessed.trial{1, 1}  (1:8, 1300000:1500000);
d = deep_preprocessed.trial{1, 1}  (1:8, 1700000:1900000);

%add label to awake state 
a2 = zeros(size(a,1),1);
a3= [a a2];

%add label to light anaesthesia state   
b2 = ones(size(a,1),1);
b3 = [b b2];

%add label to general anaesthesia state 
c(1:8, 20002)= 2;

%add label to deep anaesthesia state 
d(1:8, 20002)= 3;

%Concatenate all states into one final dataset for training and test 
data_train2 = [a3;b3;c;d];

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Create time windows for each state 
a = awake_preprocessed.trial{1, 1}(1:8, 380000:390000); 
b = light_preprocessed.trial{1, 1} (1:8, 130000:140000);
c = medium_preprocessed.trial{1, 1}  (1:8, 130000:140000);
d = deep_preprocessed.trial{1, 1}  (1:8, 130000:140000);

%add label to awake state 
a2 = zeros(size(a,1),1);
a3= [a a2];

%add label to light anaesthesia state   
b2 = ones(size(a,1),1);
b3 = [b b2];

%add label to general anaesthesia state 
c(1:8, 10002)= 2;

%add label to deep anaesthesia state 
d(1:8, 10002)= 3;

%Concatenate all states into one final dataset for training and test 
data_train3 = [a3;b3;c;d];
data_train4_1= [a3;b3]



