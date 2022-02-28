***Settings***
Documentation      Cadastro profissão

Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot
Resource        ${EXECDIR}/Resources/Page_profissão_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_especialidade_cadastro.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de profissão (Completo)
    Dado        que o usuario está na tela "cadastro de profissão" 
    Então       preencher o ${Campos_profissao.nome_da_profissao} com ${Valor_campos_profissao.nome_da_profissao}
    E           preencher o ${Campos_profissao.sigla} com ${Valor_campos_profissao.sigla}
    E           selecionar o ${Valor_campos_profissao.nivel_formacao} no ${Campos_profissao.nivel_formacao}
    E           selecionar o ${Valor_campos_profissao.conselho_profissional} no ${Campos_profissao.conselho_profissional}
    E           informar o ${Campos_profissao.ocupacao1}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida