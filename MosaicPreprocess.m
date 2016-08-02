p = genpath('/Users/MaoChongzhao/Downloads/lfw-deepfunneled');
length_p = size(p,2);%字符串p的长度
path = {};%建立一个单元数组，数组的每个单元中包含一个目录
temp = [];
for i = 1:length_p %寻找分割符';'，一旦找到，则将路径temp写入path数组中
    i
    if p(i) ~= ':'
        temp = [temp p(i)];
    else 
        temp = [temp '/']; %在路径的最后加入 '\'
        path = [path ; temp];
        temp = [];
    end
end  
clear p length_p temp;
%至此获得data文件夹及其所有子文件夹（及子文件夹的子文件夹）的路径，存于数组path中。
%下面是逐一文件夹中读取图像
file_num = size(path,1);% 子文件夹的个数
file_num
o = 1;
imagePool = {};
for i = 1:file_num
    i
    if o> 7000
        break;
    end
    file_path =  path{i}; % 图像文件夹路径
    img_path_list = dir(strcat(file_path,'*.jpg'));
    img_num = length(img_path_list); %该文件夹中图像数量
    if img_num > 0
        for j = 1:img_num
            image_name = img_path_list(j).name;% 图像名
            image =  imread(strcat(file_path,image_name));
            %fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% 显示正在处理的路径和图像名
            imagePool{o} = imresize(image(70:180, 70:180,1:3),[30,30]);
            o = o+1;
        end
    end
end