function  cost= totaldis(rf,dis)
%   ����ɱ�
ddis=0;%Ĭ�Ͼ���Ϊ0
for i=1:30
    for j=1:14
        if rf(i,j)~=1||rf(i,j+1)~=1
           ddis=ddis+dis(rf(i,j),rf(i,j+1));
        else
            break;
        end
    end
end
cost=ddis*5;
end

