clc;clear;
vNum=10;  %������
cityNum=30; %��������
eleNum=10; %���վ����
vCapacity=50; %��������
demands=[38  33  28  31  29  22  25  23  24  25 55  92  29  76  76  39  57  8  6  54 78  94  13  57  47  2  34  17  80  32 ]; %������
x=[15 94  68  76  75  40  66  18  71  4  28  80  19  49  45  65  71  76  28  68  66  11  12  13  14  15  16  17  18  19  20  70  90  96  55  14  15  26  85  26  82];
y=[43 25  93  35  20  26  62  48  36  84  59 25  93  35  20  26  62  48  36  84  59  55  92  29  76  76  39  57  8  6  54 78  94  13  57  47  2  34  17  80  32];
axis=[x' y']; %��������
Cij = zeros(41);%�������֮��ľ���
Q=100;
for i=1:41
    for j=1:i
        x1 = axis(i,1);
        y1 = axis(i,2);
        x2 = axis(j,1);
        y2 = axis(j,2);
        Cij(i,j)=sqrt((x1-x2)^2+(y1-y2)^2);
        Cij(j,i)=Cij(i,j);
    end
end
%% ���߱���
Xijk=binvar(41,41,vNum,'full');
%% Ŀ�꺯��
obj=0;
for i=1:41
    for j=1:41
        for k=1:10
           obj=obj+Cij(i,j)*Xijk(i,j,k);
        end
    end
end
f=obj;
%% Լ������
F=[];


%% ���
ops = sdpsettings( 'solver','cplex');
sol=solvesdp(F,f,ops);
f=value(f);
Xijk=value(Xijk);

