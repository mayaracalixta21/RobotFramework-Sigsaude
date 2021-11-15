***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de especialidade (Completo)
    Dado        que o usuario está na tela "cadastro de especialidade" 
    E           informar os dados cadastrais "Especialidade"
    E           selecione "TÉCNICO DE PRÓTESE DENTÁRIA" no campo "Profissão"
    Quando      clicar no "Avançar" 
    E           clicar no "Finalizar"  
    Então       mensagem de cadastro realizado com sucesso  
    Sleep    20s