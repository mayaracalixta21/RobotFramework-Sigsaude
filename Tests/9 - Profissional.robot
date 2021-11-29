***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de profissional (Completo)
    Dado        que o usuario está na tela "cadastro profissional"
    E           preenchido o "Nome profissional" com o "Teste automatizado"
    E           preenchido o "CPF profissional" com o "84165427080"
    E           preenchido o "Login" com o "teste_auto_um"
    E           preenchido o "Email" com o "tisha2946@uorak.com"
    E           selecione "ADM GERAL" no campo "Perfil"
    Quando      clicar no "Avançar" 
    Então       selecione "END - ENDOCRINOLOGIA" no campo "Profissão"
    E           selecione "EXTERNO" no campo "Vínculo Institucional"
    E           selecione "RN" no campo "UF ou Região"
    E           preenchido o "Registro Profissional" com o "10111213"
    Sleep   20s