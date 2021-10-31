***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***

[001] - Realizar atendimento (Completo)
    Dado        que o usuario está na tela "atendimento" 
    E           informar o campo "Data da listagem" com o "01112021"
    Quando      pressionar o botão "Pesquisar"
    Então       iniciar atendimento 
    E           informar dados de diagnóstico
    Sleep       20s

   

