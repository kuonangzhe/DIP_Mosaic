x = imread('/Users/MaoChongzhao/Downloads/mi2.jpg');
height = 30;
width = 30;
numh = 68;
numw = 102;
for i = 1:numh
    i
    for j = 1:numw
        num = numh*(i-1)+j;
        img = imagePool{num};
        yy = (height*(i-1)+1):(height*i);
        xx = (width*(j-1)+1):(width*j);
        x(yy,xx,1:3) = 0.5*x(yy,xx,1:3) + img*0.5; 
    end
end
figure, imshow(x)