%%该函数输出网络边数和边的权重三元组
function [k, E] = numofEdge(m, G)
E=[];
k=0;%边的数量
for i=1:m
    for j=i:m
        if G(i,j)~=0
            E(k+1,:) = [G(i,j) i j];%提取边，三元组存储
            k=k+1;
        end
    end
end
end