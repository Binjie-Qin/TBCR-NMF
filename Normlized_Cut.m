% Normlized Cut
close all;clear all;

fluo1 = imread('��������1\target1.jpg');fluo1 = imresize(fluo1,0.25);
fluo2 = imread('��������1\target2.jpg');fluo2 = imresize(fluo2,0.25);
af = imread('��������1\auto.jpg');af = imresize(af, 0.25);
fluo1 = double(fluo1)/255;
fluo2 = double(fluo2)/255;
af = double(af)/255;
[row col] = size(fluo1);

sp1 = [1.0    0.50    0.20        0.10         0];
sp2 = [0    0.3    0.54    1.00    0.08];
sa = [1.0    0.80    0.70    0.6    0.5];

% m*n = m*k  k*n ��nΪͼƬ������
n = size(sp1,2);
img = zeros(row,col,n);
sum_img = zeros(row,col);
for i = 1:n
    img(:,:,i) = fluo1*sp1(i) + fluo2*sp2(i) + af*sa(i);
    sum_img = sum_img + img(:,:,i);
end

d1 = img(:,:,1);
d2 = img(:,:,2);
d3 = img(:,:,3);
d4 = img(:,:,4);
d5 = img(:,:,5);

[row, col] = size(d1);

% ��ȡ��Ĥ
mask = false(row,col);
mask(d1 > 0.04*max(d1(:))) = true;
m = sum(mask(:)); 
X = zeros(m,5);
X(:,1) = d1(mask);
X(:,2) = d2(mask);
X(:,3) = d3(mask);
X(:,4) = d4(mask);
X(:,5) = d5(mask);
% figure, imagesc(reshape(img,row,col*n));axis image;axis off;
% mask(sum_img > 0.001*max(sum_img(:))) = true;
% mask = imopen(mask, strel('square',2));
% figure,imshow(mask);
% 
% % ת����ÿһ��Ϊһ��ͼ��
% m = sum(mask(:));
% X = zeros(m,n);
% for i = 1:n
%     temp = img(:,:,i);
%     X(:,i) = temp(mask);
% end


% CX = X - repmat(mean(X,2),1,n); %ÿһ�����Ļ�
% CX = CX./ repmat(sqrt(sum(CX.^2,2)),1,n);
% % ������Ϣ
% [CoordX CoordY] = find(mask == true);

[y,v,nv,evec,eval] = Ncut(X);
res = zeros(row,col);
res(mask) = v;
figure,imagesc(res);

binpar = false(row,col);
binpar(res>0.0) = true;
figure,imshow(binpar);

seg = zeros(row,col);
reg = 1;
seg(mask) = reg;

reg = reg + 1;
if sum(binpar(:)) > sum(mask(:))/2
    seg(mask & ~binpar) = reg;
else
    seg(mask & binpar) = reg;
end


while eval(2,2) < 0.1
    if sum(binpar(:)) > sum(mask(:))/2
        mask = mask & binpar;
    else
        mask = mask & ~binpar;
    end
    m = sum(mask(:)); 
    X = zeros(m,5);
    X(:,1) = d1(mask);
    X(:,2) = d2(mask);
    X(:,3) = d3(mask);
    X(:,4) = d4(mask);
    X(:,5) = d5(mask);
    [y,v,nv,evec,eval] = Ncut(X);
    res = zeros(row,col);
    res(mask) = v;
    figure,imagesc(res);
    binpar = false(row,col);
    binpar(res>0.0) = true;
    figure,imshow(binpar);

    reg = reg + 1;
    if sum(binpar(:)) > sum(mask(:))/2
        seg(mask & ~binpar) = reg;
    else
        seg(mask & binpar) = reg;
    end
end

figure,imagesc(seg);



