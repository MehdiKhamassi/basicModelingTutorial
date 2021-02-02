%% reinforcement learning model simulations for the Collins & Khamassi 2021 book chapter

clear all

%% Learning, blocking and Extinction figure (4)
alpha = .1;
V= zeros(1,2);

Vs = V;
RPE = 0;
for t = 1:20
    r=1;
    delta = r-(V(1)+V(2));
    V(1) = V(1) + alpha*delta;
    Vs = [Vs;V];
    RPE = [RPE delta];
end


for t = 1:20
    r=1;
    delta = r-(V(1)+V(2));
    V(1) = V(1) + alpha*delta;
    V(2) = V(2) + alpha*delta;
    Vs = [Vs;V];
    RPE = [RPE delta];
end

for t = 1:20
    r=0;
    delta = r-(V(1)+V(2));
    V(1) = V(1) + alpha*delta;
    Vs = [Vs;V];
    RPE = [RPE delta];
end


%%
figure;
subplot(3,1,[1:2])
plot(0:60,Vs,'linewidth',2)
legend('cloche','lumiere')
ylabel('association')
set(gca,'fontsize',14)
subplot(3,1,3)
plot(0:60,RPE,'k','linewidth',2)
set(gca,'fontsize',14)
ylabel('erreur')
xlabel('essai')

%% figure 5 - second order conditioning


clear all

%%
alpha = .2;
gamma = .9;
V= zeros(1,2);

Vs = V;
RPE = 0;
for t = 1:20
    r=1;
    delta = r-V(2);
    V(2) = V(2) + alpha*delta;
    Vs = [Vs;V];
    RPE = [RPE delta];
end


for t = 1:20
    r=0;
    delta = r+gamma*V(2)-V(1);
    V(1) = V(1) + alpha*delta;
    Vs = [Vs;V];
    RPE = [RPE delta];
end

%%

figure;
subplot(3,1,[1:2])
plot(0:40,Vs,'linewidth',2)
legend('bell','light')
ylabel('association')
set(gca,'fontsize',14)
subplot(3,1,3)
plot(0:40,RPE,'k','linewidth',2)
set(gca,'fontsize',14)
ylabel('erreur')