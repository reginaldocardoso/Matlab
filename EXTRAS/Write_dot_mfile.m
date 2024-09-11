function Write_dot_mfile(nome_file,x_SS,EE,DAF_syms,DAM_syms,DBF_syms,DBM_syms,answer)
% StructToParameter
% -------------------------------------------------------------------------
x_SS_function=sym('x_SS_%d',size(x_SS));
% -------------------------------------------------------------------------
for i=1:length(x_SS)
    eval(['syms',' ','x_SS_',num2str(i)]);
end
EE = [EE(7:12,1); EE(1:6,1)];
% -------------------------------------------------------------------------
DAF=subs(DAF_syms,EE(1:length(x_SS)),x_SS_function);
DAM=subs(DAM_syms,EE(1:length(x_SS)),x_SS_function);
DBF=subs(DBF_syms,EE(1:length(x_SS)),x_SS_function);
DBM=subs(DBM_syms,EE(1:length(x_SS)),x_SS_function);
% -------------------------------------------------------------------------
% DAF_num=subs(eval(DAF),x_SS,x_SS_function);
% DAM_num=subs(eval(DAM),x_SS,x_SS_function);
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    eval(['DAF_',num2str(i),'_char','=',...
        'char(DAF(',num2str(i),')',')',';'])
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    eval(['DAM_',num2str(i),'_char','=',...
        'char(DAM(',num2str(i),')',')',';'])
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    eval(['DBF_',num2str(i),'_char','=',...
        'char(DBF(',num2str(i),')',')',';'])
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    for j=1:(length(x_SS)/4)
        eval(['DBM_',num2str(i),'_',num2str(j),'_char','=',...
            'char(DBM(',num2str(i),',',num2str(j),')',')',';'])
    end
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
if answer == 'UAV+Payload'
    nome_file= char(nome_file);
    nome_open=sprintf('%s.m',nome_file);
    nome_function=sprintf('function x_dot=%s(x,SWITCH,Fz,Mx,My,Mz)\n',nome_file);
    fid=fopen(nome_open,'w+');
    fprintf(fid,nome_function);
    fprintf(fid,'\n');
    fprintf(fid,'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    fprintf(fid,'\n');
    fprintf(fid,'% Case SWITCH == 0 UAV whitout Payload (only vehicle simulation)');
    fprintf(fid,'\n');
    fprintf(fid,'% Case SWITCH == 1 UAV with Payload Simulation (UAV+Payload)');
    fprintf(fid,'\n');
    fprintf(fid,'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
else
    nome_file= char(nome_file);
    nome_open=sprintf('%s.m',nome_file);
    nome_function=sprintf('function x_dot=%s(x,Fz,Mx,My,Mz)\n',nome_file);
    fid=fopen(nome_open,'w+');
    fprintf(fid,nome_function);
end
fprintf(fid,'\n');
fprintf(fid,'Parameters');
fprintf(fid,';\n');
fprintf(fid,['x_dot','=','zeros(',num2str(length(x_SS)),',1)']);
fprintf(fid,';\n');
fprintf(fid,['Delta_BM','=','zeros(',num2str((length(x_SS)/4)),',',num2str((length(x_SS)/4)),')']);
fprintf(fid,';\n');
fprintf(fid,['Delta_AF','=','zeros(',num2str((length(x_SS)/4)),',1)']);
fprintf(fid,';\n');
fprintf(fid,['Delta_AM','=','zeros(',num2str((length(x_SS)/4)),',1)']);
fprintf(fid,';\n');
fprintf(fid,['Delta_BF','=','zeros(',num2str((length(x_SS)/4)),',1)']);
fprintf(fid,';\n');
% -------------------------------------------------------------------------
for i=1:length(x_SS)
    fprintf(fid,['x_SS_',num2str(i),'=','x(',num2str(i),')']);
    fprintf(fid,';\n');
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    fprintf(fid,['Delta_AF(',num2str(i),')','=',...
        eval(['DAF_',num2str(i),'_char'])]);
    fprintf(fid,';\n');
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    fprintf(fid,['Delta_AM(',num2str(i),')','=',...
        eval(['DAM_',num2str(i),'_char'])]);
    fprintf(fid,';\n');
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    fprintf(fid,['Delta_BF(',num2str(i),')','=',...
        eval(['DBF_',num2str(i),'_char'])]);
    fprintf(fid,';\n');
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    for j=1:(length(x_SS)/4)
        fprintf(fid,['Delta_BM(',num2str(i),',',num2str(j),')','=',...
            eval(['DBM_',num2str(i),'_',num2str(j),'_char'])]);
        fprintf(fid,';\n');
    end
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
x1dot_str=sprintf('x_dot(1:%s,1)=x(%s:end)',num2str(length(x_SS)/2),num2str(1+(length(x_SS)/2)));
fprintf(fid,x1dot_str);
fprintf(fid,';\n');
% -------------------------------------------------------------------------
% x2dot_str=sprintf('x_dot(%s:end,1)=-inv(M)*(C+D+G+B*[Fz;Mx;My;Mz])',num2str(1+(length(x_SS)/2)));
x2dot_str=sprintf('x_dot(%s:end,1)=[Delta_AF;Delta_AM]+[Delta_BF,zeros(3,3);zeros(3,1),Delta_BM]*[Fz;Mx;My;Mz]',num2str(1+(length(x_SS)/2)));
fprintf(fid,x2dot_str);
fprintf(fid,';\n');
% -------------------------------------------------------------------------
fclose(fid);
cd(pwd);
