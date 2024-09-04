function dot_x = modelo_suspensao_passiva(t,x,asf_t,asf)
% Esta funcao descreve a modelagem de uma suspensao passiva, onde:
% x(1) = Z_s - Z_us
% x(2) = dot_Z_s
% x(3) = Z_us - Z_r
% x(4) = dot_Z_us
%% 
    B_s=7.5;
    K_s=900;
    K_us=2500;
    M_s=2.45;
    M_us=1;
    dotZ_r = interp1(asf_t,asf,t);
    %%
    dot_x(1) = x(2) - x(4);
    dot_x(2) = -(K_s/M_s)*x(1) -(B_s/M_s)*(x(2)-x(4));
    dot_x(3) = x(4)-dotZ_r;
    dot_x(4) = (K_s/M_us)*x(1)+(B_s/M_us)*(x(2)-x(4))-(K_us/M_us)*x(3);
    dot_x = [dot_x(1);dot_x(2);dot_x(3);dot_x(4)];
end