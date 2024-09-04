% Comandos usados no Mini_Curso de MatLAB
%%
%========================= SLIDE 10 =======================================
x = 5
abs(x)          %Valor absoluto de x
acos(x)         %Arco cosseno de x (rad)
asin(x)         %Arco seno de x (rad)
atan(x)         %Arco tangente de x (rad)
cos(x)          %Cosseno de x (rad)
sin(x)          %Seno de x (rad)
tan(x)          %Tangente de x (rad)
exp(x)          %Exponencial (e^x)
log(x)          %Logaritmo natural (base e)
log10(x)        %Logaritmo na base 10
sqrt(x)         %Raiz quadrada
factorial(x)    %Fatorial de x (x!)
%%
%========================= SLIDE 12 & 13 ==================================
distância = 100     %Exemplo de variavel com acento
Distancia = 20      % diferencia maisculo/minusculo (case sensitive)
distancia = 100     % diferencia maisculo/minusculo (case sensitive)
tempo = 3           %declando uma variavel
% calculo de velocidade media
velocidade_media = distancia / tempo
% Para suprimir a exibicao da variavel adicionamos um ponto-e-v?rgula ao
% final do comando.
%%
%========================= SLIDE 14 =======================================
% Formatacao de dados numericos
n = 12.345678901234567
format short      %4 digitos decimais (formato padrao) 12.3457
n_short = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long       %14 digitos decimais 12.345678901234567
n_long = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format short e    %5 digitos mais expoente 1.2346e+001
n_short_e = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format short g    %5 digitos no total com ou sem expoente 12.346
n_short_g = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long e     %15 digitos mais expoente 1.234567890123457e+001
n_long_e = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long g     %15 digitos no total com ou sem expoente 12.3456789012346
n_long_g = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format bank       %Formato monetario 12.35
n_bank = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format hex        %Exibicao hexadecimal de bits 4028b0fcd32f707a
n_hex = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format rat        %Razao aproximada entre interios pequenos 1000/81
n_rat = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format compact    %Elimina espacos (+informacao mostrada na tela)
n_compact = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format loose      %Adiciona espacos entre linhas
n_loose = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format +          %Exibe somente o sinal do numero
n_mais = n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% PADRAO
format short
%%
% clc
%========================= SLIDE 15 =======================================
% Ordem de Procedencia
exemplo_1 = 6/2*3 
exemplo_2 =12/2 + 3*(2^4)
%%
clc
clear tempo
%========================= SLIDE 16 =======================================
% Variaveis predefinidas
n_pi = pi              %3.141592653589793
maior_que_um = eps     %Somado a 1, cria um numero maior do que 1
% NaN                  %Nao numero (not a number)
menor_real = realmin   %menor numero real positivo
maior_real = realmax   %maior numero real positivo
% inf                  %Infinito
infinito = realmax/realmin
%%
clear
clc
%========================= SLIDE 18 =======================================
% Declarando Variaveis: Vetor
[1 2 3]          %Vetor linha (covetor)
[1,2,3]          %Vetor linha (covetor) com virgula
[1;2;3]          %Vetor coluna
%========================= SLIDE 19 =======================================
A = 1:1:5            %Outra forma de criar um conjunto
X = linspace(0,pi,4) %Gera um vetor linearmente espacado
V = logspace(0,2,5)  %Gera um vetor logaritmicamente espacado
%========================= SLIDE 20 =======================================
B=2*A;
Y=sin(X);
% Qual sera a resposta?
Z_1 =A.^2;
Z_2 =A^2;
%%
clear
clc
%========================= SLIDE 22 =======================================
% Declarando Variaveis: Matriz
M = [1,0,-1;2,3,4;-7,1,3];
M = [1 0 -1; 2 3 4; -7 1 3];
% Identifica o elemento da Segunda linha e Terceira coluna.
M(2,3)
M(8)
%%%%% Erro
M(10)
%========================= SLIDE 24 =======================================
%  Mx foi gerada concatenando-se o vetor b transposto e as colunas
%  2 e 3 da matriz M.
b=[2,-3,1];
Mx=[b',M(:,2:3)]
%========================= SLIDE 25 =======================================
% Algumas matrizes Predefinidas e funcoes
% size(Mx)      Retorna o numero de linhas e de colunas de Mx
% length(Mx)    A maior dimensao da matriz Mx
% inv(Mx)       Calcula a matriz inversa de Mx
% zeros(n,m)    Matriz de zeros com n linhas e m colunas
% eye(n,m)      Matriz identidade com n linhas e m colunas
% ones(n,m)     Matriz com 1, com n linhas e m colunas
% det(Mx)       Calcula o determinante da matriz Mx
%%%%%%%%
% Qual sera a resposta?
inversa_1 = inv([2,-3,1]);
inversa_2 = inv(eye(size(Mx)));
tamano = length(Mx);
identi_2 = eye(2);
zeros_3 = zeros(3);
um_3 = ones(3);
[n,m] = size(Mx);
%========================= SLIDE 27 =======================================
% Algumas funcoes
A1 = [2 0 -1;-3 3 4;1 1 3];
b1 = [9;8;7];
A2 = [2 0 -1;3 3 4];
b2 = [9;8];
x_com_inv = inv(A)*b;
x_com_barra = A\b;
% Pseudo-inversa
x_pseudo = A2'*inv(A2*A2')*b2;
% Algumas funcoes
% who Exibe uma lista de variaveis declaradas/ativas na memoria
% whos Exibe uma lista de variaveis declaradas na memoria, com o
% respectivo tamanho em bytes e a classe de armazenamento
%%
clc
clear
%========================= SLIDE 29 =======================================
% GRAFICOS
x = 0:1:10;
y = x.^2-10.*x+15;
plot(x,y);
%%%%
%========================= SLIDE 31 =======================================
grid;
%========================= SLIDE 35 =======================================
x=0:1:10;
y=cos(x);
z=sin(x);
plot(x,y,':rv',x,z,'-.mh');
grid;
%========================= SLIDE 37 =======================================
plot(x,y,':rv',x,z,'-.mh','linewidth',3,'markersize',10,...
    'markeredgecolor','g','markerfacecolor','y');
grid;
%========================= SLIDE 39 =======================================
plot(x,y,':rv',x,z,'-.mh','linewidth',3,'markersize',10,...
     'markeredgecolor','g','markerfacecolor','y');
grid;
xlabel('Eixo x');
ylabel('Eixo y');
title('Exemplo de Formatação')
text(x(6),y(6),'Cos(x)')
text(x(4),z(4),'Sen(x)')
axis([1,9,-0.8,0.8])
legend('Cosseno','Seno','location','northwestoutside')
%========================= SLIDE 42 =======================================
% SUBPLOT
subplot(2,2,1)
t = 0:0.01:2*pi;
prim = sin(2*t).*cos(2*t);
polar(t,prim,'--r');grid
title('Polar')
subplot(2,2,2)
x = 0:0.1:10;
semilogx(10.^x,x);grid
title('Semilogx')
subplot(2,2,3)
x = logspace(-1,2);
loglog(x,exp(x),'-s');grid
title('Loglog')
subplot(2,2,4)
X = 0:pi/10:pi;
Y = sin(X);
E = std(Y)*ones(size(X));
errorbar(X,Y,E);grid
title('Errorbar')
%========================= SLIDE 44 =======================================
%  PLOT 3D
t = 0:pi/50:10*pi;
plot3(sin(t),cos(t),t)
xlabel('sin(t)')
ylabel('cos(t)')
zlabel('t')
grid;
axis square
%%
clc
clear
%      PLOT INTERATIVO
%========================= SLIDE 46 =======================================
t = 0:pi/50:10*pi;
y = sin(t);
%%
clc
clear
%      OPERADORES LOGICOS
%========================= SLIDE 57 =======================================
A= 5; B= -3;
eq(A,B) %A igual a B.
ne(A,B) %A diferente de B. A?=B
lt(A,B) %A menor que B. A<B 
gt(A,B) %A maior que B. A>B 
le(A,B) %A menor ou igual que B. A<=B 
ge(A,B) %A maior ou igual que B. A>=B 
%========================= SLIDE 58 =======================================
% A&B 
% A|B
% ?A 
xor(7,0)            %Ou Exclusivo
all([6 2 3 6 7])
%========================= SLIDE 59 =======================================
any([6 0 3 0 0])
find([0 9 4 3 7])
find([0 9 4 3 7]>4)
%%
clc
clear
%      CONTROLADORES DE FLUXOS
%========================= SLIDE 62 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%% FOR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:10
v(i) = 3*i;
end
%========================= SLIDE 63 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%% WHILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 1;
while prod(1:n) < 10e100
n = n +1;
end
% O que e prod??
% Digite: help prod
%========================= SLIDE 64 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%% IF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii = 1:5
    if ii == 3;
        break;
    end
end
%========================= SLIDE 65 =======================================
%%%%%%%%%%%%%%%%%%%%%%%% IF-ELSE - END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vetor = ['A','B','C','D','E','F','G','H','I','J','L','M','N','O',...
         'P','Q','R','S','T','U','V','W','X','Z'];
n = length(vetor);
for i = 1:n
    if i == 20
        msg(1) = vetor(i);
    elseif i == 6
        msg(2) = vetor(i);
    elseif i == 1
        msg(3) = vetor(i);
    elseif i == 2
        msg(4) = vetor(i);
    elseif i == 3
        msg(5) = vetor(i);
    else
        continue;
    end
end
%========================= SLIDE 67 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SWITCH %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dia = today;         % today retorna o dia na forma serial
switch weekday(dia)  % retorna o dia da semana (1 - 7)
    case 1
        display('Domingo');
    case 2
        display('Segunda');
    case 3
        display('Terça');
    case 4
        display('Quarta');
    case 5
        display('Quinta');
    case 6
        display('Sexta');
    case 7
        display('Sábado');
    otherwise
        display('Valor Inválido');
end
%%
clc
clear
%      Variavel Simbolica
%========================= SLIDE 69 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ver symbolic
x = sym('x');                    % declarando variavel x como symbolic
A = [sin(x),x;cos(x),x]
%========================= SLIDE 70 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comando sym:
a = sym('alpha');
% Comando syms:
syms x a y;
%========================= SLIDE 71 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_1 = sym('x','real')     %Assume que a variavel x e real.
x_2 = sym('x','positive') %Assume que x e real e positivo.
x_3 = sym('x','clear')    %Limpa o que havia assumido.
m=3; n=2;
x_4 = sym('x',[m n])      %Cria uma matriz m por n.
x_5 = sym('x',n)          %Cria uma matriz n por n.
x_6 = sym('x',flag)       %Cria um escalar numerico ou matriz.
%%%%%%%%%%%%%%%%%%%%%%%
sym(4/3,'r')    %’r’ (racional)
sym(4/3,'d')    %’d’ (decimal) 
sym(4/3,'e')    %’e’ (erro estimado) 
sym(4/3,'f')    %’f’ (ponto flutuante) 
%========================= SLIDE 72 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integral
x = sym('x');
y = int(exp(x)*sin(x))
%%%%%%%%%%%%%%%%%
% Eq.  2 grau
eq2 = sym('a*x^2+b*x+c');
s = solve(eq2,'x')
%%%%%%%%%%%%%%%%%
% Visualizacao
visual_s = pretty(s)
%%%%%%%%%%%%%%%%%
% Derivada parcial
d = diff(y,x,1)
d2 = diff(y,x,2)
%%%%%%%%%%%%%%%%%
% Limite
syms h
limite = limit((sin(x+h)-sin(x))/h,h,0)
%%%%%%%%%%%%%%%%%
% Simplifica
simplifi_derivada = simplify(d)
%%%%%%%%%%%%%%%%%
% Expande
expande_seno = expand(sin(h+x))
%%%%%%%%%%%%%%%%%
% Agrupar
f=4*x*exp(x)+3*exp(x);
agrupar_exp = collect(f,exp(x))
%%%%%%%%%%%%%%%%%
% Sustituicao
subs(y,x,pi)
%========================= SLIDE 73 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms h x
li=limit((sin(x+h)-sin(x))/h,h,0);
ezplot(li,[-2*pi,2*pi])
%========================= SLIDE 76 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dh = clock;
str_dh = sprintf('%04d-%02d-%02d %02d:%02d:%02.0f',...
                 dh(1),dh(2),dh(3),dh(4),dh(5),dh(6))
sprintf('Alfabeto \n%s',65:89)
% quebrei em dois somente para caber na folha
f1=('Em caso de emergência:\nPolícia:%1.0f%d%1.0f\nBombeiros:');
f2=('%c%c%1.0f\nPizza: Anuncie aqui');
f = [f1 f2];
sprintf(f,1.3*cos(2-2),9,sin(2-2),'1','9',pi)
%========================= SLIDE 77 =======================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = 0:10;
y = sin(x);
xi = 0:.25:10;
yi = interp1(x,y,xi);
plot(x,y,'o',xi,yi);grid