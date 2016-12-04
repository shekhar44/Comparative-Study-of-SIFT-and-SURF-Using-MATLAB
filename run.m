%%Run Matlab in the current directory and execute the following commands.  The "sift" command calls the appropriate binary to extract 
%SIFT features (under Linux or Windows) and returns them in matrix
%form.  Use "showkeys" to display the keypoints superimposed on the
%image:
tic
display('WORK IN PROGRESS PLEASE WAIT .............'); 
var=cd;                                                         % it store the current working path
path=strcat(var,'\database5\train\');
path1=strcat(var,'\database5\test\');
d=dir(path);                                                % list all directry in the folder
d2=dir(path1);
k=1;c=0;i=3;count=0;img_count=0;
       for j=3:length(d)                                             % this loop used to get the image name
             source_image = d(j).name;
             image_path = strcat(path,source_image);
             target_image = d2(i).name;
             image_path1 = strcat(path1,target_image); 
  [image, descrips, locs] = sift(image_path);
  showkeys(image, locs);
   [image, descrips, locs] = sift(image_path1);
  showkeys(image, locs);
  
i=i+1;
%The "match" command is given two image file names.  It extracts SIFT
%features from each image, matches the features between the two images,
%and displays the results.

  match(image_path,image_path1);
  
       end
       
       toc

%The result shows the two input images next to each other, with lines
%connecting the matching locations.  Most of the matches should be
%correct (as can be roughly judged by the fact that they select the
%correct object in a cluttered image), but there will be a few false
%outliers that could be removed by enforcing viewpoint consistency
%constraints.


