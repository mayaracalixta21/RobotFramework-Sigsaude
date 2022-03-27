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


*** Keywords ***
configurações informações iniciais
    Init Sheets      Resources/Arquivos/chave.json
    iniciar navegador sessão "Endocrinologia"