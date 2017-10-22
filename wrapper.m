function [U,L] = wrapper(timeSeries,window)
  if window == 0  %for unconstrained dtw envelope is chosen to be 20% of time series length.
    window = 20;
  end
  ls = length(timeSeries);
  w = floor(ls * window/100);
  U = zeros(ls, 1);
  L = zeros(ls, 1);
  for i = 1:ls
    max_bind = min(i+w, ls);
    min_bind = max(1, i-w);    
    U(i) = max(timeSeries(min_bind:max_bind));
    L(i) = min(timeSeries(min_bind:max_bind));
  end
end