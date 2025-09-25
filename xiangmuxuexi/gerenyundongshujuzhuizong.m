% 1. 创建数据：假设过去7天，每天跑步距离(km)和平均心率
days = 1:7;
distance = [5.2, 0, 7.1, 5.8, 6.5, 0, 8.0]; % 0代表休息日
avg_heart_rate = [145, 0, 152, 148, 149, 0, 156];
%绘制跑步距离的柱状图。
%将距离和心率画在同一个图的双y轴上（yyaxis）。
%挑战：计算并标注出“最有效率”的一天（用 距离/心率 比值衡量）
bar(days,distance);
xlabel('天数')
ylabel('距离/千米')
xlim([0,8])
title('过去一周运动数据')
grid on
hold on
yyaxis left
scatter(days,distance,100,'filled','red')
ylim([0,10])
ylabel('距离/千米')
yyaxis right
scatter(days,avg_heart_rate,100,'filled','blue')
ylim([140,160])
ylabel('心率/(次/分)')
for i=1:7
    if distance==0
        a(i)=0;
    else
        a(i)=distance(i)/avg_heart_rate(i);
    end
end
[max_efficiency, max_index]=max(a);
max_day=days(max_index)   % max()对于数组，不仅可以获得最大值，还能返回最大值索引
fprintf('最有效率的是第%d天，效率值（距离/心率）为：%.4f\n',max_day, max_efficiency); % fprintf()格式化输出
text(max_day,0,'最有效率的一天')



% 1. 创建数据：假设过去7天，每天跑步距离(km)和平均心率
days = 1:7;
distance = [5.2, 0, 7.1, 5.8, 6.5, 0, 8.0]; % 0代表休息日
avg_heart_rate = [145, 0, 152, 148, 149, 0, 156];

% 2. 创建图表
figure;

% 左侧Y轴：距离（柱状图 + 散点图）
yyaxis left;
b = bar(days, distance, 'FaceAlpha', 0.6, 'DisplayName', '跑步距离');
hold on;
s1 = scatter(days, distance, 70, 'red', 'filled', 'DisplayName', '距离点');
ylabel('距离 (km)');
ylim([0, 10]);

% 右侧Y轴：心率（散点图）
yyaxis right;
s2 = scatter(days, avg_heart_rate, 70, 'blue', 'filled', 'DisplayName', '心率点'); %为点命名后用legend进行图例显示
ylabel('心率 (次/分)');
ylim([140, 160]);

% 图表美化
xlabel('天数');
title('过去一周运动数据追踪与效率分析');
legend([b, s1, s2], 'Location', 'northwest'); %设置左上角图例说明
grid on;
xlim([0.5, 7.5]);

% 3. 计算效率（你的核心逻辑，稍作优化）
a = zeros(1, 7); % 预分配内存
for i = 1:7
    if distance(i) > 0 % 只计算跑步日的效率
        a(i) = distance(i) / avg_heart_rate(i);
    end
end

% 4. 找到并标注最有效率的一天
[max_efficiency, max_index] = max(a);
max_day = days(max_index);

% 在图上醒目地标注出来
yyaxis left; % 切换到左侧Y轴进行标注
text(max_day, distance(max_index)+0.3, '↑ 最有效率', ...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'red');

% 5. 在命令窗口输出结果
fprintf('\n=== 运动效率分析报告 ===\n');
fprintf('最有效率的是第%d天：\n', max_day);
fprintf('  - 跑步距离：%.1f km\n', distance(max_index));
fprintf('  - 平均心率：%d 次/分\n', avg_heart_rate(max_index));
fprintf('  - 效率值（距离/心率）：%.4f\n', max_efficiency);