p = genpath('/Users/MaoChongzhao/Downloads/lfw-deepfunneled');
length_p = size(p,2);%�ַ���p�ĳ���
path = {};%����һ����Ԫ���飬�����ÿ����Ԫ�а���һ��Ŀ¼
temp = [];
for i = 1:length_p %Ѱ�ҷָ��';'��һ���ҵ�����·��tempд��path������
    i
    if p(i) ~= ':'
        temp = [temp p(i)];
    else 
        temp = [temp '/']; %��·���������� '\'
        path = [path ; temp];
        temp = [];
    end
end  
clear p length_p temp;
%���˻��data�ļ��м����������ļ��У������ļ��е����ļ��У���·������������path�С�
%��������һ�ļ����ж�ȡͼ��
file_num = size(path,1);% ���ļ��еĸ���
file_num
o = 1;
imagePool = {};
for i = 1:file_num
    i
    if o> 7000
        break;
    end
    file_path =  path{i}; % ͼ���ļ���·��
    img_path_list = dir(strcat(file_path,'*.jpg'));
    img_num = length(img_path_list); %���ļ�����ͼ������
    if img_num > 0
        for j = 1:img_num
            image_name = img_path_list(j).name;% ͼ����
            image =  imread(strcat(file_path,image_name));
            %fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% ��ʾ���ڴ����·����ͼ����
            imagePool{o} = imresize(image(70:180, 70:180,1:3),[30,30]);
            o = o+1;
        end
    end
end