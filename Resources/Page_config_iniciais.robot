***Settings***
Documentation      Configurações inicias

Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot

Resource        ${EXECDIR}/Resources/Page_profissão_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_especialidade_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_modalidade_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_profissional_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_oferta_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_agendamento.robot
Resource        ${EXECDIR}/Resources/Page_oferta_listar.robot
Resource        ${EXECDIR}/Resources/Page_datastudio.robot
Resource        ${EXECDIR}/Resources/Page_capturar_dados.robot
Resource        ${EXECDIR}/Resources/Page_minha_agenda.robot
Resource        ${EXECDIR}/Resources/Formulário comum/Page_DS.robot
Resource        ${EXECDIR}/Resources/Formulário comum/Page_DBS.robot
Resource        ${EXECDIR}/Resources/Formulário comum/Page_dignostico.robot
Resource        ${EXECDIR}/Resources/Formulário comum/Page_conduta.robot


*** Keywords ***
configurações informações iniciais
    Init Sheets      Resources/Arquivos/chave.json
    iniciar navegador sessão "Endocrinologia"

configurações iniciais formulario comum
    Dado        que o usuario está na tela "minha agenda"
    Quando      preencher o ${Campos_agenda.data_listagem} com ${Valor_campos_agenda.data_listagem}
    E           clicar em ${Buttons_agenda.pesquisar}
    E           clicar em ${Buttons_agenda.atendimento}
    E           iniciar atendimento