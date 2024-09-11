function Write_dot_pyfile(nome_file,x_SS,EE,DAF_syms,DAM_syms,DBF_syms,DBM_syms,List_Of_Var_Strg)
% StructToParameter
% -------------------------------------------------------------------------
x_SS_function=sym('x_SS_%d',size(x_SS));
% -------------------------------------------------------------------------
for i=1:length(x_SS)
    eval(['syms',' ','x_SS_',num2str(i)]);
end
EE = [EE(7:12,1); EE(1:6,1)];
% -------------------------------------------------------------------------
old_keywords = {'^2'};
new_keywords = {'**2'};
DAF=subs(DAF_syms,EE(1:length(x_SS)),x_SS_function);
DAM=subs(DAM_syms,EE(1:length(x_SS)),x_SS_function);
DBF=subs(DBF_syms,EE(1:length(x_SS)),x_SS_function);
DBM=subs(DBM_syms,EE(1:length(x_SS)),x_SS_function);
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    eval(['DAF_',num2str(i),'_char','=',...
        'char(DAF(',num2str(i),')',')',';'])
    testeDAF = sprintf('DAF_%s_char',num2str(i));
    eval(['DAF_',num2str(i),'_char','=',replace(testeDAF,old_keywords,new_keywords),';']);
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    eval(['DAM_',num2str(i),'_char','=',...
        'char(DAM(',num2str(i),')',')',';'])
    testeDAM = sprintf('DAM_%s_char',num2str(i));
    eval(['DAM_',num2str(i),'_char','=',replace(testeDAM,old_keywords,new_keywords),';']);
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    eval(['DBF_',num2str(i),'_char','=',...
        'char(DBF(',num2str(i),')',')',';'])
    testeDBF = sprintf('DBF_%s_char',num2str(i));
    eval(['DBF_',num2str(i),'_char','=',replace(testeDBF,old_keywords,new_keywords),';']);
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    for j=1:(length(x_SS)/4)
        eval(['DBM_',num2str(i),'_',num2str(j),'_char','=',...
            'char(DBM(',num2str(i),',',num2str(j),')',')',';'])
        testeDBM = sprintf('DBM_%s_%s_char',num2str(i),num2str(j));
    eval(['DBM_',num2str(i),'_char','=',replace(testeDBM,old_keywords,new_keywords),';']);
    end
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
nome_file= char(nome_file);
nome_open=sprintf('%s.py',nome_file);
fid=fopen(nome_open,'w+');
fprintf(fid,'"""');
fprintf(fid,'\n');
fprintf(fid,'Author : Reginaldo cardoso');
fprintf(fid,'\n');
fprintf(fid,'e-mail: reginaldo.cardoso85@gmail.com');
fprintf(fid,'\n');
fprintf(fid,'PROGRAM OF GRADUATION OF UNIVERSITY OF SAO PAULO');
fprintf(fid,'\n');
fprintf(fid,'PhD IN MECHANICAL ENGENEERING');
fprintf(fid,'\n');
fprintf(fid,'################################################################################');
fprintf(fid,'\n');
fprintf(fid,'IMPORT PACKAGES AND LIBRARIES');
fprintf(fid,'\n');
fprintf(fid,'################################################################################');
fprintf(fid,'\n');
fprintf(fid,'"""');
fprintf(fid,'\n');
fprintf(fid,'import numpy as np');fprintf(fid,'\n');
fprintf(fid,'import scipy.integrate as integrate');fprintf(fid,'\n');
fprintf(fid,'from numpy import sin, cos, tan, abs');
fprintf(fid,'\n');
fprintf(fid,'"""');
fprintf(fid,'\n');
fprintf(fid,'################################################################################');
fprintf(fid,'\n');
fprintf(fid,'MY OTHERS FILES IMPORTS ');
fprintf(fid,'\n');
fprintf(fid,'################################################################################');
fprintf(fid,'\n');
fprintf(fid,'"""');
fprintf(fid,'\n');
fprintf(fid,'import Parameters');
fprintf(fid,'\n\n');
for i=1:length(List_Of_Var_Strg)
    Param = sprintf('%s = Parameters.%s\n',List_Of_Var_Strg(i),List_Of_Var_Strg(i));
    fprintf(fid,Param);
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
fprintf(fid,'\n\n');
fprintf(fid,'def get_DeltaF_DeltaM(x):\n');
fprintf(fid,['\tDelta_BM','=','np.empty((',num2str((length(x_SS)/4)),',',num2str((length(x_SS)/4)),'))']);
fprintf(fid,'\n');
fprintf(fid,['\tDelta_AF','=','np.empty((',num2str((length(x_SS)/4)),',1))']);
fprintf(fid,'\n');
fprintf(fid,['\tDelta_AM','=','np.empty((',num2str((length(x_SS)/4)),',1))']);
fprintf(fid,'\n');
fprintf(fid,['\tDelta_BF','=','np.empty((',num2str((length(x_SS)/4)),',1))']);
fprintf(fid,'\n');
% -------------------------------------------------------------------------
for i=1:length(x_SS)
    fprintf(fid,['\tx_SS_',num2str(i),'=','x[',num2str(i-1),']']);
    fprintf(fid,'\n');
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    fprintf(fid,['\tDelta_AF[',num2str(i-1),']','=',...
        eval(['DAF_',num2str(i),'_char'])]);
    fprintf(fid,'\n');
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    fprintf(fid,['\tDelta_AM[',num2str(i-1),']','=',...
        eval(['DAM_',num2str(i),'_char'])]);
    fprintf(fid,'\n');
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    fprintf(fid,['\tDelta_BF[',num2str(i-1),']','=',...
        eval(['DBF_',num2str(i),'_char'])]);
    fprintf(fid,'\n');
end
% -------------------------------------------------------------------------
for i=1:(length(x_SS)/4)
    for j=1:(length(x_SS)/4)
        fprintf(fid,['\tDelta_BM[',num2str(i-1),',',num2str(j-1),']','=',...
            eval(['DBM_',num2str(i),'_',num2str(j),'_char'])]);
        fprintf(fid,'\n');
    end
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% x1dot_str=sprintf('\tx_dot[0:%s]=x[%s:%s]',num2str(length(x_SS)/2),num2str((length(x_SS)/2)),num2str(length(x_SS)));
% fprintf(fid,x1dot_str);
fprintf(fid,'\n');
fprintf(fid,'\tDelta_A = np.concatenate((Delta_AF, Delta_AM), axis=0)');
fprintf(fid,'\n');
fprintf(fid,'\tDelL1 = np.concatenate((Delta_BF, np.zeros((3, 3))), axis=1)');
fprintf(fid,'\n');
fprintf(fid,'\tDelL2 = np.concatenate((np.zeros((3, 1)), Delta_BM), axis=1)');
fprintf(fid,'\n');
fprintf(fid,'\tDelta_B = np.concatenate((DelL1, DelL2), axis=0)');
fprintf(fid,'\n');
fprintf(fid,'\treturn Delta_A, Delta_B');
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
fprintf(fid,'\n\n');
fprintf(fid,'def QuadModel(t,x,Fz,Mx,My,Mz):\n');
fprintf(fid,['\tx_dot','=','np.empty((',num2str(length(x_SS)),',1))']);
fprintf(fid,'\n');
% fprintf(fid,['\tDelta_BM','=','np.empty((',num2str((length(x_SS)/4)),',',num2str((length(x_SS)/4)),'))']);
% fprintf(fid,'\n');
% fprintf(fid,['\tDelta_AF','=','np.empty((',num2str((length(x_SS)/4)),',1))']);
% fprintf(fid,'\n');
% fprintf(fid,['\tDelta_AM','=','np.empty((',num2str((length(x_SS)/4)),',1))']);
% fprintf(fid,'\n');
% fprintf(fid,['\tDelta_BF','=','np.empty((',num2str((length(x_SS)/4)),',1))']);
% fprintf(fid,'\n');
% % -------------------------------------------------------------------------
% for i=1:length(x_SS)
%     fprintf(fid,['\tx_SS_',num2str(i),'=','x[',num2str(i-1),']']);
%     fprintf(fid,'\n');
% end
% % -------------------------------------------------------------------------
% % -------------------------------------------------------------------------
% for i=1:(length(x_SS)/4)
%     fprintf(fid,['\tDelta_AF[',num2str(i-1),']','=',...
%         eval(['DAF_',num2str(i),'_char'])]);
%     fprintf(fid,'\n');
% end
% % -------------------------------------------------------------------------
% for i=1:(length(x_SS)/4)
%     fprintf(fid,['\tDelta_AM[',num2str(i-1),']','=',...
%         eval(['DAM_',num2str(i),'_char'])]);
%     fprintf(fid,'\n');
% end
% % -------------------------------------------------------------------------
% for i=1:(length(x_SS)/4)
%     fprintf(fid,['\tDelta_BF[',num2str(i-1),']','=',...
%         eval(['DBF_',num2str(i),'_char'])]);
%     fprintf(fid,'\n');
% end
% % -------------------------------------------------------------------------
% for i=1:(length(x_SS)/4)
%     for j=1:(length(x_SS)/4)
%         fprintf(fid,['\tDelta_BM[',num2str(i-1),',',num2str(j-1),']','=',...
%             eval(['DBM_',num2str(i),'_',num2str(j),'_char'])]);
%         fprintf(fid,'\n');
%     end
% end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
x1dot_str=sprintf('\tx_dot[0:%s]=x[%s:%s].reshape(6, 1)',num2str(length(x_SS)/2),num2str((length(x_SS)/2)),num2str(length(x_SS)));
fprintf(fid,x1dot_str);
% fprintf(fid,'\n');
% fprintf(fid,'\tDelta_A = np.concatenate((Delta_AF, Delta_AM), axis=0)\n');
% fprintf(fid,'\n');
% fprintf(fid,'\tDelL1 = np.concatenate((Delta_BF, np.zeros((3, 3))), axis=1)');
% fprintf(fid,'\n');
% fprintf(fid,'\tDelL2 = np.concatenate((np.zeros((3, 1)), Delta_BM), axis=1)');
% fprintf(fid,'\n');
% fprintf(fid,'\tDelta_B = np.concatenate((DelL1, DelL2), axis=0)');
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
fprintf(fid,'\n');
fprintf(fid,'\tDelta_A, Delta_B = get_DeltaF_DeltaM(x)');
fprintf(fid,'\n');
% -------------------------------------------------------------------------
x2dot_str=sprintf('\tx_dot[%s:%s]=Delta_A + Delta_B@np.array([[Fz],[Mx],[My],[Mz]])',num2str((length(x_SS)/2)),num2str(length(x_SS)));
fprintf(fid,x2dot_str);
fprintf(fid,'\n');
fprintf(fid,'\treturn x_dot\n');
% -------------------------------------------------------------------------
fclose(fid);
cd(pwd);
