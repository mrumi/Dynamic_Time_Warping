# Dynamic_Time_Warping
Installation: To run this code all one would need a Matlab IDE. This code is also runnable in Octave 4.0

Start: Run main.m. Parameter is changed inside main.m file. Edit path variable to change path of input file if required. Time series data is classified here in 4 different ways named as task 1-4. Any of these methods can be commented out using % at the start of a particular tas call before running main.m If removed a task, then task name need to be removed from result at line 24 .

Dataset is first divided in feature set and data label in reShape.m and normalized in deNoise.m. Then they are classified using 1-nearest neighbor algorithm. main() call classifier() and classifier calls knn() for each test data. Data is compared in 4 different way defined as Task 1-4 in main.m.

Task 1: Data is compared with simple euclidean algorithm. Defined in euclid.m

Task 2: Comparison method is Dynamic Time Warping (DTW). The algorithm can be found here. https://en.wikipedia.org/wiki/Dynamic_time_warping
In task 2, there's no restriction on warping window size, w.

Task 3: DTW again. But here w fixed to 20% of data length. 

Task 4: DTW and variable w. w is calculated using 5-fold cross validation (CV). CV is implemented in crossValidation.m

DTW is implemented in timeWarp.m DTW is O(n^2) algorithm. Runtime has been improved using lower bounding and early abandonng technique. wrapper.m is helper function used for lower bounding. 
