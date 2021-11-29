***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de modalidade (Completo)
    Dado        que o usuario está na tela "cadastro modalidade"
    E           preenchido o "Denominação" com o "Teste automatizado"
    E           selecione "ENDOCRINOLOGIA" no campo "Profissão"
    E           selecione "ENDOCRINOLOGIA E METABOLOGIA" no campo "Especialidade"
    E           selecionar opções em "Procedimento"
    Quando      clicar no "Avançar" 
    E           clicar no "Cadastrar" 
    Então       mensagem de cadastro realizado com sucesso
    Sleep   20s