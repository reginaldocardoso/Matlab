#  **Simulação Suspensão Ativa**

<div align="center">
  <img src="https://github.com/reginaldocardoso/MatlabCourseAnIntroduction/blob/master/SUSPENSAO_ATIVA/Figure/suspensao01.png" alt="SuspensaoAtiva" width="400"/>
</div>

O bloco $${\color{red}Ms}$$ representa um quarto da massa do veículo. A variável $${\color{red}Zs}$$ é o deslocamento da massa do veículo.

O bloco $${\color{red}Mus}$$ representa a massa do conjunto pneu e roda.  A variável $${\color{red}Zus}$$ é o deslocamento da roda.

As constantes $${\color{red}Kus}$$ e $${\color{red}Bus}$$ representam o modelo matemática do pneu, que neste caso é semelhante a uma mola com um amortecedor.

A constante $${\color{red}Ks}$$ representa a mola do sistema da suspensão.

A constante $${\color{red}Bs}$$ representa o amortecedor do sistema da suspensão.

A variável $${\color{red}Zr}$$ é a deformação do asfalto.

A variável $${\color{red}F}$$ é a força de atuação da suspensão ativa.

# **ARQUIVOS**

1 - [Principal_suspensao_Ativa.m](https://github.com/reginaldocardoso/MatlabCourseAnIntroduction/blob/master/SUSPENSAO_ATIVA/Principal_suspensao_Ativa.m): este é o arquivo principal, responsável por chamar as funções e realizar a integração do modelo pelo metódo de Runge Kutta de quarta ordem do MATLAB (ODE45).

2 - [modelo_suspensao_ativa.m](https://github.com/reginaldocardoso/MatlabCourseAnIntroduction/blob/master/SUSPENSAO_ATIVA/modelo_suspensao_ativa.m): este arquivo é o modelo matemático da suspensão ativa, conforme descrito na imagem acima.

3 - [Plot_EDO.m](https://github.com/reginaldocardoso/MatlabCourseAnIntroduction/blob/master/SUSPENSAO_ATIVA/Plot_EDO.m): este arquivo é reponsável por fazer os gráficos da simulação.
