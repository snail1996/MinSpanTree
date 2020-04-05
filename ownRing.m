%%该函数判断给定图中是否有环
function re=ownRing(m, A)
    while 1
        pre_A=A;
        for i = 1:m
            degree = 0;%第i个元素的度
            for j = 1:m
                if A(i,j) ~= 0
                    degree = degree + 1;
                end
            end
            if degree == 1%元素的度为1时删除这个元素，其相邻元素度减一
               A(i,:) = 0;
               A(:,i) = 0;
            end
        end
        if pre_A==A%图中没有度为1的元素则退出
           break; 
        end
    end
    
    if sum(A(:)) == 0
        re = 0;
    else
        re = 1;
    end
end