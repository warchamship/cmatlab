%条件结构
%if-elseif-else-语句
%elseif关键字中间不能加空格，这和C、Java等语言不同
%在使用if语句时，if和end这两个关键字是无论如何都不能省略的
%结构：
% if 表达式1
%    语句1
% elseif 表达式2
%    语句2
% elseif 表达式3
%    语句3
% else   表达式4
%    语句4
% end
% if和elseif后面的表达式也支持其他运算，例如算术运算，其计算结果可以是一个数值常数，不一定非要是是逻辑值1或者0.如果if和elseif后面表达式的计算结果为非零数值，
%就会被当成逻辑值1；如果计算结果为数值零，就会被当成逻辑值0。对于一个矩阵，只有矩阵中所有元素都是非零时，矩阵才会被当做逻辑值1。

%例题：（分段函数）给定一个同学的成绩（假设为整数），输出这个同学的等级。等级规则如下：90至100分为1级、80至89分为2级、60至79分为3级、
%低于60分为4级；如果成绩小于0分或者大于100分，则代表成绩输入有误，此时等级为0
score=90;
if (score>=90)&&(score<=100)
    res=1;
elseif (score>=80)&&(score<90)
    res=2;
elseif (score>=60)&&(score<80)
    res=3;
elseif (score>=0)&&(score<60)
    res=4;
else
    res=0;
end
res
%全选+ctrl i只能缩进

% if的嵌套
%例题：已知a、b和c是三个互不相等的常数，请使用if语句找出a、b和c三个数的最大值
a=10;
b=40;
c=30;
if a>b
    if a>c
        max=a;
    else 
        max=c;
    end
else
    if b>c
        max=b;
    else
        max=c;
    end
end
max

%switch-case-otherwise-end语句
%开关表达式的计算结果必须是一个数值标量或者是一个字符向量/字符串，不能是向量或者矩阵。
%结构：
%switch 开关表达式
%   case 表达式1
%       语句1
%   case 表达式2
%       语句2
% .... 
%   case 表达式n
%       语句n
%   otherwise
%       语句n+1
%end

%例题：season是在区间[1,4]上随机生成的一个整数，用来表示季节（春夏秋冬）。分别使用switch-case-otherwise-end语句和if-elseif-else-end语句输出对应季度
season=randi([1,4]) %随机生成整数
switch season
    case 1
        disp("春季");  %disp打印函数,是否加分号不影响在命令行窗口的输出
    case 2
        disp("夏季")
    case 3
        disp("秋季")
    otherwise
        disp("冬季")
end        

if season==1
    disp("春季")
elseif season==2
    disp("夏季")
elseif season==3
    disp("秋季")
else
    disp("冬季")
end

%循环结构
%for-end语句(for循环)
%用于事先已知循环次数的情形，其语法如下：
%for 循环变量=向量或者矩阵
%   循环体
%end 循环体以end结束
%循环变量：用于迭代的变量名，它会在每次循环迭代中从向量或者矩阵中取出一列的值。数值向量或者矩阵则表示了循环变量可以取值的范围，
%一旦循环变量遍历完数值向量或者矩阵中的所有值，循环就会结束
for i =1:5  %范围为1到5的向量，每一列就是一个数值
    i
end
a=randi([-3,3],2,3)  %三列矩阵，每次循环取出一列，循环三次
for i=a
    i
end
%例题：不适用sum函数，计算行向量x中所有元素的和
x=1:6 %创建取值范围为1到6的向量
res_sum=0;
for i=x
    res_sum=res_sum+i;
end
res_sum
%例题：计算从公元1年到9999年间，有多少个闰年。闰年的判断条件是年份能被4整除，但不能被100整除，或者年份能被400整除
leap_year_num=0;
for i=1:9999
    if ((mod(i,4)==0)&&(mod(i,100)~=0))||(mod(i,400)==0)  %mod(被除对象，除数)取余函数。不等于是~=
        leap_year_num=leap_year_num+1; 
    end
end
leap_year_num
% while-end语句(while循环)
%允许我们在不知道具体循环次数的情况下执行循环体，其语法如下：
% while 表达式
%   循环体
% end  循环体以end结束
%例题：根据斐波那契数列的递推公式，求数列中第一个大于9999的元素
f(1)=1;
f(2)=1;
n=2;
while f(n)<=9999        %f()是创建了一个向量，里面的值是索引值
    n=n+1;
    f(n)=f(n-1)+f(n-2)
end
n
%一个无限循环，在命令行窗口按下快捷键ctrl+c来中断程序的运行
% while后面表达式的计算结果不一定非得是逻辑值1或0,。如果表达式的计算结果是一个数值常数，则只有当这个数为非零值时循环才会进行
% while循环指定次数：
i=5
while i
    i
    i=i-1;
end

% break和continue
% break和continue只能与for循环或while循环一同使用
% break关键字用于终止执行for或while循环。实际使用中，当满足某个条件时，我们会使用break立即退出循环。这在找到所需结构后立即退出循环的场景非常有用
% continue关键字用于跳过循环的当前迭代，然后继续下一次迭代。实际使用中，当满足某个条件时，continue将跳过当前循环迭代的剩余部分，然后继续进行下一次迭代。这对于在
%某些情况下跳过特定的迭代非常有用，而不必完全退出循环。

%例题：输出1到10中所有的奇数
for i=1:10
    if mod(i,2)==0
    else
        i
    end
end

for i=1:10
    if mod(i,2)==0
        continue
    end
    i
end
%例题：质数，又称素数，指在大于1的自然数中，除了1和该数自身外，无法被其他自然数整除的数（也可以定义为只有1与该数本身两个正因数的数）
% 给定任意一个大于100的自然数n(如n=1353899)请判断n是否为质数
n=13589
is_prime=1; %是奇数就返回1
for i=2:n-1
    if mod(n,i)==0
        is_prime=0;  %不是奇数返回0
        break;
    end
end
is_prime
%若存在循环的嵌套，break和continue只会在调用它的循环主体中起作用。即break仅从它所发生的循环中退出，continue仅跳过它所发生的循环体内的剩余语句
for i=1:2
    for j=1:3
        if j<=i
            i
            j
        else
            break
        end
    end
end
