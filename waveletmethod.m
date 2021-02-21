addpath ('/Users/yasminbuzari/Desktop/Fieldtrip Tutorials /fieldtrip-20201203')

%Documentation: https://www.fieldtriptoolbox.org/tutorial/timefrequencyanalysis/
load ('deep_clean.mat');

cfg = [];
cfg.channel    = 'all';
cfg.method     = 'wavelet';
cfg.width      = 30; % determines width of wavelet in number of cycles 
cfg.output     = 'pow';
cfg.foi        = 2:1:45; % 
cfg.toi        = 1500:0.5:2000;
cfg.keeptrials   = 'yes';
cfg.pad          = 'nextpow2';

TFRwave = ft_freqanalysis(cfg, deep_preprocessed);

figure;
ft_singleplotTFR(cfg, TFRwave);
title('Deep Anaesthesia State Wavelet Transformation ');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');

%%%%%%%%%%%%%%%%%%%%%%

cfg = [];
cfg.vartrllength  = 1;  % the default is NOT to allow variable length trials
cfg.covariance = 'yes';
timelock_planar   = ft_timelockanalysis(cfg, awake_preprocessed);

% Visual exploration frequency of timelock analysis 
% Here we can see where the data becomes noisy 
figure (1)
plot(timelock_planar.time, timelock_planar.avg);
grid on

%%%%%%%%%%%%



%% 

cfg = [];
cfg.channel    = 'all';
cfg.method     = 'wavelet';
cfg.width      = 2; % determines width of wavelet in number of cycles 
cfg.output     = 'pow';
cfg.foi        = 2:1:45; % applies analysis to 2 - 45 hz in steps of 1hz
cfg.toi        = 400:0.5:801; 
cfg.keeptrials   = 'yes';
cfg.pad          = 'nextpow2';

TFRwave = ft_freqanalysis(cfg, awake_preprocessed);



%% morlet wavelets 
% plotting continous data : https://www.fieldtriptoolbox.org/faq/how_can_i_do_time-frequency_analysis_on_continuous_data/
% resample trial

cfg = [];
cfg.resamplefs  = 250; % downsample from 1000 to 250 Hz
cfg.demean      = 'no';
cfg.detrend     = 'no';
resampled = ft_resampledata(cfg, awake_preprocessed);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Hanning taper with fixed window length 

cfg = [];
cfg.layout        = 'neuromag306cmb.lay';
cfg.baselinetype  = 'relchange';
cfg.baseline      = [-inf 0];
cfg.renderer      = 'painters'; % the default is OpenGL, which is faster, but it gives visual artifacts on some computers
cfg.colorbar      = 'yes';
figure
ft_multiplotTFR(cfg, awake_powerspec1);

cfg = [];
cfg.trials = 'all'
cfg.length = 300;
cfg.overlap = 0;
awake_trial_wavelet = ft_redefinetrial(cfg,awake_preprocessed)

cfg = [];
cfg.channel    = 'all';
cfg.method     = 'wavelet';
cfg.width      = 2; % determines width of wavelet in number of cycles 
cfg.output     = 'pow';
cfg.foi        = 2:1:45; % applies analysis to 2 - 45 hz in steps of 1hz
cfg.toi        = 400:0.5:801; 
cfg.keeptrials   = 'yes';
cfg.pad          = 'nextpow2';

TFRwave = ft_freqanalysis(cfg, awake_trial_wavelet);
% plot wavelets

cfg = [];
%cfg.baseline     = [-0.5 -0.1];
%cfg.baselinetype = 'absolute';
%cfg.zlim         = [-2e-25 2e-25];
cfg.showlabels   = 'yes';
cfg.layout       = 'CTF151_helmet.mat';
cfg.colorbar     = 'yes';
figure
ft_multiplotTFR(cfg, TFRwave)


%%

cfg            = [];
cfg.output     = 'pow';
cfg.channel    = 'all';
cfg.method     = 'wavelet';
cfg.width      = 15;
cfg.toi        = 820: 70 : 1200; % this worked with cleandata1 from yazpreprocess
%this worked well with cleandataepoch1:  cfg.toi        = 420: 70 : 800;
cfg.foi        = 4:30;

wave_let1      = ft_freqanalysis(cfg, cleandata1);

%% visualize wavelet

cfg          = [];
cfg.colorbar = 'yes';
cfg.zlim     = 'maxabs';
cfg.layout   = 'natmeg_customized_eeg1005.lay';


figure;
ft_singleplotTFR(cfg, wave_let1);
title('viz');


%% re sampling code and time freq
%% Time freq analysis 
cfg = [];
cfg.resamplefs  = 250; % downsample from 1000 to 250 Hz
cfg.demean      = 'no';
cfg.detrend     = 'no';
resampled = ft_resampledata(cfg, awake_preprocessed);

cfg              = [];
cfg.method       = 'mtmconvol';
cfg.taper        = 'hanning';
cfg.output       = 'pow';
cfg.pad          = 'nextpow2';
cfg.foi          = 2:4:120;                        % estimate power at 2 to 120 Hz in steps of 4 Hz
cfg.t_ftimwin    = ones(length(cfg.foi),1).*0.5;   % length of time window = 0.5 sec
cfg.toi          = -0.750:0.05:1.350;              % time window "slides" in steps of 50 ms
TFRhann = ft_freqanalysis(cfg, resampled);