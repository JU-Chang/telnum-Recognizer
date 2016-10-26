clc;
clear;

%% Ԥ����
    tic;
    % ͼ���ȡ
    cc=5;
    datefile=['digit0',num2str(cc)];
    imagename=['digit0',num2str(cc),'.png'];
    I=imread(imagename);

    % ��ֵ��
    level = graythresh(I);
    Ibw1 = im2bw(I,level);
    % imshow(Ibw1);
    % figure;

    % ��ɫ
    Ibw1 =1 - Ibw1; 
    % imshow(Ibw1);
    % figure;

    %�趨��ɢ���˵���ֵ
    [height,length]=size(Ibw1);
    thres_h=0.1*height;
    thres_l=0.01*length;

    % % �׶����
    % Ibw1 = imfill(Ibw1,'holes');
    % imshow(Ibw1);
    % figure;

    [l,m]=bwlabel(Ibw1,8);
    % imshow(l);
    % figure;
%% �ָ�
    count=1;
    for i=1:m
        [row,col] = find(l==i);%��i����ͨ��
        pos = find(l==i);%��i����ͨ��
        rowmin=min(row);
        rowmax=max(row);
        colmin=min(col);
        colmax=max(col);
        digit_h=rowmax-rowmin;
        digit_l=colmax-colmin;

        %��ɢ����
        if((digit_h<20)||(digit_l<8))
            continue;
        else
            digitImg_l=ceil(max(digit_h,digit_l)*1.55); 
            last=zeros(digitImg_l); %�洢�ָ�ͼ�����ĳ�ʼ��
            digitImg_rowmin=ceil((digitImg_l-digit_h)/2);
            digitImg_colmin=ceil((digitImg_l-digit_l)/2);
            temp=zeros(size(Ibw1)); 
            temp(pos)=Ibw1(pos); %ȡ���ֲ���
            %�ָ�
            last(digitImg_rowmin:digitImg_rowmin+digit_h,digitImg_colmin:digitImg_colmin+digit_l)=temp(rowmin:rowmax,colmin:colmax);
            %���ι���
            digit_mean=(mean(mean(last)));
            if(digit_mean>0.01)
                lastImg=imresize(last, [28,28]);
    %             %% ����ָ������ΪͼƬ�ļ�
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