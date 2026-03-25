P = [ 0,1,0,0,0;
     1/3,0,2/3,0,0;
     0,1/2,0,1/2,0;
     0,0,2/3,0,1/3;
     0,0,0,1,0];

pi = [ 1/12 1/4 1/3 1/4 1/12]; %SD found in part b

q_0 = [0 0 1 0 0]; % x_0 = 2, index begins at 0

q_n = q_0;

for j = 1:50
    q_n = q_n*P;
end

q_n %q_50

q_nplus = q_n*P;% q_n+1, where n is at a odd itteration, this is to test our oscialtion hypothis from part c
% this result is not part of the question.

q_nplus %q_51

x = 0:4;
bar(x,[q_n; pi;q_nplus;]');
xlabel('State');
ylabel('Probability of being in given state');
title('Comparison of q_{50},q_{51}, and our SD');
legend('50 steps','Stationary Distribution','51 steps')

