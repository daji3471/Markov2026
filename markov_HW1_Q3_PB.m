%numerical intergral of f(u) 
f = @(u) 1./(u.^2 + (1./(u.^6)));
I = integral(f,0,1);


%{
integral approx.
row vectors contaning the varriable exponenet of renditions of N, a row
vector to hold the values of E(N)and the 2 vectors that will be ploted 
against echother to obtain the  of the estimated integral as a function of
N 
%}
values_of_n = (1: 0.1 : 5);
points_under_f_for_givenN = zeros(1,length(values_of_n));

values_of_N = zeros(1,length(values_of_n));
ratio_of_points = zeros(1,length(values_of_n));

%{
nested loops to cycle thought renditions of N and
random point genarations N number of times
%}

for i = 1:length(values_of_n)

    N = floor(10.^values_of_n(i));
    counter_for_points_undr_f = 0;
    
     for j = 1:N
      x = rand;
      y = rand; 

      if y < f(x)
          counter_for_points_undr_f = counter_for_points_undr_f + 1;
      end
     end
      points_under_f_for_givenN(i) = counter_for_points_undr_f;
end

%{
now we have a vector full of the renditions of the exponent n and 
the number of point that we "under the curve" and need to get the ratio 
of points below the curve, as well as the N values to obtain the plot of the
estimate of the integral for a given value of N
%}


for k = 1:length(values_of_n)
    values_of_N(k) = floor(10.^values_of_n(k));
    ratio_of_points(k) = points_under_f_for_givenN(k)./(values_of_N(k));
end

plot(values_of_N,ratio_of_points,'o-');
set(gca, 'XScale', 'log');
hold on
yline(I,'k--');
hold off
xlabel('N (number of points sampled)(In log scale)');
ylabel('E(N)');
title('Monte Carlo Estimate of the Integral for Varrious Sample Sizes');
grid on
legend('Monte Carlo estimate', 'True value of integral');