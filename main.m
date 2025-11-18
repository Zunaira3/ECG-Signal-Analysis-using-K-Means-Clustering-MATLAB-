% ================================
% Heartbeat Signal Cluster Analysis
% ================================

clear; clc; close all;

% Load heartbeat CSV file
signal = load("heart.csv");

% Plot raw signal
figure;
plot(signal(1:1000));
title('Raw Heartbeat Signal');

figure;
plot(signal);
title('Complete Heartbeat Signal');

% Sliding window segmentation
windows = buffer(signal(1:1000), 60, 30);  % 60-sample window, 30 overlap

% Apply Hamming window
windowedSignals = windows .* hamming(60);
featureWindows = windowedSignals.';

% Remove first and last (incomplete) windows
cleanPoints = featureWindows(2:end-1, :);

% K-means clustering
[idx, clusters] = kmeans(cleanPoints, 10);

% Reconstruct error signal
samples = cleanPoints(:,:);
clusterIndices = nearKmean(clusters, samples);
diffWindows = diffKmean(clusterIndices, clusters, samples);
reconstructDelta = asSignal(diffWindows);

figure;
plot(reconstructDelta);
ylim([-200 600]);
title('Error Signal Reconstruction');

% Compare a sample window to its cluster center
attack = cleanPoints(1,:);
clusterId = nearKmean(clusters, attack);
cluster = clusters(clusterId,:);

figure;
plot(attack, 'linewidth', 1.5);
hold on;
plot(cluster, 'linewidth', 1.5);
title('Window vs Cluster Center');
hold off;

diff = attack - cluster;

figure;
plot(diff, 'linewidth', 1.5);
title('Difference Between Sample & Cluster');

% Test reconstruction on modified signal
p1 = cleanPoints(1:16, :);
p2 = cleanPoints(16:32, :);
p2 = p2 - (p2*1.2) + 15;

samples = [p1; p2];
clusterIndices = nearKmean(clusters, samples);
diffWindows = diffKmean(clusterIndices, clusters, samples);
reconstructDelta = asSignal(diffWindows);

figure;
plot(reconstructDelta, 'linewidth', 1.5);
title('Reconstruction of Modified Windows');

clusterIndices = nearKmean(clusters, p2);
diffWindows = diffKmean(clusterIndices, clusters, p2);
reconstructDelta = asSignal(diffWindows);

figure;
plot(reconstructDelta, 'linewidth', 1.5);
title('Difference for Abnormal Segment');

figure;
hist(reconstructDelta, 50);
title('Histogram of Reconstruction Error');
