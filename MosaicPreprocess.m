% This code is to grab all the images from subfolders of a folder
% Author: Modified from online: http://blog.163.com/yuyang_tech/blog/static/216050083201399103356795/
% Last Modifier: Chongzhao Mao


p = genpath('/Users/MaoChongzhao/Downloads/lfw-deepfunneled');
length_p = size(p,2);% length of the string p
path = {};% build a cell, each unit is a subfolder
temp = [];
for i = 1:length_p % find out the ':' for seperation. If found, write the path temp into the path
    if p(i) ~= ':'
        temp = [temp p(i)];
    else 
        temp = [temp '/']; %在路径的最后加入 '\'
        path = [path ; temp];
        temp = [];
    end
end  
clear p length_p temp;

% Then now we obtain the all the path to the subfolders and saved in path array
% Next lets grab the images
file_num = size(path,1);% number of subfolders
o = 1; % indicator for images processed
imagePool = {}; % processed images
imgNeed = 7000;
reSize = 30;
for i = 1:file_num
    i
    if o> imgNeed % decide how many images would you need
        break;
    end
    file_path =  path{i}; % path for subfolder
    img_path_list = dir(strcat(file_path,'*.jpg'));
    img_num = length(img_path_list); % number of images inside this folder
    if img_num > 0
        for j = 1:img_num
            image_name = img_path_list(j).name;% name for the image
            image =  imread(strcat(file_path,image_name));
            %fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% show the path and image name being processing
            imagePool{o} = imresize(image(70:180, 70:180,1:3),[reSize,reSize]); % take out the approximate face part of the images and resize into 30*30*3
            o = o+1;
        end
    end
end
