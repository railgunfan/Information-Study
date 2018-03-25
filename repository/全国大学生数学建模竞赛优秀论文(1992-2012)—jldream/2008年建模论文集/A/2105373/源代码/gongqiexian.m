format long;
[p1,txt1,raw1]=xlsread('d:/1.xls');
[p2,txt2,raw2]=xlsread('d:/2.xls');
[p3,txt3,raw3]=xlsread('d:/3.xls');
[p4,txt4,raw4]=xlsread('d:/4.xls');
[p5,txt5,raw5]=xlsread('d:/5.xls');

qd=ones(6,4);
P=imread('picture.bmp');
imshow(P);
hold on;
%��1�� Բ1,3
[min1 i]=min(p1(:,1));
qd(1,1)=i;
[min3 i]=min(p3(:,1));
qd(1,2)=i;
size1=size(p1);
size3=size(p3);
flag=1;
while flag>0
    flag=0;
    for i=1:size1(1)
         if p1(i,1)<(p1(qd(1,1),1)-p3(qd(1,2),1))/(p1(qd(1,1),2)-p3(qd(1,2),2))*(p1(i,2)-(p1(qd(1,1),2)))+p1(qd(1,1),1)
             qd(1,1)=i;
             flag=1;
         end
    end
    for i=1:size3(1)
         if p3(i,1)<(p1(qd(1,1),1)-p3(qd(1,2),1))/(p1(qd(1,1),2)-p3(qd(1,2),2))*(p3(i,2)-(p1(qd(1,1),2)))+p1(qd(1,1),1)
             qd(1,2)=i;
             flag=1;
         end
    end
end

for i=1:1024
    y(i)=(p1(qd(1,1),1)-p3(qd(1,2),1))/(p1(qd(1,1),2)-p3(qd(1,2),2))*(i-(p1(qd(1,1),2)))+p1(qd(1,1),1);
end
plot([1:1024],y);
hold on;

%��һ������
[max1 i]=min(p1(:,1));
qd(1,3)=i;
[max3 i]=min(p3(:,1));
qd(1,4)=i;
size1=size(p1);
size3=size(p3);
flag=1;
while flag>0
    flag=0;
    for i=1:size1(1)
         if p1(i,1)>(p1(qd(1,3),1)-p3(qd(1,4),1))/(p1(qd(1,3),2)-p3(qd(1,4),2))*(p1(i,2)-(p1(qd(1,3),2)))+p1(qd(1,3),1)
             qd(1,3)=i;
             flag=1;
         end
    end
    for i=1:size3(1)
         if p3(i,1)>(p1(qd(1,3),1)-p3(qd(1,4),1))/(p1(qd(1,3),2)-p3(qd(1,4),2))*(p3(i,2)-(p1(qd(1,3),2)))+p1(qd(1,3),1)
             qd(1,4)=i;
             flag=1;
         end
    end
end

for i=1:1024
    y(i)=(p1(qd(1,3),1)-p3(qd(1,4),1))/(p1(qd(1,3),2)-p3(qd(1,4),2))*(i-(p1(qd(1,3),2)))+p1(qd(1,3),1);
end
plot([1:1024],y);
hold on;

%��2�� Բ4,5
[min4 i]=min(p4(:,1));
qd(2,1)=i;
[min5 i]=min(p5(:,1));
qd(2,2)=i;
size4=size(p4);
size5=size(p5);
flag=1;
while flag>0
    flag=0;
    for i=1:size4(1)
         if p4(i,1)<(p4(qd(2,1),1)-p5(qd(2,2),1))/(p4(qd(2,1),2)-p5(qd(2,2),2))*(p4(i,2)-(p4(qd(2,1),2)))+p4(qd(2,1),1)
             qd(2,1)=i;
             flag=1;
         end
    end
    for i=1:size5(1)
         if p5(i,1)<(p4(qd(2,1),1)-p5(qd(2,2),1))/(p4(qd(2,1),2)-p5(qd(2,2),2))*(p5(i,2)-(p4(qd(2,1),2)))+p4(qd(2,1),1)
             qd(2,2)=i;
             flag=1;
         end
    end
end

for i=1:1024
    y(i)=(p4(qd(2,1),1)-p5(qd(2,2),1))/(p4(qd(2,1),2)-p5(qd(2,2),2))*(i-(p4(qd(2,1),2)))+p4(qd(2,1),1);
end
plot([1:1024],y);
hold on;

%��һ������
[max4 i]=min(p4(:,1));
qd(2,3)=i;
[max5 i]=min(p5(:,1));
qd(2,4)=i;
size4=size(p4);
size5=size(p5);
flag=1;
while flag>0
    flag=0;
    for i=1:size4(1)
         if p4(i,1)>(p4(qd(2,3),1)-p5(qd(2,4),1))/(p4(qd(2,3),2)-p5(qd(2,4),2))*(p4(i,2)-(p4(qd(2,3),2)))+p4(qd(2,3),1)
             qd(2,3)=i;
             flag=1;
         end
    end
    for i=1:size5(1)
         if p5(i,1)>(p4(qd(2,3),1)-p5(qd(2,4),1))/(p4(qd(2,3),2)-p5(qd(2,4),2))*(p5(i,2)-(p4(qd(2,3),2)))+p4(qd(2,3),1)
             qd(2,4)=i;
             flag=1;
         end
    end
end

for i=1:1024
    y(i)=(p4(qd(2,3),1)-p5(qd(2,4),1))/(p4(qd(2,3),2)-p5(qd(2,4),2))*(i-(p4(qd(2,3),2)))+p4(qd(2,3),1);
end
plot([1:1024],y);
hold on;




%��3�� Բ1,4
[min1 i]=min(p1(:,2));
qd(3,1)=i;
[min4 i]=min(p4(:,2));
qd(3,2)=i;
size1=size(p1);
size4=size(p4);
flag=1;
while flag>0
    flag=0;
    for i=1:size1(1)
         if p1(i,2)<(p1(qd(3,1),2)-p4(qd(3,2),2))/(p1(qd(3,1),1)-p4(qd(3,2),1))*(p1(i,1)-p1(qd(3,1),1))+p1(qd(3,1),2)
             qd(3,1)=i;
             flag=1;
         end
    end
    for i=1:size4(1)
         if p4(i,2)<(p1(qd(3,1),2)-p4(qd(3,2),2))/(p1(qd(3,1),1)-p4(qd(3,2),1))*(p4(i,1)-p1(qd(3,1),1))+p1(qd(3,1),2)
             qd(3,2)=i;
             flag=1;
         end
    end
end

for i=1:1024
    y(i)=(p1(qd(3,1),1)-p4(qd(3,2),1))/(p1(qd(3,1),2)-p4(qd(3,2),2))*(i-p1(qd(3,1),2))+p1(qd(3,1),1);
end
plot([1:1024],y);
hold on;

%��һ������
[max1 i]=max(p1(:,2));
qd(3,3)=i;
[max4 i]=max(p4(:,2));
qd(3,4)=i;
size1=size(p1);
size4=size(p4);
flag=1;
while flag>0
    flag=0;
    for i=1:size1(1)
         if p1(i,2)>(p1(qd(3,3),2)-p4(qd(3,4),2))/(p1(qd(3,1),1)-p4(qd(3,4),1))*(p1(i,1)-p1(qd(3,3),1))+p1(qd(3,3),2)
             qd(3,3)=i;
             flag=1;
         end
    end
    for i=1:size4(1)
         if p4(i,2)>(p1(qd(3,3),2)-p4(qd(3,4),2))/(p1(qd(3,1),1)-p4(qd(3,4),1))*(p4(i,1)-p1(qd(3,3),1))+p1(qd(3,3),2)
             qd(3,4)=i;
             flag=1;
         end
    end
end

for i=1:1024
   y(i)=(p1(qd(3,3),1)-p4(qd(3,4),1))/(p1(qd(3,3),2)-p4(qd(3,4),2))*(i-p1(qd(3,3),2))+p1(qd(3,3),1);
end
plot([1:1024],y);
hold on;


%��4�� Բ2,4
[min2 i]=min(p2(:,2));
qd(4,1)=i;
[min4 i]=min(p4(:,2));
qd(4,2)=i;
size2=size(p2);
size4=size(p4);
flag=1;
while flag>0
    flag=0;
    for i=1:size2(1)
         if p2(i,2)<(p2(qd(4,1),2)-p4(qd(4,2),2))/(p2(qd(4,1),1)-p4(qd(4,2),1))*(p2(i,1)-p2(qd(4,1),1))+p2(qd(4,1),2)
             qd(4,1)=i;
             flag=1;
         end
    end
    for i=1:size4(1)
         if p4(i,2)<(p2(qd(4,1),2)-p4(qd(4,2),2))/(p2(qd(4,1),1)-p4(qd(4,2),1))*(p4(i,1)-p2(qd(4,1),1))+p2(qd(4,1),2)
             qd(4,2)=i;
             flag=1;
         end
    end
end

for i=1:1024
    y(i)=(p2(qd(4,1),1)-p4(qd(4,2),1))/(p2(qd(4,1),2)-p4(qd(4,2),2))*(i-p2(qd(4,1),2))+p2(qd(4,1),1);
end
plot([1:1024],y);
hold on;

%��һ������
[max2 i]=max(p2(:,2));
qd(4,3)=i;
[max4 i]=max(p4(:,2));
qd(4,4)=i;
flag=1;
while flag>0
    flag=0;
    for i=1:size4(1)
         if p4(i,2)>(p2(qd(4,3),2)-p4(qd(4,4),2))/(p2(qd(4,1),1)-p4(qd(4,4),1))*(p4(i,1)-p2(qd(4,3),1))+p2(qd(4,3),2)
             qd(4,4)=i;
             flag=1;
         end
    end
    for i=1:size2(1)
         if p2(i,2)>(p2(qd(4,3),2)-p4(qd(4,4),2))/(p2(qd(4,1),1)-p4(qd(4,4),1))*(p2(i,1)-p2(qd(4,3),1))+p2(qd(4,3),2)
             qd(4,3)=i;
             flag=1;
         end
    end
end

for i=1:1024
   y(i)=(p2(qd(4,3),1)-p4(qd(4,4),1))/(p2(qd(4,3),2)-p4(qd(4,4),2))*(i-p2(qd(4,3),2))+p2(qd(4,3),1);
end
plot([1:1024],y);
hold on;





%��5�� Բ2,5
[min2 i]=min(p2(:,2));
qd(5,1)=i;
[min5 i]=min(p5(:,2));
qd(5,2)=i;
size2=size(p2);
size5=size(p5);
flag=1;
while flag>0
    flag=0;
    for i=1:size2(1)
         if p2(i,2)<(p2(qd(5,1),2)-p5(qd(5,2),2))/(p2(qd(5,1),1)-p5(qd(5,2),1))*(p2(i,1)-p2(qd(5,1),1))+p2(qd(5,1),2)
             qd(5,1)=i;
             flag=1;
         end
    end
    for i=1:size5(1)
         if p5(i,2)<(p2(qd(5,1),2)-p5(qd(5,2),2))/(p2(qd(5,1),1)-p5(qd(5,2),1))*(p5(i,1)-p2(qd(5,1),1))+p2(qd(5,1),2)
             qd(5,2)=i;
             flag=1;
         end
    end
end

for i=1:1024
    y(i)=(p2(qd(5,1),1)-p5(qd(5,2),1))/(p2(qd(5,1),2)-p5(qd(5,2),2))*(i-p2(qd(5,1),2))+p2(qd(5,1),1);
end
plot([1:1024],y);
hold on;

%��һ������
[max2 i]=max(p2(:,2));
qd(5,3)=i;
[max5 i]=max(p5(:,2));
qd(5,4)=i;
flag=1;
while flag>0
    flag=0;
    for i=1:size2(1)
         if p2(i,2)>(p2(qd(5,3),2)-p5(qd(5,4),2))/(p2(qd(5,1),1)-p5(qd(5,4),1))*(p2(i,1)-p2(qd(5,3),1))+p2(qd(5,3),2)
             qd(5,3)=i;
             flag=1;
         end
    end
    for i=1:size5(1)
         if p5(i,2)>(p2(qd(5,3),2)-p5(qd(5,4),2))/(p2(qd(5,1),1)-p5(qd(5,4),1))*(p5(i,1)-p2(qd(5,3),1))+p2(qd(5,3),2)
             qd(5,4)=i;
             flag=1;
         end
    end
end

for i=1:1024
   y(i)=(p2(qd(5,3),1)-p5(qd(5,4),1))/(p2(qd(5,3),2)-p5(qd(5,4),2))*(i-p2(qd(5,3),2))+p2(qd(5,3),1);
end
plot([1:1024],y);
hold on;







%��6�� Բ3,5
[min3 i]=min(p3(:,2));
qd(6,1)=i;
[min5 i]=min(p5(:,2));
qd(6,2)=i;
size3=size(p3);
size5=size(p5);
flag=1;
while flag>0
    flag=0;
    for i=1:size3(1)
         if p3(i,2)<(p3(qd(6,1),2)-p5(qd(6,2),2))/(p3(qd(6,1),1)-p5(qd(6,2),1))*(p3(i,1)-p3(qd(6,1),1))+p3(qd(6,1),2)
             qd(6,1)=i;
             flag=1;
         end
    end
    for i=1:size5(1)
         if p5(i,2)<(p3(qd(6,1),2)-p5(qd(6,2),2))/(p3(qd(6,1),1)-p5(qd(6,2),1))*(p5(i,1)-p3(qd(6,1),1))+p3(qd(6,1),2)
             qd(6,2)=i;
             flag=1;
         end
    end
end

for i=1:1024
    y(i)=(p3(qd(6,1),1)-p5(qd(6,2),1))/(p3(qd(6,1),2)-p5(qd(6,2),2))*(i-p3(qd(6,1),2))+p3(qd(6,1),1);
end
plot([1:1024],y);
hold on;

%��һ������
[max2 i]=max(p3(:,2));
qd(6,3)=i;
[max5 i]=max(p5(:,2));
qd(6,4)=i;
flag=1;
while flag>0
    flag=0;
    for i=1:size3(1)
         if p3(i,2)>(p3(qd(6,3),2)-p5(qd(6,4),2))/(p3(qd(6,1),1)-p5(qd(6,4),1))*(p3(i,1)-p3(qd(6,3),1))+p3(qd(6,3),2)
             qd(6,3)=i;
             flag=1;
         end
    end
    for i=1:size5(1)
         if p5(i,2)>(p3(qd(6,3),2)-p5(qd(6,4),2))/(p3(qd(6,1),1)-p5(qd(6,4),1))*(p5(i,1)-p3(qd(6,3),1))+p3(qd(6,3),2)
             qd(6,4)=i;
             flag=1;
         end
    end
end

for i=1:1024
   y(i)=(p3(qd(6,3),1)-p5(qd(6,4),1))/(p3(qd(6,3),2)-p5(qd(6,4),2))*(i-p3(qd(6,3),2))+p3(qd(6,3),1);
end
plot([1:1024],y);
hold on;

%��Բ1��Բ��
circle=1
X=jiaodian2(p1(qd(1,1),1),p1(qd(1,1),2),p3(qd(1,2),1),p3(qd(1,2),2),p1(qd(3,1),1),p1(qd(3,1),2),p4(qd(3,2),1),p4(qd(3,2),2),p1(qd(1,3),1),p1(qd(1,3),2),p3(qd(1,4),1),p3(qd(1,4),2),p1(qd(3,3),1),p1(qd(3,3),2),p4(qd(3,4),1),p4(qd(3,4),2))
x=(X(2)-512)/3.78
y=(384-X(1))/3.78
%��Բ2��Բ��
circle=2
X=jiaodian2(p2(qd(4,1),1),p2(qd(4,1),2),p4(qd(4,2),1),p4(qd(4,2),2),p2(qd(5,1),1),p2(qd(5,1),2),p5(qd(5,2),1),p5(qd(5,2),2),p2(qd(4,3),1),p2(qd(4,3),2),p4(qd(4,4),1),p4(qd(4,4),2),p2(qd(5,3),1),p2(qd(5,3),2),p5(qd(5,4),1),p5(qd(5,4),2))
x=(X(2)-512)/3.78
y=(384-X(1))/3.78
%��Բ3��Բ��
circle=3
X=jiaodian2(p1(qd(1,1),1),p1(qd(1,1),2),p3(qd(1,2),1),p3(qd(1,2),2),p3(qd(6,1),1),p3(qd(6,1),2),p5(qd(6,2),1),p5(qd(6,2),2),p1(qd(1,3),1),p1(qd(1,3),2),p3(qd(1,4),1),p3(qd(1,4),2),p3(qd(6,3),1),p3(qd(6,3),2),p5(qd(6,4),1),p5(qd(6,4),2))
x=(X(2)-512)/3.78
y=(384-X(1))/3.78
%��Բ4��Բ��
circle=4
X=jiaodian2(p4(qd(2,1),1),p4(qd(2,1),2),p5(qd(2,1),1),p5(qd(2,1),2),p1(qd(3,1),1),p1(qd(3,1),2),p4(qd(3,2),1),p4(qd(3,2),2),p4(qd(2,3),1),p4(qd(2,3),2),p5(qd(2,4),1),p5(qd(2,4),2),p1(qd(3,3),1),p1(qd(3,3),2),p4(qd(3,4),1),p4(qd(3,4),2))
x=(X(2)-512)/3.78
y=(384-X(1))/3.78
%��Բ5��Բ��
circle=4
X=jiaodian2(p4(qd(2,1),1),p4(qd(2,1),2),p5(qd(2,1),1),p5(qd(2,1),2),p3(qd(6,1),1),p3(qd(6,1),2),p5(qd(6,2),1),p5(qd(6,2),2),p4(qd(2,3),1),p4(qd(2,3),2),p5(qd(2,4),1),p5(qd(2,4),2),p3(qd(6,3),1),p3(qd(6,3),2),p5(qd(6,4),1),p5(qd(6,4),2))
x=(X(2)-512)/3.78
y=(384-X(1))/3.78