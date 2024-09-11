# **Simulação de uma Suspensão Passiva**

 <div align="center">
  <img src="https://github.com/reginaldocardoso/MatlabCourseAnIntroduction/blob/master/SUSPENSAO_PASSIVA/Figure/suspensao02.png" alt="SuspensaoPassiva" width="400"/>
</div>


O bloco $${\color{red}Ms}$$ representa um quarto da massa do veículo. A variável $${\color{red}Zs}$$ é o deslocamento da massa do veículo.

O bloco $${\color{red}Mus}$$ representa a massa do conjunto pneu e roda.  A variável $${\color{red}Zus}$$ é o deslocamento da roda.

A constante $${\color{red}Kus}$$ representa o modelo matemática do pneu, que neste caso é semelhante a uma mola.

A constante $${\color{red}Ks}$$ representa a mola do sistema da suspensão.

A constante $${\color{red}Bs}$$ representa o amortecedor do sistema da suspensão.

A variável $${\color{red}Zr}$$ é a deformação do asfalto.

# **ARQUIVOS**

1 - [Principal_suspensao.m](https://github.com/reginaldocardoso/MatlabCourseAnIntroduction/blob/master/SUSPENSAO_PASSIVA/Principal_suspensao.m): este é o arquivo principal, responsável por chamar as funções e realizar a integração do modelo pelo metódo de Runge Kutta de quarta ordem do MATLAB (ODE45).

2 - [modelo_suspensao_passiva.m](https://github.com/reginaldocardoso/MatlabCourseAnIntroduction/blob/master/SUSPENSAO_PASSIVA/modelo_suspensao_passiva.m): este arquivo é o modelo matemático da suspensão passiva, conforme descrito na imagem acima.

3 - [Plot_EDO_v1.m](https://github.com/reginaldocardoso/MatlabCourseAnIntroduction/blob/master/SUSPENSAO_PASSIVA/Plot_EDO_v1.m): este arquivo é reponsável por fazer os gráficos da simulação.
