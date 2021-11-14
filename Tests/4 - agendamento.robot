***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/Keywords.robot

Suite Setup     iniciar navegador sessão "Psicologia" 

***Test Cases***
[001] - Realizar agendamento (Completo)
    Dado        que o usuario está na tela "agendamento"    
    E           filtrar "disponiveis"     
    E           informar o dia:"14", mês:"11" e o ano:"2021" para realizar o agendamento
    E           informar o tipo de consulta "Retorno"
    E           informar o usuario de serviço "Mayara teste um"
    E           adicionar observação ao comprovante de agendamento e e-mail 
    E           preenchido o campo "Observação" com o "Teste observação"
    Quando      dar um click no botão Salvar
    Então       a mensagem de impressão do comprovante de agendamento "Sim"
    Quando      confirmação do envio do email "Sim"
    Então       a mensagem de e-mail enviado aparece na tela  


#[002] - Atendido o agendamento 
#    #Preciso de um agendamento antes (três casos iguais) mas só é possivel da data atual ou agendamento realizado antes mas a oferta de disponiveis também some
#    Dado        que o usuario está na tela "agendamento"   
#    E           filtrar "agendados"    
#    E           informar o dia:"22", mês:"10" e o ano:"2021" para realizar o atendimento
#    E           informar os status do agendamento "atendido"
#    Quando      dar um click no botão Salvar
#    Então       a mensagem de sucesso aparece na tela 
#    Quando      confirmação do envio do email "Sim" 
#    Então       a mensagem de e-mail enviado aparece na tela 


[003] - Cancelar agendamento 
    Dado        que o usuario está na tela "agendamento"   
    E           filtrar "agendados"    
    E           informar o dia:"26", mês:"10" e o ano:"2021" para realizar o cancelamento 
    E           informar os status do agendamento "cancelado"
    E           preenchido o campo "Justificativa" com o "Teste de cancelamento"
    Quando      dar um click no botão Salvar
    Então       a mensagem de sucesso aparece na tela 
    Quando      confirmação do envio do email "Sim" 
    Então       a mensagem de e-mail enviado aparece na tela 

