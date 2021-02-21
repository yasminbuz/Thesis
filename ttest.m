
%% compute timelocked average and compute covariance matrix 
% https://www.fieldtriptoolbox.org/tutorial/eventrelatedstatistics/

cfg =[];
cfg.channel = 'all';

[timelock]= ft_timelockanalysis(cfg, awake_preprocessed);

% calculate grand average for each condition
cfg = [];
cfg.channel   = 'all';
cfg.latency   = 'all';
cfg.parameter = 'avg';


grandavg_test  = ft_timelockgrandaverage(cfg, timelock);

%plot channels using multiplot 

cfg = [];
cfg.showlabels  = 'yes';
cfg.layout      = 'CTF151_helmet.png';
figure; ft_multiplotER(cfg, grandavg_test)

cfg = [];
cfg.channel = 'MLT12';

figure; ft_singleplotER(cfg, grandavg_test)


%% ANOVA testing 
%https://www.fieldtriptoolbox.org/workshop/madrid2019/tutorial_stats/


