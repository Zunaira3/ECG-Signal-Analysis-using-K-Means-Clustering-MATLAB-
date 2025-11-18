# ECG-Signal-Analysis-using-K-Means-Clustering-MATLAB-
MATLAB implementation of ECG signal analysis using sliding windows, Hamming filtering, and K-Means clustering. Includes heartbeat window extraction, cluster assignment, error signal reconstruction, and visualization to study heartbeat patterns and detect variations in ECG data.

This project performs heartbeat signal processing using sliding windows, Hamming filtering, cluster analysis, and reconstruction. It applies K-Means clustering on heartbeat waveform segments to detect patterns and evaluate signal variation.

## Features
- Heartbeat signal visualization
- Sliding window segmentation (60-sample windows, 30 overlap)
- Hamming window smoothing
- K-Means clustering of heartbeat waveform shapes
- Error signal reconstruction
- Visual comparison between signal and cluster approximation

## Requirements
- MATLAB or GNU Octave
- Signal Processing Toolbox (or Octave alternatives)

## How to Run
1. Place `heart.csv` in the project root.
2. Run `main.m` in MATLAB/Octave.
3. All plots will generate automatically.

## Folder Structure

