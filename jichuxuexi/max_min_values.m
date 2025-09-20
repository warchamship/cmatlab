function[max,min]=max_min_values(x)  %函数声明
max=subfuc1(x);  % max的值来自子函数subfuc1的返回结果
min=subfuc2(x);  % min的值来自子函数subfuc2的返回结果
    function r=subfuc1(x)
        x1=sort(x,'descend');  %按列降序排
        r=x1(1);
    end

    function r=subfuc2(x)
        x1=sort(x);  %按列升序排
        r=x1(1);
    end
end
%函数体，此函数只针对列向量