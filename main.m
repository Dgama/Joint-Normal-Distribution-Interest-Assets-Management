a=zeros(184,1);%����һ����������
a=flipud(a);%���µߵ�
for i=1:183
    a(i,1)=(a(i+1,1)-a(i,1))/a(i,1);
end%ת��Ϊ������
a(184,1)=0;%���һ����������ݸ�Ϊ������Ҳ���ԣ�
[n,c]=hist(a,50);%���Ƶ��ֱ��ͼ������
hold on;
bar(c,n*250/183);%����������ͼ
[muhat,sigmahat,muci,sigmaci]=normfit(a);%��̬���
x=-0.04:0.002:0.04
y=normpdf(x,muhat,sigmahat);
plot(x,y);%����̬����ͼ

ymyself=normpdf(x,0.001,0.01);%�Լ���������0.001,0.01��0.03/3��
plot(x,ymyself);

counter=zeros(3,1);%���ü�¼3��
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






    
    




