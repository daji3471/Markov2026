%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HW1_Q1 Part_d
x = linspace(0, 10, 1000);

f = @(x) 1/3.*x.*(1+x).*exp(-x);
g = @(x) ((exp(-(sqrt(3)-1)))./(3*(sqrt(3)-1)^2 - 3*(sqrt(3)-1)^3)).*(sqrt(3)-1).^(2).* x.*exp(-x.*(sqrt(3)-1));

figure
plot(x, f(x), 'LineWidth', 2)
hold on
plot(x, g(x), 'LineWidth', 2)
grid on
legend('f(x)', 'g(x)')
xlabel('x')
ylabel('value')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HW1_Q2 Part_e
A = [0.9 0.1 0 ; 0 7./8 1./8 ; 0.4 0 0.6]
B = A^(50)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HW1_Q3 Part_c
C = [1 0 0 0 0 ; 1/3 0 2/3 0 0; 0 1/3 0 2/3 0 ; 0 0 1/3 0 2/3 ; 0 0 0 0 1]
D = C^5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HW1_Q4 Partb
E = [1/2 1/2 0 0 0 0; 0 1/2 1/2 0 0 0; 1/3 0 1/3 1/3 0 0; 0 0 0 1/2 1/2 0;0 0 0 0 0 1 ; 0 0 0 0 1 0; ]
G = E^5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HW1_Q4 PartD

rng('default')

Nsim   = 10000;
Nsteps = 5;
count  = 0;

for sim = 1:Nsim
    X = 1;   % X0 = 1
    
    for n = 1:Nsteps
        u = rand;
        X = find(u <= cumsum(G(X,:)),1);
    end
    
    if X == 4
        count = count + 1;
    end
end

prob_estimate = count / Nsim
