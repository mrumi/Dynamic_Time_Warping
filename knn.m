function index = knn(trainSet, test, metric, window)
  [row,col] = size(trainSet);
  index = 0; 
 
  if window == -1 % use euclidean distance
    dist = zeros(col,1);
    for i = 1:col
      dist(i) = metric(trainSet(:,i),test);
    end
    index = find(dist==min(dist)); 
    
  else  % call dtw
    [U,L] = wrapper(test,window); % envelope for LB_keogh
    best_so_far = Inf;  
    for i = 1:col    
      current = trainSet(:,i);
      lb_dist = (sum(sum([[current > U].* [current-U]; [current < L].* [L-current]].^2)));
      if lb_dist < best_so_far       
        true_dist = metric(test, current, window, best_so_far);            
        if true_dist < best_so_far        
          best_so_far = true_dist;
          index = i;
        end
      end
    end
  end
end



