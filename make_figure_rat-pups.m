%% FIGURE 1 of the Collins & Khamassi 2021 book chapter

% plot huddling time of rat pups as a function of temperature

% GENERATE A MATRIX OF VIRTUAL DATA (FOR ILLUSTRATIVE PURPOSE ONLY)
tbl = [3 65; 9 5; 10 4; 2 68; 6 40; 12 30; 7 51; 2.5 65; 8 45; 2.75 40; 7.5 31; 5.5 29; 10.5 18; 13 5];
nbRats = size(tbl,1);
idxRat1 = 1;
idxRat2 = 6;
idxRat3 = 10;

% plot data points
figure,plot(tbl(idxRat1,1),tbl(idxRat1,2),'+b','MarkerSize',10)
hold on
plot(tbl(idxRat2,1),tbl(idxRat2,2),'*r','MarkerSize',10)
plot(tbl(idxRat3,1),tbl(idxRat3,2),'^k','MarkerSize',10)
for iii=1:nbRats
    if (iii>idxRat1)&&(iii<idxRat2)
        plot(tbl(iii,1),tbl(iii,2),'+b','MarkerSize',10) % rat 1
    end
    if (iii>idxRat2)&&(iii<idxRat3)
        plot(tbl(iii,1),tbl(iii,2),'*r','MarkerSize',10) % rat 2
    end
    if (iii>idxRat3)
        plot(tbl(iii,1),tbl(iii,2),'^k','MarkerSize',10) % rat 3
    end
end

% fitting the data of rat 1
[lineParameters,R1,J]=nlinfit(tbl(1:5,1),tbl(1:5,2),@linearFunction,[-1 150]);
plot([0:0.1:14],lineParameters(1).*[0:0.1:14]+lineParameters(2),'b')

% fitting the data of rat 2
[lineParameters,R1,J]=nlinfit(tbl(6:9,1),tbl(6:9,2),@linearFunction,[-1 150]);
plot([0:0.1:14],lineParameters(1).*[0:0.1:14]+lineParameters(2),'r')

% fitting the data of rat 3
[lineParameters,R1,J]=nlinfit(tbl(10:end,1),tbl(10:end,2),@linearFunction,[-1 150]);
plot([0:0.1:14],lineParameters(1).*[0:0.1:14]+lineParameters(2),'k')

% fitting the data of the whole population
[lineParameters,R1,J]=nlinfit(tbl(:,1),tbl(:,2),@linearFunction,[-1 150]);
plot([0:0.1:14],lineParameters(1).*[0:0.1:14]+lineParameters(2),'k','LineWidth',2)

xlabel('Température (°C)')
ylabel('Durée de blotissement (min)')
axis([0 14 -40 100])

% plotting fitting errors
for iii=1:nbRats % loop over data points
    plot([tbl(iii,1) tbl(iii,1)],[tbl(iii,2) (lineParameters(1)*tbl(iii,1)+lineParameters(2))],'--k')
end

maFigure = gca;
set(maFigure,'FontSize',14)
legend('Rat 1','Rat 2','Rat 3')

