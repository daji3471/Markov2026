% Q1

%part a
Q = [ -1  1  0  0;
       0 -1  1  0;
       0  0 -1  1;
       1  0  0 -1 ];

[V, L] = eig(Q);
disp(diag(L));
disp(V);

%part b 
pi = [1/4 1/4 1/4 1/4];

q = (Q.')*(pi.') % this product does give a zero so "pi" is a statioary distributiuon

%part e
N_val = [100, 1000, 10000, 100000];
tgrid = linspace(0,5,1001);
Tmax = 5;

% correct theoretical solution for y1(t)
% y1(0) = 1/3 and y1(t) -> 1/4 as t -> infinity
y1_theory = @(t) 1/4 - (1/12)*exp(-2*t) ...
                   + (1/6)*exp(-t).*cos(t) ...
                   + (1/3)*exp(-t).*sin(t);

figure;

for k = 1:length(N_val)
    N = N_val(k);

    % counts how many chains are in state 1 at each time
    inState1 = zeros(size(tgrid));

    for n = 1:N
        % initial state: 1 with prob 1/3, 2 with prob 2/3
        if rand < 1/3
            state = 1;
        else
            state = 2;
        end

        % simulate jump times and visited states
        jumpTimes = 0;
        states = state;

        t = 0;
        while t < Tmax
            dt = -log(rand);   % Exp(1)
            t = t + dt;

            if t > Tmax
                break;
            end

            state = mod(state,4) + 1;   % 1->2->3->4->1
            jumpTimes(end+1) = t;
            states(end+1) = state;
        end

        % evaluate chain on the plotting grid
        idx = 1;
        currentState = states(1);

        for j = 1:length(tgrid)
            tj = tgrid(j);

            while idx < length(jumpTimes) && jumpTimes(idx+1) <= tj
                idx = idx + 1;
                currentState = states(idx);
            end

            if currentState == 1
                inState1(j) = inState1(j) + 1;
            end
        end
    end

    % empirical fraction in state 1
    f = inState1 / N;

    subplot(2,2,k);
    plot(tgrid, f, 'b', 'LineWidth', 1); hold on;
    plot(tgrid, y1_theory(tgrid), 'r--', 'LineWidth', 2);
    yline(1/4, 'k:', 'LineWidth', 1);
    xlim([0 5]);
    ylim([0 0.5]);
    xlabel('t');
    ylabel('f(t)');
    title(['N = ', num2str(N)]);
    legend('Simulation','Theory','\pi_1 = 1/4','Location','best');
    grid on;
end