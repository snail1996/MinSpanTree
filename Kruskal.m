%%Kruskal算法
function A = Kruskal(m, B)
[k, E] = numofEdge(m, B);
E = sortofEdge(k, E);
A=zeros(m, m);
for i=1:k  
    A(E(i,2),E(i,3))=E(i,1);
    A(E(i,3),E(i,2))=E(i,1);
    if ownRing(13, A)%加入边后判断图中是否含有环
        A(E(i,2),E(i,3))=0;
        A(E(i,3),E(i,2))=0;
    end
end