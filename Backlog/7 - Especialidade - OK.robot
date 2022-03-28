***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/Page_especialidade_cadastro.robot

Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot

Suite Setup     iniciar navegador sessão "Endocrinologia"

***Test Cases***
[001] -Cadastro de especialidade (Completo)
    Dado        que o usuario está na tela "cadastro de especialidade"
    Então       preencher o ${Campos_especialidade.denominacao} com ${Valor_campos_especialidade.denominacao}
    Então       preencher o ${Campos_especialidade.descricao} com ${Valor_campos_especialidade.descricao}
    E           selecionar o ${Valor_campos_especialidade.profissao} no ${Campos_especialidade.profissao}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida