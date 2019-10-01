a=zeros(184,1);%定义一个容量矩阵
a=flipud(a);%上下颠倒
for i=1:183
    a(i,1)=(a(i+1,1)-a(i,1))/a(i,1);
end%转化为收益率
a(184,1)=0;%最后一个多余的数据改为（不用也可以）
[n,c]=hist(a,50);%获得频数直方图的数据
hold on;
bar(c,n*250/183);%调整倍数后画图
[muhat,sigmahat,muci,sigmaci]=normfit(a);%正态拟合
x=-0.04:0.002:0.04
y=normpdf(x,muhat,sigmahat);
plot(x,y);%画正态理论图

ymyself=normpdf(x,0.001,0.01);%自己参数估计0.001,0.01（0.03/3）
plot(x,ymyself);

counter=zeros(3,1);%设置记录3Σ
for i=1:183
    if a(i,1)<=0.011&a(i,1)>=-0.009 
       counter(1,1)=counter(1,1)+1
    else if a(i,1)<=0.021&a(i,1)>=-0.019
            counter(2,1)=counter(2,1)+1
        else a(i,1)<=0.031&a(i,1)>=-0.029
            counter(3,1)=counter(3,1)+1
        end
    end
end
for m=1:3
    counter(m,1)=counter(m,1)/183;
end






    
    




