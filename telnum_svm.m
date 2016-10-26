clc;
clear;
%% testing
    load('svm_struct');
    tic;
%% preprocess 
    imgFile='test.jpg';
    I=imread(imgFile);
    level = graythresh(I);
    Ibw1 = im2bw(I,level);
    % imshow(Ibw1);
    % figure;
    Ibw1 =1 - Ibw1; % 反色
    % imshow(Ibw1);
    % figure;

    [height,length]=size(Ibw1);
    thres_h=0.3*height;
    thres_l=0.05*length;

    % % 孔洞填充
    % Ibw1 = imfill(Ibw1,'holes');
    % imshow(Ibw1);
    % figure;

    [l,m]=bwlabel(Ibw1,8);
    % imshow(l);
    % figure;
    count=1;
    for i=1:m
        [row,col] = find(l==i);%第i个连通域
        pos = find(l==i);%第i个连通域
        rowmin=min(row);
        rowmax=max(row);
        colmin=min(col);
        colmax=max(col);
        digit_h=rowmax-rowmin;
        digit_l=colmax-colmin;


    %% 离散过滤
        if((digit_h<thres_h)||(digit_l<thres_l))
            continue;
        else
            digitImg_l=ceil(max(digit_h,digit_l)*1.55);
            last=zeros(digitImg_l);
            digitImg_rowmin=ceil((digitImg_l-digit_h)/2);
            digitImg_colmin=ceil((digitImg_l-digit_l)/2);
            temp=zeros(size(Ibw1));
            temp(pos)=Ibw1(pos);
            last(digitImg_rowmin:digitImg_rowmin+digit_h,digitImg_colmin:digitImg_colmin+digit_l)=temp(rowmin:rowmax,colmin:colmax);
            digit_mean=(mean(mean(last)));
    %         imshow(last);
    %         title(num2str(digit_mean));

            if(digit_mean>0.01)
                %%
%                 subplot(1,m,i);
%                 imshow(last);
%                 figure;
                %scale&center:
                lastImg=imresize(last, [28,28]);
                subplot(3,ceil(m/3),i);
                imshow(lastImg);
                lastImg=lastImg(:);
                lastImg=lastImg';
                testImg(count,:)=lastImg;
                count=count+1;   
            end
        end
    end


        testResults = predict(svm_struct,testImg);
        toc;
        % Compute the error on the test set
        disp(testResults');