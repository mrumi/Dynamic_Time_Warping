%dataset load
path = 'hw1_datasets/dataset4/';
trainSet = load(strcat(path,'train.txt'));
testSet = load(strcat(path,'test.txt'));

%data cleaning and rearrange
[trainData, testData, trainLabel, testLabel] = reShape(trainSet, testSet);

%start=tic;
%task1
euclidean = classifier(trainData, testData, trainLabel, testLabel, @euclid, -1)

%task2
dtw_unconstraind = classifier(trainData, testData, trainLabel, testLabel, @timeWarp, 0)

%task3
dtw_predefined = classifier(trainData, testData, trainLabel, testLabel, @timeWarp, 20)

%task4
window = crossValidation(trainSet) 
dtw_improved = classifier(trainData, testData, trainLabel, testLabel, @timeWarp, window)

%final result
result = [euclidean dtw_unconstraind dtw_predefined dtw_improved]

%elapse=toc(start)