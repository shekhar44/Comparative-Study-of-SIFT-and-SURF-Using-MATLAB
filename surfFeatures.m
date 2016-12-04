tic                                                                 % start the stopwatch timer to calculate the process time
display('WORK IN PROGRESS PLEASE WAIT .............'); 
var=cd;                                                             % it store the current working path
path1=strcat(var,'\database5\train\');                              % provide the path of training dataset
path=strcat(var,'\database5\test\');                                % provide the path of testing dataset
d=dir(path);                                                        % list all directry in the folder
d2=dir(path1);
k=1;c=0;i=3;count=0;img_count=0;
       for j=3:length(d)                                             % this loop used to get the image name
             source_image = d(j).name;
             image_path = strcat(path,source_image);
             target_image = d2(i).name;
             image_path1 = strcat(path1,target_image);          
source = imread(image_path);
target = imread(image_path1);
source = rgb2gray(source);                                      % if the image is coloured then use this else comment it.
target = rgb2gray(target);                                      % if the image is coloured then use this else comment it.
  sourcePoints=detectSURFFeatures(source,'MetricThreshold',100);
  selectStrongest(sourcePoints,50);
  %figure;imshow(source);hold on; 
 targetPoints=detectSURFFeatures(target,'MetricThreshold',100);
 selectStrongest(targetPoints,50);
   %figure;imshow(target);hold on;
     [sourceFeatures,sourcePoints]=extractFeatures(source,sourcePoints);  % extract the feature.
     [targetFeatures,targetPoints]=extractFeatures(target,targetPoints);

  boxPairs = matchFeatures(sourceFeatures, targetFeatures);               % match the features.

  matchedSourcePoints = sourcePoints(boxPairs(:, 1), :);
  matchedTargetPoints = targetPoints(boxPairs(:, 2), :);
  
  figure;
  showMatchedFeatures(source,target,matchedSourcePoints,matchedTargetPoints,'montage'); % show the matched point by ploting the line between the figures.
  hold on;
  legend('matched sourcePoints','matched targetPoints');                            

  % IS there any metric can used to make accurate decision if there is a match or not instead of percentage because its not accurate as required 
  numPairs = length(boxPairs); %the number of pairs
  percentage  = numPairs/50;

     if percentage >= 0.25
     disp('We have this');
     count=count+1;
     img_count=img_count+1;
     disp(percentage);
       else
     disp('We do not have this');
     img_count=img_count+1;
     disp(percentage);
     
     end
    i = i+1;
       end
    
    disp('match count-->');
    disp(count);
    disp('not matched count-->');
    disp(img_count);
    performace=(count/img_count)*100;
    disp('we have performace :--');
    disp(performace);
    toc                                             % stop the watch.