function figures = plot_EDO_v1(t,x)
%  t:  vector of x data
%  x:  vector of y data
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
title('Variável x1')
xlabel('Tempo (s)');
ylabel(sprintf('Deslocamento (m)\n x_%d',1));

subplot(2,2,2)
plot(t,x2,'','LineWidth',3);grid;% Create plot
title('Variável x2')
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');

subplot(2,2,3)
plot(t,x3,'','LineWidth',3);grid;% Create plot
title('Variável x3')
xlabel('Tempo(s)');
ylabel('Deslocamento (m)');

subplot(2,2,4)
plot(t,x4,'','LineWidth',3);grid;% Create plot
title('Variável x4')
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');

figures = figure;   % Create figure
plot(t,x2,'',t,x4,'',t,zr,':r','LineWidth',3);grid;
% axis([0 20 -1 2])
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Velocidades');
legend('dZ_s','dZ_{us}','Z_r');


