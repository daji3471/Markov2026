Value_of_T = zeros(1,10.^5);

for i = 1:length(Value_of_T)
    M = rand;
    A = rand;
    D = rand;
    vctr = [M A D];
    Value_of_T(i) = max(vctr);
end

t = linspace(0,1,50);
histogram(Value_of_T,'Normalization','PDF');
hold on 
plot(t, 3*t.^2, 'LineWidth', 2)
hold off
title('Historgram of the value of T for a given 10^5 trials');
xlabel('Values of T');
ylabel('Frequency of value range');
legend('Monte Carlo Histogram', 'Theoretical PDF')