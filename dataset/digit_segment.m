clc;
clear;

%% 预处理
    tic;
    % 图像读取
    cc=5;
    datefile=['digit0',num2str(cc)];
    imagename=['digit0',num2str(cc),'.png'];
    I=imread(imagename);

    % 二值化
    level = graythresh(I);
    Ibw1 = im2bw(I,level);
    % imshow(Ibw1);
    % figure;

    % 反色
    Ibw1 =1 - Ibw1; 
    % imshow(Ibw1);
    % figure;

    %设定离散过滤的阈值
    [height,length]=size(Ibw1);
    thres_h=0.1*height;
    thres_l=0.01*length;

    % % 孔洞填充
    % Ibw1 = imfill(Ibw1,'holes');
    % imshow(Ibw1);
    % figure;

    [l,m]=bwlabel(Ibw1,8);
    % imshow(l);
    % figure;
%% 分割
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

        %离散过滤
        if((digit_h<20)||(digit_l<8))
            continue;
        else
            digitImg_l=ceil(max(digit_h,digit_l)*1.55); 
            last=zeros(digitImg_l); %存储分割图像矩阵的初始化
            digitImg_rowmin=ceil((digitImg_l-digit_h)/2);
            digitImg_colmin=ceil((digitImg_l-digit_l)/2);
            temp=zeros(size(Ibw1)); 
            temp(pos)=Ibw1(pos); %取数字部分
            %分割
            last(digitImg_rowmin:digitImg_rowmin+digit_h,digitImg_colmin:digitImg_colmin+digit_l)=temp(rowmin:rowmax,colmin:colmax);
            %二次过滤
            digit_mean=(mean(mean(last)));
            if(digit_mean>0.01)
                lastImg=imresize(last, [28,28]);
    %             %% 保存分割的数字为图片文件
    %             dirname=['pic',num2str(cc)];
    %             if ~exist(dirname,'dir') 
    %                 mkdir(dirname)         
    %             end 
    %             filename=['pic',num2str(cc),'/',num2str(count),'.png'];          
    %             imwrite(lastImg,filename);
                lastImg=lastImg(:);
                lastImg=lastImg';
                testImg(count,:)=lastImg;
                count=count+1;   
            end
        end
    end
    save(datefile,'testImg');