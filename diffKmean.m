function diffWindows = diffKmean(clusterIndices, clusters, data)

diffWindows = [];

for i = 1:length(clusterIndices)
    entry = data(i,:);
    cluster = clusters(clusterIndices(i), :);
    diff = cluster - entry;
    diffWindows = [diffWindows; diff];
end

end
