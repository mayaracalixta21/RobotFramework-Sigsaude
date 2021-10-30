***Settings***
Documentation       Teste cadastro coladorador

Resource        ${EXECDIR}/Resources/Keywords.robot

Suite Setup     iniciar navegador sessão "Psicologia" 

***Test Cases***
[001] - Cadastro completo 
    Dado         que o usuario está na tela "cadastro de colaborador"    
    Então        informar os dados do "Colaborador"
    E            selecione "ADM GERAL" no campo "Perfil" 
    E            selecione "EXTERNO" no campo "Vínculo"
    Quando       clicar no "Avançar colaborador"
    E            clicar no "Cadastrar colaborador" 
    Então        mensagem de cadastro realizado com sucesso   
  
  
[002] - Listar colaborador por nome
    Dado         que o usuario está na tela "listar colaborador"
    E            preenchido o "Nome colaborador" com o "${nome}"
    Quando       clicar no "Pesquisar colaborador"
    Então        o campo "Nome na tabela colaborador" na lista deve ser "${nome}"

[003] - Listar colaborador por login
    Dado         que o usuario está na tela "listar colaborador"
    E            preenchido o "Login colaborador" com o "${login_colaborador}"
    Quando       clicar no "Pesquisar colaborador"
    Então        o campo "Nome na tabela colaborador" na lista deve ser "${nome}"

[004] - Listar colaborador por email
    Dado         que o usuario está na tela "listar colaborador"
    E            preenchido o "Email colaborador" com o "${email}"
    Quando       clicar no "Pesquisar colaborador"
    Então        o campo "Nome na tabela colaborador" na lista deve ser "${nome}"

[005] - Listar nenhum resultado é exibido na lista
    Dado         que o usuario está na tela "listar colaborador"
    E            preenchido o "Nome colaborador" com o "*["
    Quando       clicar no "Pesquisar colaborador"
    Então        o sistema deve mostrar a mensagem "Nenhum registro encontrado"

[006] - Inativar colaborador
    Dado         que o usuario está na tela "listar colaborador"
    E            preenchido o "Nome colaborador" com o "${nome}"
    Quando       clicar no "Pesquisar colaborador"
    Então        o campo "Nome na tabela colaborador" na lista deve ser "${nome}"
    E            dar um click no "Botão Inativar Colaborador"
    E            preenchido o "Justificativa para inativação" com o "Teste automatizado"
    Quando       dar um click no "Inativar colaborador"
    Então        mensagem de inatição realizada com sucesso