function clusterIndices = nearKmean(clusters, data)

numObservations = size(data, 1);
K = size(clusters, 1);

D = zeros(numObservations, K);

for k = 1:K
    D(:, k) = sum((data - repmat(clusters(k,:), numObservations, 1)).^2, 2);
end

[~, clusterIndices] = min(D, [], 2);

end
