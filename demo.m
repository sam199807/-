D=[15 43];%��������
M=[94 5;68 10;76 83;75 70;40 32;66 96;18 4;71 44;4 39;28 77];%���վ
I=[80 25;19 93;49 35;45 20;65 26;71 62;76 48;28 36;68 84;66 59;17 55;12 92;50 29;
  96 76;35 76;59 39;23 57;76 8;26 6;51 54;70 78;90 94;96 13;55 57;14 47;15 2;26 34;85 17;26 80;80 32];%�ͻ���

V=[D;M;I];%���еĵ㼯
G=I;
num_m=size(M,1);%���վ����
global d;
d=100; %������ʻ������
capacity=100;%������װ������Ϊ100
limit=d;
n=size(V,1);%���е�ĸ���

for i=1:n 
     for j=1:n 
         dis(i,j)=((V(i,1)-V(j,1))^2+(V(i,2)-V(j,2))^2)^0.5;        
     end 
end%����֮��ľ���
saving=zeros(size(V,1),size(V,1)); %������ʻ�����Ĳ�ֵ
for i=2:size(V,1)-1 
     for j=i+1:size(V,1) 
         saving(i,j)=dis(1,i)+dis(1,j)-dis(i,j); 
     end 
end %���²�ֵ
for i=2:11 
     saving(i,i)=2*dis(1,i); 
end 
c=zeros(1,10); %��������ÿ�����վ�����м����ͻ�
a=0; 
for i=2:11 
     for j=12:41 
         if dis(i,j)<=33 
             a=a+1; 
         end 
     end 
         c(1,i-1)=a; 
         a=0; 
end%����ʩ���ǵ���Ŀ 
c;
[C,I]=sort(c,'descend'); 
demand=[38 33 28 31 29 22 25 23 24 25 29 21 39 39 30 30 27 39 28 23 36 28 25 29 22 23 39 40 32 22]; 
nl=2;%��ʼѡַ��Ŀ 
global loc; %��ѡ�еĳ��վ
r=ones(30,15); 
rf=ones(30,15); %���н�·��
rin=ones(30,15); %�����н�·��
 
%[bestcost,loc]=tabusearch(rf,rin,saving,dis,r,M,loc,nl,I,d,demand,limit,capacity,num_m); %�����������վ
r=ones(30,15); 
rf=ones(30,15); %���н�·��
rin=ones(30,15); %�����н�·��
nl=size(loc,2); %��ѡ�еĳ��վ����
%[saving rf numrin loc]= initial(nl,rf,rin,saving,dis,r,I,d,loc);  
%rf=Gmcws(rf,demand,dis,saving,capacity,num_m,limit,d,loc); %·�ߺϲ�����
figure(1); 

  
plot(D(:,1),D(:,2),'or') %����������
hold on; 
plot(M(:,1),M(:,2),'*m') %��δѡ�еĳ��վ
hold on 
plot(G(:,1),G(:,2),'.g') %���ͻ���
%plot(V(loc,1),V(loc,2),'*k') %��ѡ�еĳ��վ
hold on 

theta=0:2*pi/3600:2*pi;rr=1/3*d;
for i=1:10
Circle1=M(i,1)+rr*cos(theta);
Circle2=M(i,2)+rr*sin(theta);
plot(Circle1,Circle2,'m','Linewidth',1);
axis equal %��������ͬ
end
%pic(rf,V); 


