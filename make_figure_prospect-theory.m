%% FIGURE 3 of the Collins & Khamassi 2021 book chapter

%% ILLUSTRATION OF A FUNCTION COMPATIBLE WITH PROSPECT THEORY

figure,plot([-500 500],[0 0],'k','LineWidth',2)
hold on
plot([0 0],[-800 600],'k','LineWidth',2)
plot([0:1:500],(800/(1+0.8*exp(0)))-800./(1+0.8*exp(0.01.*[0:1:500])),'k','LineWidth',5)
plot([-50 0],[-200 0],'k','LineWidth',5)
plot([-75 -50],[-275 -200],'k','LineWidth',5)
plot([-475:1:-50],500-120*log(-0.05.*[-475:1:-50]),'k','LineWidth',5)

plot([100 100],[0 180],'--k','LineWidth',2)
plot([0 100],[180 180],'--k','LineWidth',2)

plot([200 200],[0 350],'--k','LineWidth',2)
plot([0 200],[350 350],'--k','LineWidth',2)

plot([-100 -100],[0 -325],'--k','LineWidth',2)
plot([0 -100],[-325 -325],'--k','LineWidth',2)

plot([-200 -200],[0 -475],'--k','LineWidth',2)
plot([0 -200],[-475 -475],'--k','LineWidth',2)

maFigure = gca;
set(maFigure,'FontSize',14)
axis([-500 500 -600 600])
