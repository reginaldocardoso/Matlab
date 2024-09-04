% Este e o arquivo principal para a resolucao do modelo da suspensao
%%
clear all
close all
clc
%% SELECAO ASFALTO
% input_asf = 1;    % ENTRADA SENO
input_asf = 2;    % ENTRADA QUADRADA
%% SELECAO SUSPENSAO
input_susp = 1;    % Passiva
% input_susp = 2;    % Ativa
% input_susp = 3;    % Ativa + Passiva
%% 
asf_t = linspace(0,20,900); % gera o tempo da entrada asfalto
T_sim = [0 20];
Cond_Ini = [0;0;0;0];
if input_asf ==1
    asf = sin(asf_t);
elseif input_asf == 2
    u=zeros(1,900/3);
    asf=[u, ones(1,900/3), u];
end
%%
if input_susp ==1
    [t,x]=ode45(@(t,x) modelo_suspensao_passiva(t,x,asf_t,asf),...
                  T_sim,Cond_Ini);
    x(:,5) = interp1(asf_t,asf,t);
    opts = [input_susp,input_asf];
    F=0;
    figures = plot_EDO(t,x,F,opts);
elseif input_susp == 2
    K = [24.66 48.87 -0.47 3.68];
    [t,x,F]=ode45(@(t,x,F) modelo_suspensao_ativa(t,x,asf_t,asf,K),...
                    T_sim,Cond_Ini);
    x(:,5) = interp1(asf_t,asf,t);
    opts = [input_susp,input_asf];
    figures = plot_EDO(t,x,F,opts);    
elseif input_susp == 3
    [t,x]=ode45(@(t,x) modelo_suspensao_passiva(t,x,asf_t,asf),...
                  T_sim,Cond_Ini);
    x(:,5) = interp1(asf_t,asf,t);
    opts = [input_susp,input_asf];
    F=0;
    figures = plot_EDO(t,x,F,opts);
    %%
    K = [24.66 48.87 -0.47 3.68];
    [t,x,F]=ode45(@(t,x,F) modelo_suspensao_ativa(t,x,asf_t,asf,K),...
                    T_sim,Cond_Ini);
    x(:,5) = interp1(asf_t,asf,t);
    opts = [input_susp,input_asf];
    figures = plot_EDO(t,x,F,opts);      
else
    sprintf('\nErro, variável\n input_susp=%d',input_susp)
end
