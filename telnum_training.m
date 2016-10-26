clc;
clear;
%% prepare data
    trainImages=[];
    trainLabels=[];
    for dirnum=1:9;
        datafile=['digit0',num2str(dirnum),'.mat'];
        labelfile=['testResults',num2str(dirnum),'.txt'];
        load(datafile);
        trainImages=[trainImages;testImg];
        trainLabel=load(labelfile);
        trainLabels=[trainLabels;trainLabel];
    end
%% training
    svm_struct=fitcecoc(trainImages,trainLabels);
    save('svm_struct','svm_struct');