a = 10;
g = 4;
N1 = 100;
N2 = 1000;
N3 = 10000;  

inverseCDF =@(x) a.*(1-x).^(1./(1-g));

u1 = rand(N1,1);
u2 = rand(N2,1);
u3 = rand(N3,1);

samples1 = inverseCDF(u1);
samples2 = inverseCDF(u2);
samples3 = inverseCDF(u3);

%x = linspace(a, 60, 1000);
C = (g - 1) * a^(g - 1);
pdf = C * x.^(-g);

% Plot histogram 1 
figure;
histogram(samples1, 'Normalization', 'pdf', 'NumBins', 100);
hold on;

plot(x, pdf, 'LineWidth', 2);

xlabel('x');
ylabel('PDF');
title('Power-law Sampling via Inverse Sampling (100 Samples)');
legend('Samples', 'Actual PDF');
grid on;

% Plot histogram 2 
figure;
histogram(samples2, 'Normalization', 'pdf', 'NumBins', 100);
hold on;

plot(x, pdf, 'LineWidth', 2);

xlabel('x');
ylabel('PDF');
title('Power-law Sampling via Inverse Sampling (1000 Samples)');
legend('Samples', 'Actual PDF');
xlim([0 60]); %for consistency
grid on;

% Plot histogram 3 
figure;
histogram(samples3, 'Normalization', 'pdf', 'NumBins', 100);
hold on;

plot(x, pdf, 'LineWidth', 2);

xlabel('x');
ylabel('PDF');
title('Power-law Sampling via Inverse Sampling (10000 Samples)');
legend('Samples', 'Actual PDF');
xlim([0 100]); %for beauty
grid on;
