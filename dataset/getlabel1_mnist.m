clc;
clear;
%% training
%     trainImages = loadMNISTImages('train-images.idx3-ubyte');      
%     trainLabels = loadMNISTLabels('train-labels.idx1-ubyte');
%     trainImages = trainImages';
%     trainLength = length(trainImages);
%     svm_struct_mnist = fitcecoc(trainImages,trainLabels);
%     %����ѵ���õ���model,�������ֱ��loadʹ�ã�����ÿ������ѵ��
%     save('svm_struct_mnist','svm_struct_mnist');
    %����ֱ��ʹ������ע�Ͳ���ѵ���õ���ģ��
    load('svm_struct_mnist.mat');
%% get label set of digit01
    load('digit01');
    testResults = predict(svm_struct_mnist,testImg);
    fid = fopen('testResults1.txt','wt'); 
    fprintf(fid,'%g\n',testResults);   
    fclose(fid);

