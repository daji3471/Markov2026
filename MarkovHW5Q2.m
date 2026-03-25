a = 0.04;
b = 0.16;
K = 0.1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PART B

P = [ 1-K*exp(a), K*exp(a),              0,                       0,                        0;
      K*exp(b),   1-K*exp(b)-K*exp(2*a), K*exp(2*a),              0,                        0;
      0,          K*exp(2*b),            1-K*exp(2*b)-K*exp(3*a), K*exp(3*a),               0;
      0,          0,                     K*exp(3*b),              1-K*exp(3*b)-K*exp(4*a),  K*exp(4*a);
      0,          0,                     0,                       K*exp(4*b),               1-K*exp(4*b) ];

[V,D] = eig(P');

eigenvalues = diag(D);
[~,idx] = min(abs(eigenvalues - 1));

pi_eigen = V(:,idx);
pi_eigen = pi_eigen / sum(pi_eigen);

fprintf('pi_eigen :')
disp(pi_eigen')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PART C
N = 1e6;                 
counts = zeros(1,5);     % visit counts for states
initial_state = randi(5);
state = initial_state;           

for t = 1:N
    counts(state) = counts(state) + 1;
    
    r = rand();   % random number in [0,1)
    
    if state == 1
        p1 = K*exp(a*1);
        if r < p1
            state = 2;
        else
            state = 1;
        end
        
    elseif state == 2
        q2 = K*exp(b*(2-1));
        p2 = K*exp(a*2);
        if r < q2
            state = 1;
        elseif r < q2 + (1 - q2 - p2)
            state = 2;
        else
            state = 3;
        end
        
    elseif state == 3
        q3 = K*exp(b*(3-1));
        p3 = K*exp(a*3);
        if r < q3
            state = 2;
        elseif r < q3 + (1 - q3 - p3)
            state = 3;
        else
            state = 4;
        end
        
    elseif state == 4
        q4 = K*exp(b*(4-1));
        p4 = K*exp(a*4);
        if r < q4
            state = 3;
        elseif r < q4 + (1 - q4 - p4)
            state = 4;
        else
            state = 5;
        end
        
    elseif state == 5
        q5 = K*exp(b*(5-1));
        if r < q5
            state = 4;
        else
            state = 5;
        end
    end
end

pi_sim = counts / N;
fprintf('pi_sim :')
disp(pi_sim)

figure
bar(1:5, pi_sim)
xlabel('State')
ylabel('Percent of Time')
title('Estimated Stationary Distribution')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PART D

pi_detailb = [ (1./(1 + exp(a-b) + exp(3*(a-b)) + exp(6*(a-b)) + exp(10*(a-b)))), (exp(a-b)./(1 + exp(a-b) + exp(3*(a-b)) + exp(6*(a-b)) + exp(10*(a-b)))), (exp(3*(a-b))./(1 + exp(a-b) + exp(3*(a-b)) + exp(6*(a-b)) + exp(10*(a-b)))), (exp(6*(a-b))./(1 + exp(a-b) + exp(3*(a-b)) + exp(6*(a-b)) + exp(10*(a-b)))),   (exp(10*(a-b))./(1 + exp(a-b) + exp(3*(a-b)) + exp(6*(a-b)) + exp(10*(a-b)))) ];

fprintf('pi_detailb :')
disp(pi_detailb)

data = [pi_detailb; pi_eigen'; pi_sim]';
figure
bar(data)
xlabel('State')
ylabel('Probability')
legend('Detailed Balance','Eigenvector','Simulation')
title('Stationary Distribution Comparison')
grid on

