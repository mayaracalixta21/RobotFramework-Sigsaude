***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de oferta (Completo)
    Dado        que o usuario está na tela "cadastro oferta"
    E           preenchido o "Denominação" com o "Oferta endo"
    E           inserir no "Data Inicio" o dia:"06",mês:"12" e ano:"2021"
    E           inserir no "Data Final" o dia:"10",mês:"02" e ano:"2022"
    E           inserir no "Inicio do expediente" a hora:"10",minutos:"00"
    E           inserir no "Fim do expediente" a hora:"23",minutos:"00"
    Quando      clicar no "Avançar" 
    Então       inserir no campo "Modalidade de Atendimento" com o "ENDOCRINOLOGIA_ALUNO UFRN"



    


    Sleep   30s