clc;clear;
e=zeros(1,13); 
N = 784; %Õº∆¨¥Û–°28*28
K = 6; %K-neighbour
load('digit01.mat');
trainImages=testImg;
trainLabels=load('testResults1.txt');
[trainLength,~]=size(trainImages);
trainImages=trainImages';
for num=2:9
    datafile=['digit0',num2str(num),'.mat'];
    labelfile=['testResults',num2str(num),'.txt'];
    load(datafile);
    fid = fopen(labelfile,'wt'); 
    %%
    testImages=testImg;
    [testLength,~]=size(testImages);
    testImages=testImages';
    testResults = linspace(0,0,testLength);
    compLabel = linspace(0,0,K);
    tic;
    for i=1:testLength
        curImage = repmat(testImages(:,i),1,trainLength);
        curImage = abs(trainImages-curImage);
        comp=sum(curImage);
        [sortedComp,ind] = sort(comp);
        for j = 1:K
            compLabel(j) = trainLabels(ind(j));
        end
        table = tabulate(compLabel);
        [maxCount,idx] = max(table(:,2));
        testResults(i) = table(idx);  
    end
    toc;
    fprintf(fid,'%g\n',testResults);   
    fclose(fid);
end

