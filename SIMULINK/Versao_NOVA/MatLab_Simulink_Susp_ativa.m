%   Este e o arquivo, carrega os parametros do modelo 
%   (suspensao ativa, QUANSER), faz a simulacao do arquivo 
%   (,simulink) e por fim faz os plot 
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
%% SELECAO
Sel_Asfalto = 1;    % Onda quadrada
% Sel_Asfalto = 2;  % Senoidal
%=========================================================================
Sel_Forca = 1;      % Controle K
% Sel_Forca = 2;    % Zero
%=========================================================================
% Sel_Planta = 1;    % Planta Block State Space
Sel_Planta = 2;    % Planta Interpreted MATLAB Function
%% Simulacao SIMULINK
Simu_MAT_SIM_SA = sim('MAT_SIM_SA.slx',[0 10]);
%% Graficos
%=========================================================================
% Qual e o controle 
if Sel_Forca == 1
    title_F = sprintf('Controle, K = [%1.2f %1.2f %1.2f %1.2f] ',K);
elseif Sel_Forca == 2
    title_F = ('Sem Controle ');
else
    title_F = sprintf('Erro na Variável\n Sel_Forca = %d',Sel_Forca);
end
%=========================================================================
% Qual e o modelo
if Sel_Planta == 1
    title_P = (' State Space');
elseif Sel_Planta == 2
    title_P = (' Interpreted MATLAB Function');
else
    title_P = sprintf('Erro na Variável\n Sel_Planta = %d',Sel_Planta);
end
%=========================================================================
% Juntando os dois
title_str = [title_F title_P];
%=========================================================================
%%
F = forca(:,2);
Z_r = Z(:,2);
Z_s = Z(:,3);
Z_us = Z(:,4);
%=========================================================================
figuras(1) = figure;  
for i = [1,3]
    subplot(2,2,i)
    plot(tempo,XX(:,i),'b','LineWidth',3);grid;% Create plot
    title(title_str)
    xlabel('Tempo (s)');
    ylabel(sprintf('Deslocamento (m)\nVariável x_%d',i));
    i=i+1;
    subplot(2,2,i)
    plot(tempo,XX(:,i),'','LineWidth',3);grid;% Create plot
    title(title_str)
    xlabel('Tempo (s)');
    ylabel(sprintf('Velocidade(m/s)\nVariável x_%d',i));
end
%=========================================================================
figuras(2) = figure;   % Create figure
plot(tempo,Z_s,'',tempo,Z_us,'',tempo,Z_r,':r','LineWidth',3);grid;
title(title_str)
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
legend('dZ_s','dZ_{us}','Z_r');
%=========================================================================
figuras(3) = figure;   % Create figure
plot(tempo,F,'','LineWidth',3);grid;
title(title_str)
xlabel('Tempo (s)');
ylabel('Força (N)');