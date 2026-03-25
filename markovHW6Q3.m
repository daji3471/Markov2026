lambdaA = 1/2;
lambdaB = 1;
lambdaC = 2;

f = @(r,L) exp(L.*(r-1)) - r;

r = linspace(0,1.2,400);

figure
% --- Plot 1 ---
subplot(3,1,1)
plot(r, f(r,lambdaA), 'r')
hold on
yline(0,'k--')
title('\lambda = 0.5')
xlabel('r')
ylabel('f(r)')

% --- Plot 2 ---
subplot(3,1,2)
plot(r, f(r,lambdaB), 'g')
hold on
yline(0,'k--')
title('\lambda = 1')
xlabel('r')
ylabel('f(r)')

% --- Plot 3 ---
subplot(3,1,3)
plot(r, f(r,lambdaC), 'b')
hold on
yline(0,'k--')
title('\lambda = 2')
xlabel('r')
ylabel('f(r)')


gA = @(r) f(r,lambdaA);
gB = @(r) f(r,lambdaB);
gC = @(r) f(r,lambdaC);

%according to the matlab ref: 
%"This solution is where fun(x) changes sign—fzero cannot find a root of a 
%function such as x^2." 

%this caused an error for the first 2 lambdas so we can check that there is 
%infact a root at r = 1; as this should always be a solution to the PGF(x)=x
rootA = fzero(gA, 1.1);
rootB = fzero(gB, 1.1);

disp(['root for lambda = 0.5: ', num2str(rootA)])
disp(['root for lambda = 1:   ', num2str(rootB)])

% lambda = 2 has two roots:
rootC1 = fzero(gC, [0 0.5]); %smallest root
rootC2 = fzero(gC, [0.9 1.1]); %trivial root

disp(['small root for lambda = 2: ', num2str(rootC1)])
disp(['root at r = 1 for lambda = 2: ', num2str(rootC2)])

% mark the roots on the plots
subplot(3,1,1)
plot(rootA, gA(rootA), 'ko', 'MarkerFaceColor', 'k')

%fzero still outputs a error for lambda = 1, but plugging in x=1 we get a 
%true expression so well still lable it
subplot(3,1,2)
plot(1, 0, 'ko', 'MarkerFaceColor', 'k')

subplot(3,1,3)
plot(rootC1, gC(rootC1), 'ko', 'MarkerFaceColor', 'k')
plot(rootC2, gC(rootC2), 'ko', 'MarkerFaceColor', 'k')