%------Initialization---------
close all;
clc;
count = 0;
P_B_given = 0.015;
epsilon = 10^-5;
C = 30;
A_lower = 0;
A_upper = 10^3;

%------Main Step--------------
while A_upper - A_lower > epsilon
   A_mid = (A_upper + A_lower)/2;
   numerator = (A_mid^C)/factorial(C);
   syms k;
   denominator = symsum((A_mid^k)/factorial(k), k, 0, C);
   P_B_tmp = numerator/denominator;
   if P_B_tmp > P_B_given
       A_upper = A_mid;
   else
       A_lower = A_mid;
   end
   count = count + 1;
end

%------Results--------------
A = A_mid;
fprintf("Holding Time: %0.4f\n",A);

