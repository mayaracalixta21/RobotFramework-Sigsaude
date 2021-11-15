***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de profissão (Completo)
    Dado        que o usuario está na tela "cadastro de profissão" 
    E           informar os dados cadastrais "Profissão"
    E           selecione "SUPERIOR" no campo "Nível Formação"
    E           selecione "CFBM - CONSELHO FEDERAL DE BIOMEDICINA" no campo "Conselho Profissional"
    E           selecionar no menu ocupações "Alguns"
    Quando      clicar no "Avançar profissão" 
    E           clicar em "Salvar profissão" 
    Então       mensagem de cadastro realizado com sucesso  
    Sleep    20s