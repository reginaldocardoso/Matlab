%   Este e o arquivo DEVE ser simulado primeiro para carregar os
%   valores das matrizes no WORKSPACE, so entao simular o 
%   Suspensao_Ativa.mdl ou Suspensao_Ativa.slx
%%
clear all
close all
clc
%% CONSTANTES
B_s=7.5;
B_us = 5;
K_s=900;
K_us=2500;
M_s=2.45;
M_us=1;
%% MATRIZES
A = [       0,       1,         0,              -1;
     -K_s/M_s,-B_s/M_s,         0,         B_s/M_s;
            0,       0,         0,               1;
     K_s/M_us,B_s/M_us,-K_us/M_us,-(B_s+B_us)/M_us];
%=========================================================================
B = [          0,      0;
               0,  1/M_s;
              -1,      0;
     (B_us/M_us),-1/M_us];
%=========================================================================
C = [eye(4);
           1,       0,0,      0;
    -K_s/M_s,-B_s/M_s,0,B_s/M_s]; % A(2,:)
%=========================================================================
D = [zeros(4,2);0,0;0,1/M_s];   %B(2,:)
%% CONTROLE, MATRIZ K
% O controle escolhido foi o LQR, pois ele ja vem com o kit
% Q = [0.01,zeros(1,3);zeros(3,4)];
% R = 0.01;
% K = lqr(A,B(:,2),Q,R);
% obtem-se:
K = [24.66 48.87 -0.47 3.68];

 
 
 
 
 
 
 
 