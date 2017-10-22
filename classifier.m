function accuracy = classifier(trainSet, testSet, trainLabel, testLabel, compareMethod, window)
  [row,column] = size(testSet);
  count = 0;
  for i = 1:column
    predict = knn(trainSet, testSet(:,i), compareMethod, window);
    if testLabel(i) == trainLabel(predict)
      count = count + 1;
    end
    i %used to keep track of progress. 
  end
  accuracy = count/column;
end
