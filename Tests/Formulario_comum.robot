***Settings***
Documentation     Formulario comum

Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot
Resource        ${EXECDIR}/Resources/Page_config_iniciais.robot


Suite Setup     iniciar navegador sessão "Comum"

***Test Cases***

[001] - Dados socioeconômicos para usuarios de serviço novos
    [Tags]      comum novo
    Dado        que o usuario está na tela "minha agenda"
    Quando      preencher o ${Campos_agenda.data_listagem} com ${Valor_campos_agenda.data_listagem}
    E           clicar em ${Buttons_agenda.pesquisar}
    E           clicar em ${Buttons_agenda.DS}
    Então       informar situação familiar e econômica
    E           clicar no ${Buttons_DS.avançar}
    E           selecionar o ${Valor_campos_DS.grau_de_escolaridade} no ${Campos_DS.grau_de_escolaridade}
    E           informar escolaridade e profissão [Novo usuario]
    E           clicar no ${Buttons_DS.avançar}
    E           informar informações adicionais
    E           clicar no ${Buttons_DS.avançar}
    Quando      clicar no ${Buttons_oferta.salvar}
    Então       mensagem de cadastro realizado com sucesso é exibida

[002] - Dados socioeconômicos para usuarios de serviço antigos
    [Tags]      comum antigo
    Dado        que o usuario está na tela "minha agenda"
    Quando      preencher o ${Campos_agenda.data_listagem} com ${Valor_campos_agenda.data_listagem}
    E           clicar em ${Buttons_agenda.pesquisar}
    E           clicar em ${Buttons_agenda.DS}
    Então       informar situação familiar e econômica
    E           clicar no ${Buttons_DS.avançar}
    E           selecionar o ${Valor_campos_DS.grau_de_escolaridade} no ${Campos_DS.grau_de_escolaridade}
    E           informar escolaridade e profissão [Antigo usuario]
    E           clicar no ${Buttons_DS.avançar}
    E           informar informações adicionais
    E           clicar no ${Buttons_DS.avançar}
    Quando      clicar no ${Buttons_oferta.salvar}
    Então       mensagem de cadastro realizado com sucesso é exibida

[003] - Dados básicos para usuarios de serviço antigos
    [Tags]      comum
    Dado        que o usuario está na tela "minha agenda"
    Quando      preencher o ${Campos_agenda.data_listagem} com ${Valor_campos_agenda.data_listagem}
    E           clicar em ${Buttons_agenda.pesquisar}
    E           clicar em ${Buttons_agenda.DBS}
    Então       informar medidas e sinais vitais
    E           clicar no ${Buttons_DBS.avançar}
    E           informar procedência do usuário do serviço
    E           clicar no ${Buttons_DBS.avançar}
    E           informar historia clinica
    E           clicar no ${Buttons_DBS.avançar}
    E           informar medicamentos
    E           clicar no ${Buttons_DBS.avançar}
    E           informar historia patologica pregressa
    E           clicar no ${Buttons_DBS.avançar}
    E           informar historico médico familiar
    E           clicar no ${Buttons_DBS.avançar}
    E           informar observações adicionais 
    E           clicar no ${Buttons_DBS.avançar}
    Quando      clicar no ${Buttons_DBS.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida
    Sleep    30s

[004] - Dados diagnostico
    [Tags]      Comum
    Dado        que o usuario está na tela "minha agenda"
    Quando      preencher o ${Campos_agenda.data_listagem} com ${Valor_campos_agenda.data_listagem}
    E           clicar em ${Buttons_agenda.pesquisar}
    E           clicar em ${Buttons_agenda.atendimento}
    E           iniciar atendimento
    Então       informar descrição
    E           clicar em ${Buttons_DIG.avançar}
    E           informar diagnóstico
    E           clicar em ${Buttons_DIG.avançar}
    E           informar documentos
    E           clicar em ${Buttons_DIG.avançar}
    Quando      clicar em ${Buttons_DIG.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida

[005] - Conduta
    [Tags]      Teste
    [Setup]     configurações iniciais formulario comum


    Dado        iniciar conduta terapêutica
    Quando      informar dados da conduta terapêutica


