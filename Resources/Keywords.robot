***Settings***
Documentation       Keywords cadastros

Resource        ${EXECDIR}/Resources/base.robot
Resource        ${EXECDIR}/Resources/bdd.robot
#Resource        ${EXECDIR}/Resources/cadastros.robot
Resource        ${EXECDIR}/Resources/Page_usuario_cadastro.robot
Resource        ${EXECDIR}/Resources/keywords_campos.robot
Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot
Resource        ${EXECDIR}/Resources/keywords_mensagens.robot
#Resource        ${EXECDIR}/Resources/keywords_agendamento.robot
Resource        ${EXECDIR}/Resources/Page_datastudio.robot


**Keywords***

Espere um pouco
    Sleep   5s

configurações informações iniciais "${formulario}"
    Init Sheets      Resources/Arquivos/chave.json
    iniciar navegador sessão "${formulario}"