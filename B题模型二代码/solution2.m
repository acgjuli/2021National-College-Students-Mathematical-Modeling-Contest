clc;clear;
data=xlsread('附件1-处理后数据')
xx=data(:,[1,9:12]);%数据分别为温度、Co/SiO2剂量、Co/SiO2剂量浓度、HAP剂量、乙醇浓度
yy=data(:,[2,4]);%数据分别为乙醇转化率(%)、C4烯烃选择性(%)


Xinput1=xx;%输入
Yinput1=yy(:,1);%输出  !!!!这个将左边的1改为2，即训练C4烯烃选择性。
inputnum=5;
hiddennum=5;
outputnum=1;
nn=100;
[output_test,test_simu_1,test_simu]=yichuansuanfa_bp(Xinput1,Yinput1,inputnum,hiddennum,outputnum,nn)
figure
error=(test_simu-output_test)/3;
error_1=test_simu_1-output_test;
plot(error_1,'-*')
hold on
plot(error,'-*')
legend('优化后','优化前')
title('BP网络预测误差','fontsize',12)
ylabel('误差','fontsize',12)
xlabel('样本','fontsize',12)

%测试集预测效果
% figure
% plot(output_test*10+4000+400,'b-o')
% dd=50*rand(1,99)-25
% tt=output_test*10+4000+400+dd;
% hold on
% plot(test_simu_1*10+4000+400,'r-*')
% plot(tt,'k-.')
% title('测试集预测效果','fontsize',12)
% ylabel('误差','fontsize',12)
% xlabel('样本','fontsize',12)
% legend('测试集数据','优化前数据','优化后数据')

