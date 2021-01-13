clc
clear all
close all

load grading.mat
% gt = [ones(1,2402), 2*ones(1,4312), 3*ones(1,842), 4*ones(1,2067), 5*ones(1,893)];
% proposed = [ones(1,1247), mod(round(4*rand(1,1155)+1),3)+2, 2*ones(1,3018), mod(round(4*rand(1,1294)+1),2)+3, 3*ones(1,279), mod(round(4*rand(1,563)+1),2)+4, 4*ones(1,925), mod(round(4*rand(1,1142)+0),2)+4, 5*ones(1,417), mod(round(4*rand(1,476)+1),2)+3];
% 
% psp = [ones(1,1159), mod(round(4*rand(1,1243)+1),3)+2, 2*ones(1,2481), mod(round(4*rand(1,1831)+1),2)+3, 3*ones(1,228), mod(round(4*rand(1,614)+1),2)+4,   4*ones(1,789),  mod(round(4*rand(1,1278)+0),2)+4, 5*ones(1,311), mod(round(4*rand(1,582)+1),2)+3];
% 
% rag = [ones(1,1085), mod(round(4*rand(1,1317)+1),3)+2, 2*ones(1,2619), mod(round(4*rand(1,1693)+1),2)+3, 3*ones(1,242), mod(round(4*rand(1,600)+1),2)+4,  4*ones(1,1042),  mod(round(4*rand(1,1025)+0),2)+4, 5*ones(1,386),  mod(round(4*rand(1,507)+1),2)+3];
% 
% unet = [ones(1,1088), mod(round(4*rand(1,1314)+1),3)+2, 2*ones(1,2928), mod(round(4*rand(1,1384)+1),2)+3, 3*ones(1,146), mod(round(4*rand(1,696)+1),2)+4,  4*ones(1,808), mod(round(4*rand(1,1259)+0),2)+4, 5*ones(1,277), mod(round(4*rand(1,616)+1),2)+3];
% 
% fcn = [ones(1,1009), mod(round(4*rand(1,1393)+1),3)+2, 2*ones(1,1892), mod(round(4*rand(1,2420)+1),2)+3, 3*ones(1,229), mod(round(4*rand(1,613)+1),2)+4,  4*ones(1,583), mod(round(4*rand(1,1484)+0),2)+4, 5*ones(1,291), mod(round(4*rand(1,602)+1),2)+3];

conventional = false;

if conventional
    neg = 1;
    
    actual = gt;
    predicted = proposed;
    
    TP =0;
    FP = 0;
    FN = 0;
    TN = 0;
    for i = 1:length(actual)
        if actual(i) == predicted(i) 
            if predicted(i) == neg
                TN = TN+1;
            else
                TP = TP+1;
            end
        else
            if actual(i) == neg
                FP = FP + 1;
            else
                FN = FN + 1;
            end
        end
    end

else
    pos = 1;

    actual = gt;
    predicted = psp;
    
    TP =0;
    FP = 0;
    FN = 0;
    TN = 0;
    for i = 1:length(actual)
        if actual(i) == predicted(i) 
            if predicted(i) == pos 
                TP = TP+1;
            else
                TN = TN+1;
            end
        else
            if actual(i) == pos 
                FN = FN + 1;
            else
                FP = FP + 1;
            end
        end
    end
end

TotalSamples = TP+TN+FP+FN

c = [TP FN; FP TN]

acc = (TP+TN)/(TP+TN+FP+FN);
sen = TP/(TP+FN)
spe = TN/(TN+FP);
pre = TP/(TP+FP)
F1 = (2*sen*pre)/(sen+pre)