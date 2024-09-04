function dot_xa = modelo_suspensao_ativa(t,xa,asf_t,asf,K,F)
% Esta funcao descreve a modelagem de uma suspensao passiva, onde:
% x(1) = Z_s - Z_us
% x(2) = dot_Z_s
% x(3) = Z_us - Z_r
% x(4) = dot_Z_us
%%
B_s=7.5;
B_us = 5;
K_s=900;
K_us=2500;
M_s=2.45;
M_us=1;
F = -K*xa;
dotZ_r = interp1(asf_t,asf,t);
%%
dot_xa(1) = xa(2) - xa(4);
dot_xa(2) = -(K_s/M_s)*xa(1) -(B_s/M_s)*(xa(2)-xa(4))+(F/M_s);
dot_xa(3) = xa(4)-dotZ_r;
dot_xa(4) = (K_s/M_us)*xa(1)+(B_s/M_us)*xa(2)-((B_s+B_us)/M_us)*xa(4)...
           -(K_us/M_us)*xa(3)-(F/M_us)+(B_us/M_us)*dotZ_r;
dot_xa = [dot_xa(1);dot_xa(2);dot_xa(3);dot_xa(4)];
end