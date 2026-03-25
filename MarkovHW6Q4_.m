x0 = 1;
last_check = 200;
p = 1 - 0.49;
N = 1000;
Instances_of_ext = 0;

Q = (1 - sqrt(1-4.*(0.49 - (0.49).^2)))./(2.*p); %theroetical value from part a

figure
hold on

for i = 1:N    %loop for 1000 chanins
    
    %simulating 1 chain- for 200 steps
    xn = zeros(1, last_check + 1);
    xn(1) = x0;
    
    for j = 1:last_check
        zn = binornd(xn(j), p);
        
        if zn == 0    %if for a genration no one reproduces then the chain has gon extinct as 2*0 = 0
            Instances_of_ext = Instances_of_ext + 1;
            break
        end
        
        xn(j+1) = 2 * zn;
    end

    %add to the plot
    plot(0:last_check, xn)
end

hold off
xlabel('n (genreation / time step)')
ylabel('X_n (population size of the chain)')
title(' X_n of 1000 simulated binary chains')
grid on


disp(['The number of chains that went extinct were: ' num2str(Instances_of_ext)])
disp(['The probability of extinction was: ' num2str(Instances_of_ext / N)])

disp(['When we plug in values to our algebraiclly obtained value for the probability of extinction was: ' num2str(Q)])