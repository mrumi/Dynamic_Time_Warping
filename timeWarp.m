function dtw_dist = timeWarp(X,Y,sz,best)  
  dtw_dist = Inf;
  lx = length(X);
  ly = length(Y);
  if sz==0
    w = lx; % set to manipulate inner loop for unconstrained dtw.
  else
    w = floor(lx * sz/100);
  end 
  dtw = zeros(lx, ly);
  dtw(:) = Inf;
  dtw(1, 1) = 0;  
  for i = 2 : lx
    % if window = 0 w is set to lx 
    % so j will run from 2 to ly as desired for unconstrained window
    for j = max(2, i - w) : min(ly, i + w) 
      cost = (X(i) - Y(j))^2;
      dtw(i, j) = cost + min([dtw(i-1, j) dtw(i, j-1) dtw(i-1, j-1)]);       
    end     
    if min(dtw(i,:)) > best 
      return
    end
  end
  dtw_dist = dtw(lx, ly);
end

