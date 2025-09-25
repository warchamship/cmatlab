%已知向量A、B，求A+B，用矢量图表示并用所学知识添加图形标注
A=[4,5];
B=[-10,10];
C=A+B;
axis([-20,20,0,20]);
hold on
quiver(0,0,A(1),A(2));
quiver(0,0,B(1),B(2));
quiver(0,0,C(1),C(2));
title("A向量+B向量=C向量");
text(A(1),A(2),'A');
text(B(1),B(2),'B');
text(C(1),C(2),'C');
grid on