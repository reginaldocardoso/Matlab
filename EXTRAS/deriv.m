function fout=deriv(f,g)
% calcula a derivada parcial, por exemplo
% syms t x(t) y(t)
% f=x(t)^2+y(t)^2
% deriv(f,y)= 2*y(t)
% caso a segunda entrada seja um vetor, 
% PODE DAR ERRADO, VERIFIQUE O TAMANHO DA SEGUNDA ENTRADA (size(g)=?)
% g=[x(t);y(t)];
% deriv(f,g)= 2*y(t)
%  CALULAR A JACOBIANA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms t x dx
lx={dx,x};
if length(g)==1
    lg={diff(g,t),g};
    f1=subs(f,lg,lx);
    f2=diff(f1,x);
    fout=subs(f2,lx,lg);
else
    for i=1:length(g)
        lg(i,1:2)={diff(g(i,1),t),g(i,1)};
        f1(i,1:2)=subs(f,lg(i,1:2),lx);
        f2(i,1:2)=diff(f1(i,1:2),x);
        fout(i,1:2)=subs(f2(i,1:2),lx,lg(i,1:2));
    end
end