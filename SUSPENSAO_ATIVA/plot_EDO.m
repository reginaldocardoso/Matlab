function figures = plot_EDO(t,x,F,opts)
%CREATEFIGURE(T1,Y1)
%  t:  vector of x data
%  x:  vector of y data
%  F:  vector of force
%  opts: [Ativa/Passiva,Asfalto]
%           Passiva == 1
%           Ativa == 2
%           Passiva e Ativa == 3
%           Seno == 1
%           Quadrado == 2

%%
if norm(F,2) == 0 && opts(1)== 2
    if opts(2)== 1
        title_str = ('Suspensão Ativa,Força Nula,Entrada Senoidal');
    elseif opts(2) == 2
        title_str = ('Suspensão Ativa,Força Nula,Entrada Quadrada');
    else
        title_str = ('Suspensão Ativa,Força Nula,Erro');
    end
    resposta = sprintf('\nNorma do vetor força:\n%d',norm(F,2))
elseif norm(F,2) == 0 && opts(1) == 1
    if opts(2)== 1
        title_str = ('Suspensão Passiva,Entrada Senoidal');
    elseif opts(2) == 2
        title_str = ('Suspensão Passiva,Entrada Quadrada');
    else
        title_str = ('Suspensão Passiva,Erro');
    end
    resposta = sprintf('\nNorma do vetor força:\n%d',norm(F,2))
elseif norm(F,2) ~= 0 && opts(1) == 2
    if opts(2)== 1
        title_str = ('Suspensão Ativa,Força Nula,Entrada Senoidal');
    elseif opts(2) == 2
        title_str = ('Suspensão Ativa,Força Nula,Entrada Quadrada');
    else
        title_str = ('Suspensão Ativa,Força Nula,Erro');
    end
    resposta = sprintf('\nNorma do vetor força:\n%d',norm(F,2))
elseif norm(F,2) == 0 && opts(1) == 3
    if opts(2)== 1
        title_str = ('Suspensão Passiva,Entrada Senoidal');
    elseif opts(2) == 2
        title_str = ('Suspensão Passiva,Entrada Quadrada');
    else
        title_str = ('Suspensão Passiva,Erro');
    end
    resposta = sprintf('\nNorma do vetor força:\n%d',norm(F,2))
elseif norm(F,2) ~= 0 && opts(1) == 3
    if opts(2)== 1
        title_str = ('Suspensão Ativa,Força Nula,Entrada Senoidal');
    elseif opts(2) == 2
        title_str = ('Suspensão Ativa,Força Nula,Entrada Quadrada');
    else
        title_str = ('Suspensão Ativa,Força Nula,Erro');
    end
    resposta = sprintf('\nNorma do vetor força:\n%d',norm(F,2))   
else
    title_str = ('Erro');
end

%%
x1 = x(:,1);
x2 = x(:,2);
x3 = x(:,3);
x4 = x(:,4);
zr = x(:,5);
%%
figures = figure;   % Create figure
subplot(2,2,1)
plot(t,x1,'b','LineWidth',3);grid;% Create plot
title(title_str)
xlabel('Tempo (s)');
ylabel(sprintf('Deslocamento (m)\n x_%d',1));

subplot(2,2,2)
plot(t,x2,'','LineWidth',3);grid;% Create plot
title(title_str)
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');

subplot(2,2,3)
plot(t,x3,'','LineWidth',3);grid;% Create plot
title(title_str)
xlabel('Tempo(s)');
ylabel('Deslocamento (m)');

subplot(2,2,4)
plot(t,x4,'','LineWidth',3);grid;% Create plot
title(title_str)
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');

figures = figure;   % Create figure
plot(t,x2,'',t,x4,'',t,zr,':r','LineWidth',3);grid;
% axis([0 20 -1 2])
title(title_str)
xlabel('Tempo');
ylabel('Velocidade');
title('Velocidade');
legend('dZ_s','dZ_{us}','Z_r');
%% ou pode-se otimizar o codigo
figures = figure;   % Create figure
for i = [1,3]
    subplot(2,2,i)
    plot(t,x(:,i),'b','LineWidth',3);grid;% Create plot
    title(title_str)
    xlabel('Tempo (s)');
    ylabel(sprintf('Deslocamento (m)\nVariável x_%d',i));
    i=i+1;
    subplot(2,2,i)
    plot(t,x(:,i),'','LineWidth',3);grid;% Create plot
    title(title_str)
    xlabel('Tempo (s)');
    ylabel(sprintf('Velocidade(m/s)\nVariável x_%d',i));
end

