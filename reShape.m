function [trainData, testData, trainLabel, testLabel] = reShape(trainSet, testSet)
  
  trainLabel = trainSet(:,1);
  trainSet(:,1) = [];
  trainSet = trainSet';
  trainData = deNoise(trainSet);

  testLabel = testSet(:,1);
  testSet(:,1) = [];
  testSet = testSet';
  testData = deNoise(testSet);
  
 end
