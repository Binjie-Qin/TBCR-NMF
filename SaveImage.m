%  ����ͼ��
for j = 60:5:85
    load(['O:\���ⱨ���ѧλ����\��������\NCut��ʼ��\ϡ��ϵ����Ӱ��\' num2str(j) '.mat']);
    dirname=['O:\���ⱨ���ѧλ����\��������\NCut��ʼ��\ϡ��ϵ����Ӱ��\' num2str(j)];%�µ��ļ�����
    a=['mkdir ' dirname];%��������
    system(a) %�����ļ���
    CC = C.*(ones(Row*Col,1)*max(S,[],2)');
%     CC=CC/100;
%     V = max(C(:));
    V = 2800;
    h = figure;imagesc(reshape(CC(:,1),Row,Col), [0 V]);axis off;axis image;
%     h = figure;image(reshape(CC(:,1)/V,Row,Col));axis off;axis image;
%     colormap(jet);
    saveas(h,[dirname '\af488'],'png');
    disp('��1��ϡ��ϵ��');
    Sparsity_Vec(CC(:,1),0)
    disp('\n');
    h = figure;imagesc(reshape(CC(:,2),Row,Col),[0 V]);axis off;axis image;
%     h = figure;image(reshape(CC(:,2),Row,Col)/V);axis off;axis image;
%     colormap(jet);
    saveas(h,[dirname '\af555'],'png');
    disp('��2��ϡ��ϵ��');
    Sparsity_Vec(CC(:,2),0)
    disp('\n');
    h = figure;imagesc(reshape(CC(:,3),Row,Col),[0 V]);axis off;axis image;
%     h = figure;image(reshape(CC(:,3)/V,Row,Col));axis off;axis image;
%     colormap(jet);
    saveas(h,[dirname '\af'],'png');
    disp('��3��ϡ��ϵ��');
    Sparsity_Vec(CC(:,3),0)
    disp('\n');
    W = repmat(max(S,[],2),1,chls);
    S = S./W;
    h = figure;plot(x1:step:x2,S(1,:)*100,x1:step:x2,S(2,:)*100,x1:step:x2,S(3,:)*100,'LineWidth',3);
    axis([470 660 0 105]);
    xlabel('Wavelength(nm)')
    legend('AF555','AF488','Autofluorescence');
    saveas(h,[dirname '\spectrum'],'png');
    close all;
    clear all;
end 

% load(['O:\���ⱨ���ѧλ����\��������\NCut��ʼ��\HALSL1�Ľ������\halsL0_01.mat']);
% dirname=['O:\���ⱨ���ѧλ����\��������\NCut��ʼ��\HALSL1�Ľ������\'];%�µ��ļ�����
% a=['mkdir ' dirname];%��������
% system(a) %�����ļ���
% CC = C.*(ones(Row*Col,1)*max(S,[],2)');
% %     CC=CC/100;
% %     V = max(C(:));
% V = 3200;
% h = figure;imagesc(reshape(CC(:,1),Row,Col), [0 V]);axis off;axis image;
% %     h = figure;image(reshape(CC(:,1)/V,Row,Col));axis off;axis image;
% %     colormap(jet);
% saveas(h,[dirname '
% \af488'],'png');
% disp('��1��ϡ��ϵ��');
% Sparsity_Vec(CC(:,1),0)
% disp('\n');
% h = figure;imagesc(reshape(CC(:,2),Row,Col),[0 V]);axis off;axis image;
% %     h = figure;image(reshape(CC(:,2),Row,Col)/V);axis off;axis image;
% %     colormap(jet);
% saveas(h,[dirname '\af555'],'png');
% disp('��2��ϡ��ϵ��');
% Sparsity_Vec(CC(:,2),0)
% disp('\n');
% h = figure;imagesc(reshape(CC(:,3),Row,Col),[0 V]);axis off;axis image;
% %     h = figure;image(reshape(CC(:,3)/V,Row,Col));axis off;axis image;
% %     colormap(jet);
% saveas(h,[dirname '\af'],'png');
% disp('��3��ϡ��ϵ��');
% Sparsity_Vec(CC(:,3),0)
% disp('\n');
% W = repmat(max(S,[],2),1,chls);
% S = S./W;
% h = figure;plot(x1:step:x2,S(1,:)*100,x1:step:x2,S(2,:)*100,x1:step:x2,S(3,:)*100,'LineWidth',3);
% axis([470 660 0 105]);
% xlabel('Wavelength(nm)')
% legend('AF555','AF488','Autofluorescence');
% saveas(h,[dirname '\spectrum'],'png');
% % close all;
% % clear all;
% 
% 
