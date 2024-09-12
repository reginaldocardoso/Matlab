function output = Modelo_SA(input)
% Modelo da Suspensao Ativa
% input(1)= X_1
% input(2)= X_2
% input(3)= X_3
% input(4)= X_4
% input(5) = Z_r
% input(6) = F
% 
% output(1)= X_1
% output(2)= X_2
% output(3)= X_3
% output(4)= X_4
% output(5)= Y_1
% output(6)= Y_2
%=========================================================================
x = [input(1);input(2);input(3);input(4)];
Z_r = input(5);
F = input(6);
%=========================================================================
%% CONSTANTES
B_s=7.5;
B_us = 5;
K_s=900;
K_us=2500;
M_s=2.45;
M_us=1;
%=========================================================================
%%
output(1) = x(2) - x(4);
output(2) = -(K_s/M_s)*x(1) -(B_s/M_s)*(x(2)-x(4))+(F/M_s);
output(3) = x(4)-Z_r;
output(4) = (K_s/M_us)*x(1)+(B_s/M_us)*x(2)-((B_s+B_us)/M_us)*x(4)...
           -(K_us/M_us)*x(3)-(F/M_us)+(B_us/M_us)*Z_r;
%=========================================================================
output(5) = x(1);
output(6) = output(2);
%=========================================================================
output = [output(1);output(2);output(3);output(4);output(5);output(6)];
end