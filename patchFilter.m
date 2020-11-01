clc
clear all
close all

pn = 'C:\eccv_final\code\testingDataset\images\';
pn2 = 'C:\eccv_final\code\testingDataset\gt\';

pn3 = 'C:\eccv_final\code\testingDataset\gt\filtered\';

s1 = 'C:\eccv_final\code\trainingDataset\g2\';
s2 = 'C:\eccv_final\code\trainingDataset\i2\';

imagefiles = dir([pn3 '*.png']);

one = [255, 0, 0];
two = [0, 255, 0];
three = [0, 0, 255];
four = [255, 255, 0];
five = [255, 0, 255];
six=[0, 255, 255];

nfiles = length(imagefiles);    

for ii=1:1:nfiles

    fn = imagefiles(ii).name;
    img=imread([pn fn]);
    
    gt = imread([pn2 fn]);
    
    imwrite(img,[s2 fn],'PNG');
    imwrite(gt,[s1 fn],'PNG');
           
end