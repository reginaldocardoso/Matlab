% Este e o arquivo principal para a resolução do modelo da suspensao
%%
clear all
close all
clc
%% 
asf_t = linspace(0,20,900); % gera o tempo da entrada asfalto
u=zeros(1,900/3);
asf=[u, ones(1,900/3), u];
T_sim = [0 20];
Cond_Ini = [0;0;0;0];
%%
[t,x,dot_x]= ode45(@(t,x,dot_x) modelo_suspensao_passiva(t,x,asf_t,asf),...
                    T_sim,Cond_Ini);
%%
x(:,5) = interp1(asf_t,asf,t);
%%
figures = plot_EDO_v1(t,x);


