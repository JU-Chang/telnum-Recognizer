clc;
clear;
%% training
%     trainImages = loadMNISTImages('train-images.idx3-ubyte');      
%     trainLabels = loadMNISTLabels('train-labels.idx1-ubyte');
%     trainImages = trainImages';
%     trainLength = length(trainImages);
%     svm_struct_mnist = fitcecoc(trainImages,trainLabels);
%     %保存训练得到的model,后面可以直接load使用，无需每次重新训练
%     save('svm_struct_mnist','svm_struct_mnist');
    %这里直接使用上面注释部分训练得到的模型
    load('svm_struct_mnist.mat');
%% get label set of digit01
    load('digit01');
    testResults = predict(svm_struct_mnist,testImg);
    fid = fopen('testResults1.txt','wt'); 
    fprintf(fid,'%g\n',testResults);   
    fclose(fid);

