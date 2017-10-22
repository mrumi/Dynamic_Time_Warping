function best_window = crossValidation(trainSet)
  [row,columns] = size(trainSet);
  segment = row/5;
  placeHolder = zeros(15,5);
  for i = 1:5
    test = trainSet(segment*(i-1)+1:segment*i,:);
    train = trainSet;
    train(segment*(i-1)+1:segment*i,:) = [];
    [trainData, testData, trainLabel, testLabel] = reShape(train,test);     
    for w = 1:15   
      [w,i] % keeping track of progress
      placeHolder(w, i) = classifier(trainData,testData,trainLabel, testLabel, @timeWarp, w);
    end
  end
  avg_accuracy = sum(placeHolder,2)./5
  best_window = find(avg_accuracy == max(avg_accuracy));
  best_window = best_window(1);
end