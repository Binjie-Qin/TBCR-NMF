% Noise reduction
% ȥ���������û����ź�Ϊ0
function I2=FluoNoiseReduction(I)
[m,n]=size(I);
I=medfilt2(I); % ȥ��һЩ��ֵ�ϴ����
% H = fspecial('gaussian',7,7);
% I = imfilter(I,H,'replicate');
squareSize=20;
meanValue=mean([mean(mean(I(1:squareSize,1:squareSize))) 
                mean(mean(I(1:squareSize,n-squareSize+1:n))) 
                mean(mean(I(m-squareSize+1:m,1:squareSize))) 
                mean(mean(I(m-squareSize+1:m,n-squareSize+1:n)))]);  
% meanValue2=meanValue+20;
meanValue2=meanValue;
I2=I-meanValue2;
I2(I2<0)=0;
end 