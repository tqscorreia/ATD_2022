
[avg_prevalent_freq, std_prevalent_freq] = calculate_prevalent_freq(data, fs);
hold on;

eixo = 3;
%% join dynamic static in group
avg_static = 0;
std_static = 0;
for at = 4:6
    avg_static = avg_static + avg_prevalent_freq(at,eixo);
    std_static = std_static + std_prevalent_freq(at,eixo)^2;
end
avg_static = avg_static/3;
std_static = sqrt(std_static/3);

%% join transition activities in group
avg_trans = 0;
std_trans = 0;
for at = 7:12
    avg_trans = avg_trans + avg_prevalent_freq(at,eixo);
    std_trans = std_trans + std_prevalent_freq(at,eixo)^2;
end
avg_trans = avg_trans/6;
std_trans = sqrt(std_trans/6);

%% plot gaussians
hold on;
x = linspace(-0.4, 1, 100);

ystatic = normpdf(x, avg_static,  std_static);
plot(x,ystatic);

ytrans = normpdf(x, avg_trans, std_trans);
plot(x,ytrans);


title('Average prevalent frequency by activity type on Z axis');

%% create classification rule
% rule is intersection between gaussian density functions, taken from the
% plot, x = 0.117
% if prevalent frequency on X axis is greater than 0.118, it's a transition
% activity
rule = 0.117;
xline(rule,'--');
legend('Static', 'Transitions', 'decision rule', 'Location', 'northwest');

FN = normcdf(rule, avg_trans, std_trans);
TP = 1 - FN;
TN = normcdf(rule, avg_static, std_static);
FP = 1 - TN;
sens = TP/(TP+FN);
spec = TN/(TN+FP);
text(rule+0.01, 9.8, sprintf('x = %.4f', rule));
text(rule+0.01, 9.5, sprintf('sensibility = %.1f%%', sens*100));
text(rule+0.01, 9.2, sprintf('specificity = %.1f%%', spec*100));



%% All Experiences - max(DFT) 3d plot  ======> 4.3
% Dynamic VS (Transition & Static)
exps = ["exp11_user06", "exp12_user06", "exp13_user07", "exp14_user07", "exp15_user08", "exp16_user08", "exp17_user09", "exp18_user09", "exp19_user10","exp20_user10"];
figure();
for k = exps
    dft_max_3d_plot(k, fs,"true","Magnitude");
    hold on;
end
[x,y,z] = sphere;
surf(22*x,25*y,25*z);
ax = gca;
ax.XLim(1) = 0;
ax.YLim(1) = 0;
ax.ZLim(1) = 0;

