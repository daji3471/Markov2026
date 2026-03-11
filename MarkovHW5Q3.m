
%%%%%%%%%%%%%%%%%%%%% PART A,B,C
%sym a
a=0.99;
P = [ (1-a), a,     0,                      
      a,     0,     (1-a),      
      0,     (1-a), a ];

[V,D] = eig(P.');

%simplify(V)
disp(V)
%simplify(D)
disp(D)

[V,D] = eig(P');

q0 = [1;0;0];
c = V \ q0;

disp(c)

%%%%%%%%%%%%%%%%%%%% PART D

f = @(a) sqrt(3*a.^2 - 3*a + 1).^(1/2);

eps_val = 1e-8;
[a_min, f_min] = fminbnd(f, 0, 1 - eps_val)

figure
fplot(f,[0, 0.999])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PART E

tot_time_steps = 500;
q_1 = zeros(1,tot_time_steps+1); 

for n = 0:tot_time_steps
    qn = V*(D^n)*c;  
    q_1(n+1) = real(qn(1)); 
end


N1 = 100;
states1 = ones(N1,1);      
f1 = zeros(1,tot_time_steps+1);

N2 = 1000;
states2 = ones(N2,1);     
f2 = zeros(1,tot_time_steps+1);

N3 = 10000;
states3 = ones(N3,1);      
f3 = zeros(1,tot_time_steps+1);


f1(1) = sum(states1 == 1)/N1;

for n = 1:tot_time_steps
    for i1 = 1:N1
        r = rand;

        if states1(i1) == 1
            if r < a
                states1(i1) = 2;
            else
                states1(i1) = 1;
            end

        elseif states1(i1) == 2
            if r < a
                states1(i1) = 1;
            else
                states1(i1) = 3;
            end

        elseif states1(i1) == 3
            if r < 1-a
                states1(i1) = 2;
            else
                states1(i1) = 3;
            end
        end
    end

    f1(n+1) = sum(states1 == 1)/N1;
end

figure
plot(0:tot_time_steps, f1, 'o-')
hold on
plot(0:tot_time_steps, q_1, 'LineWidth', 2)
grid on
xlabel('n')
ylabel('Fraction / Probability in state 1')
title('N = 100')
legend('f_n','q_n(1)','Location','best')


f2(1) = sum(states2 == 1)/N2;

for n = 1:tot_time_steps
    for i2 = 1:N2
        r = rand;

        if states2(i2) == 1
            if r < a
                states2(i2) = 2;
            else
                states2(i2) = 1;
            end

        elseif states2(i2) == 2
            if r < a
                states2(i2) = 1;
            else
                states2(i2) = 3;
            end

        elseif states2(i2) == 3
            if r < 1-a
                states2(i2) = 2;
            else
                states2(i2) = 3;
            end
        end
    end

    f2(n+1) = sum(states2 == 1)/N2;
end

figure
plot(0:tot_time_steps, f2, 'o-')
hold on
plot(0:tot_time_steps, q_1, 'LineWidth', 2)
grid on
xlabel('n')
ylabel('Fraction / Probability in state 1')
title('N = 1000')
legend('f_n','q_n(1)','Location','best')



f3(1) = sum(states3 == 1)/N3;

for n = 1:tot_time_steps
    for i3 = 1:N3
        r = rand;

        if states3(i3) == 1
            if r < a
                states3(i3) = 2;
            else
                states3(i3) = 1;
            end

        elseif states3(i3) == 2
            if r < a
                states3(i3) = 1;
            else
                states3(i3) = 3;
            end

        elseif states3(i3) == 3
            if r < 1-a
                states3(i3) = 2;
            else
                states3(i3) = 3;
            end
        end
    end

    f3(n+1) = sum(states3 == 1)/N3;
end

figure
plot(0:tot_time_steps, f3, 'o-')
hold on
plot(0:tot_time_steps, q_1, 'LineWidth', 2)
grid on
xlabel('n')
ylabel('Fraction / Probability in state 1')
title('N = 10000')
legend('f_n','q_n(1)','Location','best')