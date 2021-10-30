***Settings***
Documentation       Teste login
Resource        ${EXECDIR}/Resources/Keywords.robot

***Test Cases***
[001] - login com fluxo correto
    Dado    que o usuario está na tela login
    Quando  preecher os dados de login do usuario "Psicologia"  
    E       clicar no botão "Entrar"
    Então   mostra a tela inicial do sistema
   

    