function reconstruct = asSignal(diffWindows)

rDiffWindows = diffWindows.';
half = size(rDiffWindows,1)/2;

p1 = rDiffWindows(1:half, 2:end);
p2 = rDiffWindows(half+1:end, 1:end-1);

reconstruct = reshape(p1 + p2, [], 1).';

end
