%%Prim算法
function B = Prim(m, A)
A(A==0) = Inf;%节点不可达则权值为Inf
P = zeros(1, m);%存储节点
P(1,1) = 1;%设置起点为1，即南京
V = 1:m;
V_P = V - P;
link = zeros(m-1,2);%存储最小生成树的边
k = 1;
while k < m
   p = P(P~=0);
   v = V_P(V_P~=0);
   pv = min(min(A(p,v)));%选择权重最小的一条边（权值）
   [x, y] = find(A==pv);%权值最小在邻接矩阵里的索引
   for i=1:length(x)
       if  any(P==x(i)) && any(V_P==y(i))%找出已加入P的节点和未加入p的另一个节点
           P(1,y(i)) = y(i);%将另一个节点加入P
           V_P = V - P;
           link(k, :) = [x(i), y(i)];
           k = k+1;
           break;
       end
   end
end
B = zeros(m, m);
for i = 1 : m-1
    B(link(i,1),link(i,2)) = A(link(i,1),link(i,2));
    B(link(i,2),link(i,1)) = A(link(i,2),link(i,1));
end
end