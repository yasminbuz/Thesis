addpath ('/Users/yasminbuzari/Desktop/EEG Code- Data and PowerSpectrum/fieldtrip-20201203')
%%%%%%%%%%%%%%%%%% EPOCH 1: Awake *****************************************


x = data (1500000:2000000, 1:4); %taking first four channels 
y = data (1500000:2000000, 116:119); % taking all bipolars 

xy = [x y]';
writematrix(xy,'deep.csv')

%% creating data structure 
awake_raw = [];
awake_raw.label = {'FEF';'vlPFC';'PPC';'STG';'RAntThal all Bipolars';'RPostThal all Bipolars';'LAntThal all Bipolars';'LPostThal all Bipolars'};
awake_raw.trial = {xy};
awake_raw.fsample = 1000;
awake_raw.time = {[1500.0:0.001:2000]};
awake_raw.sampleinfo   = [1500000,2000000];

%% cfgs for all three epochs
cfg                = [];
cfg.hpfilter       = 'yes';        % enable high-pass filtering
cfg.lpfilter       = 'yes';        % enable low-pass filtering
cfg.hpfreq         = 4;           % set up the frequency for high-pass filter
cfg.lpfreq         = 50;          % set up the frequency for low-pass filter
cfg.dftfilter      = 'yes';        % enable notch filtering to eliminate power line noise
cfg.dftfreq        = [60 120 180]; % notch filtering
cfg.baselinewindow = [-inf 0];     % define the baseline window
cfg.demean         = 'yes';        % remove mean
cfg.channel        = {'FEF';'vlPFC';'PPC';'STG';'RAntThal all Bipolars';'RPostThal all Bipolars';'LAntThal all Bipolars';'LPostThal all Bipolars'};



%% 
deep_preprocessed = ft_preprocessing(cfg,awake_raw);

%%plots 
figure %%
subplot(311)
plot(awake_raw.trial{1,1}(1,1:200))
title('FEF')

subplot(312)
plot(awake_raw.trial{1,1}(2,1:200))
title('vlPFC')

subplot(313)
plot(awake_raw.trial{1,1}(3,1:200))
title('PPC')

suptitle('Awake Raw')

figure
subplot(311) %% plotting cleaned data of channels 1,2,3 for awake_preprocessed
plot(awake_preprocessed.trial{1,1}(1,1:200))
title('FEF')
subplot(312)
plot(awake_preprocessed.trial{1,1}(2,1:200))
title('vlPFC')
subplot(313)
plot(awake_preprocessed.trial{1,1}(3,1:200))
title('PPC')
suptitle('Awake Pre-Processed')
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%% EPOCH 2: Light Anaesthesia ********************************


x1 = data (950000:1100000, 1:4); %taking first four channels 
y1= data (950000:1100000, 116:119); % taking all bipolars 

xy1 = [x1 y1]';

writematrix(xy1,'light.csv')

%% creating data structure 
light_raw = [];
light_raw.label = {'FEF';'vlPFC';'PPC';'STG';'RAntThal all Bipolars';'RPostThal all Bipolars';'LAntThal all Bipolars';'LPostThal all Bipolars'};
light_raw.trial = {xy1};
light_raw.fsample = 1000;
light_raw.time = {[950.0:0.001:1100]};
light_raw.sampleinfo   = [950000,1100000];

%% cfgs for all three epochs
cfg                = [];
cfg.hpfilter       = 'yes';       
cfg.lpfilter       = 'yes';        
cfg.hpfreq         = 4;           
cfg.lpfreq         = 50;         
cfg.dftfilter      = 'yes';       
cfg.dftfreq        = [60 120 180]; 
cfg.baselinewindow = [-inf 0];     
cfg.demean         = 'yes';       
cfg.channel        = {'FEF';'vlPFC';'PPC';'STG';'RAntThal all Bipolars';'RPostThal all Bipolars';'LAntThal all Bipolars';'LPostThal all Bipolars'};



%% 
light_preprocessed = ft_preprocessing(cfg,light_raw);

%%plots 
figure %% Plotting raw data of channles 1,2,3 for awake_raw
subplot(311)
plot(light_raw.trial{1,1}(1,1:200))
title('FEF')
subplot(312)
plot(light_raw.trial{1,1}(2,1:200))
title('vlPFC')

subplot(313)
plot(light_raw.trial{1,1}(3,1:200))
title('PPC')

suptitle('Light Anaesthesia Raw')

figure
subplot(311) %% plotting cleaned data of channels 1,2,3 for awake_preprocessed
plot(light_preprocessed.trial{1,1}(1,1:200))
title('FEF')
subplot(312)
plot(light_preprocessed.trial{1,1}(2,1:200))
title('vlPFC')
subplot(313)
plot(light_preprocessed.trial{1,1}(3,1:200))
title('PPC')
suptitle('Light Anaesthesia Pre-Processed')

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% EPOCH 3: Medium Anaesthesia ********************************


x2 = data (1200000:1400000, 1:4); %taking first four channels 
y2= data (1200000:1400000, 116:119); % taking all bipolars 

xy2 = [x2 y2]';
writematrix(xy2,'medium.csv')

%% creating data structure 
medium_raw = [];
medium_raw.label = {'FEF';'vlPFC';'PPC';'STG';'RAntThal all Bipolars';'RPostThal all Bipolars';'LAntThal all Bipolars';'LPostThal all Bipolars'};
medium_raw.trial = {xy2};
medium_raw.fsample = 1000;
medium_raw.time = {[1200.0:0.001:1400]};
medium_raw.sampleinfo   = [1200000,1400000];

%% cfgs for all three epochs
cfg                = [];
cfg.hpfilter       = 'yes';      
cfg.lpfilter       = 'yes';       
cfg.hpfreq         = 4;           
cfg.lpfreq         = 50;          
cfg.dftfilter      = 'yes';        
cfg.dftfreq        = [60 120 180];
cfg.baselinewindow = [-inf 0];     
cfg.demean         = 'yes';       
cfg.channel        = {'FEF';'vlPFC';'PPC';'STG';'RAntThal all Bipolars';'RPostThal all Bipolars';'LAntThal all Bipolars';'LPostThal all Bipolars'};
%cfg.method         = 'trial';


%% 
medium_preprocessed = ft_preprocessing(cfg,medium_raw);

%%plots 
figure %% Plotting raw data of channles 1,2,3 for awake_raw
subplot(311)
plot(medium_raw.trial{1,1}(1,1:200))
title('FEF')
subplot(312)
plot(medium_raw.trial{1,1}(2,1:200))
title('vlPFC')
subplot(313)
plot(medium_raw.trial{1,1}(3,1:200))
title('PPC')
suptitle('General Anaesthesia Raw')

figure
subplot(311) %% plotting cleaned data of channels 1,2,3 for awake_preprocessed
plot(medium_preprocessed.trial{1,1}(1,1:200))
title('FEF')
subplot(312)
plot(medium_preprocessed.trial{1,1}(2,1:200))
title('vlPFC')
subplot(313)
plot(medium_preprocessed.trial{1,1}(3,1:200))
title('PPC')
suptitle('General Anaesthesia Pre-Processed')

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% EPOCH 4: Deep Anaesthesia ********************************


x3 = data (1500000:2000000, 1:4); %taking first four channels 
y3= data (1500000:2000000, 116:119); % taking all bipolars 

xy3 = [x3 y3]';
writematrix(xy3,'deep.csv')

%% creating data structure 
deep_raw = [];
deep_raw.label = {'FEF';'vlPFC';'PPC';'STG';'RAntThal all Bipolars';'RPostThal all Bipolars';'LAntThal all Bipolars';'LPostThal all Bipolars'};
deep_raw.trial = {xy3};
deep_raw.fsample = 1000;
deep_raw.time = {[1500.0:0.001:2000]};
deep_raw.sampleinfo   = [1500000,2000000];

%% cfgs for all three epochs
cfg                = [];
cfg.hpfilter       = 'yes';       
cfg.lpfilter       = 'yes';       
cfg.hpfreq         = 4;          
cfg.lpfreq         = 50;         
cfg.dftfilter      = 'yes';        
cfg.dftfreq        = [60 120 180]; 
cfg.baselinewindow = [-inf 0];     
cfg.demean         = 'yes';        
cfg.channel        = {'FEF';'vlPFC';'PPC';'STG';'RAntThal all Bipolars';'RPostThal all Bipolars';'LAntThal all Bipolars';'LPostThal all Bipolars'};


%% 
deep_preprocessed = ft_preprocessing(cfg,deep_raw);

%%plots 
figure %% Plotting raw data of channles 1,2,3 for awake_raw
subplot(311)
plot(deep_raw.trial{1,1}(1,1:200))
title('FEF')
subplot(312)
plot(deep_raw.trial{1,1}(2,1:200))
title('vlPFC')
subplot(313)
plot(deep_raw.trial{1,1}(3,1:200))
title('PPC')
suptitle('Deep Anaesthesia Raw')

figure
subplot(311) %% plotting cleaned data of channels 1,2,3 for awake_preprocessed
plot(deep_preprocessed.trial{1,1}(1,1:200))
title('FEF')
subplot(312)
plot(deep_preprocessed.trial{1,1}(2,1:200))
title('vlPFC')
subplot(313)
plot(deep_preprocessed.trial{1,1}(3,1:200))
title('PPC')
suptitle('Deep Anaesthesia Pre-Processed')



%cfg = [];
%cfg.viewmode = 'vertical';
%ft_databrowser(cfg, deep_preprocessed)

