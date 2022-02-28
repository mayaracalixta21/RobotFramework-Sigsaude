***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

Test Timeout    2 minutes

***Test Cases***

[001] - Realizar atendimento (Completo)
    [Timeout]    10 minute
    Dado        que o usuario está na tela "atendimento" 
    E           informar o campo "Data da listagem" com o "15112021"
    Quando      pressionar o botão "Pesquisar"
    Então       iniciar atendimento 
    E           informar dados socioeconômicos
    E           informar dados básicos de saúde
    E           informar dados de diagnóstico
    E           informar dados da conduta terapêutica
    E           informar dados da evolução
    Sleep       10s


