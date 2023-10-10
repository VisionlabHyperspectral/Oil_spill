%% Demo code

clc
clear 
close all

vidObj = VideoReader("RGB_video.avi"); 

i =1;
while hasFrame(vidObj)
    vidFrame{i} = readFrame(vidObj);
    i = i+1;
end

clear i vidObj

%% Collect background spectra
% Double-click in the image to crop a part from this image
Background = vidFrame{1};

imagesc(Background)
load ROI
h = imrect(gca,ROI);
ROI = wait(h);
imrect(gca,ROI)
Background = Background(floor(ROI(2)):floor(ROI(2))+ceil(ROI(4)),...
    floor(ROI(1)):floor(ROI(1))+ceil(ROI(3)),:);

 Background = reshape_spec(Background);
 Background = double(Background([3,2,1],:));


close all


%% Generate simulated dataset
load Utility

Alpha = Absorption_coefficient(:,2:end);
Response = Spectral_response_RGB(:,2:end);

incidence_angle = 0;
reflection_angle = 0;

[Input,Output]  = Create_library_spectra_and_labels(Alpha,Background,lambda_true,Response,incidence_angle,reflection_angle);

%% Train the neural network

[~,~,net]=Artificial_Neural_Network(remove_norm(Input),Output,5,1000);

%% Predict the lables

for i=1:size(vidFrame,2)

    data_temp = double(vidFrame{i});    
    data_temp = data_temp(:,:,[3,2,1]);

    [data_temp,a,b]=reshape_spec(data_temp);
    output =net(remove_norm(double(data_temp)));
    
    index=zeros(1,size(output,2));
    [~,d]=find(output(2,:)>0.5);
    index(d) = 1;

    index=reshape(index,[a,b]);

    Predicted_labels{i} = index;

end

%% Generate a video

writerObj = VideoWriter('Predicted_labels.avi');
writerObj.FrameRate = 10;
open(writerObj)
for i = 1:size(Predicted_labels,2)
    writeVideo(writerObj,Predicted_labels{i})
end
close(writerObj)






