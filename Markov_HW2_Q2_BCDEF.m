
fprintf('QUESTION 2 PART F = OUTPUT');

%QUESTION 2 PART B
N = 10.^6;
uniform_samples = rand(1,N);
gamma_samples = zeros(1,N);

 f = @(y,unifom_samples) ((1 - exp(-y).*(y + 1)) - unifom_samples(i)); % CDF - u
 tic;

 %find samples by finding the zeros that solve f
for i = 1:N    
    gamma_samples(i) = fzero( @(y) f(y,uniform_samples(i) ), [0 20]);
end

runtime1 = toc;
fprintf('Runtime for inverse sampling: %.3f seconds\n', runtime1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%QUESTION 2 PART C

c = 4/exp(1);
accepted = zeros(N,1);
count = 0;

tic;
while count < N
    y = -2*log(1-rand);   % genaration of a samples form proposal using IS
    
    u = rand; %U random # btwn [0,1]

    if u <= (y * exp(-y)) / (c * (0.5 * exp(-y/2))) 
        %if "u" complies with acceptance condition, add to the accepted
        %array
        count = count + 1;
        accepted(count) = y;
    end
end

runtime_2 = toc;

fprintf('acceptance_probability(PART C): %.3f \n', 1./c);

fprintf('Runtime (Acceptance-Rejection): %.3f seconds\n', runtime_2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%QUESTION 2 PART D

tic;
x1 = -log(rand(N,1));   % array with samples of first exp RV 
x2 = -log(rand(N,1));   % array with samples of second exp RV

x_sum = x1 + x2;
runtime_3 = toc;

fprintf('Runtime (Sum of exponentials): %.3f seconds\n', runtime_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%QUESTION 2 PART E

k = 2;
theta = 1;    
x = linspace(0, 60, 1000);
gamma_pdf = (1 / (gamma(k) * theta^k)) .* x.^(k - 1) .* exp(-x ./ theta);


figure;
histogram(gamma_samples, 'Normalization', 'pdf', 'NumBins', 40);
hold on;
plot(x, gamma_pdf, 'LineWidth', 2);
xlabel('x');
ylabel('P(X=x)');
ylim([0 0.4])
title('Sampling gamma distribution through a root Finder');
legend('Samples', 'PDF');
grid on;

figure;
histogram(accepted, 'Normalization', 'pdf', 'NumBins', 40);
hold on;
plot(x, gamma_pdf, 'LineWidth', 2);
xlabel('x');
ylabel('P(X=x)');
title('Sampling gamma distribution through a route Finder');
legend('Samples', 'PDF');
grid on;

figure;
histogram( x_sum, 'Normalization', 'pdf', 'NumBins', 40);
hold on;
plot(x, gamma_pdf, 'LineWidth', 2);
xlabel('x');
ylabel('P(X=x)');
title('Sampling gamma distribution through a route Finder');
legend('Samples', 'PDF');
grid on;

