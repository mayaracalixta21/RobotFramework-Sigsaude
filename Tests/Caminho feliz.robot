***Settings***
Documentation      Caminho feliz

Resource        ${EXECDIR}/Resources/Page_config_iniciais.robot

Suite Setup     configurações informações iniciais "Comum"

***Test Cases***
[002] -Cadastro de profissão (Completo)
    [Tags]      Teste
    Atualizar dash falha "2" "Cadastro de profissão (Completo)" "Concluido" "Mayara"
    Dado        que o usuario está na tela "cadastro de profissão"
    Então       preencher o ${Campos_profissao.nome_da_profissao} com ${Valor_campos_profissao.nome_da_profissao}
    E           preencher o ${Campos_profissao.sigla} com ${Valor_campos_profissao.sigla}
    E           selecionar o ${Valor_campos_profissao.nivel_formacao} no ${Campos_profissao.nivel_formacao}
    E           selecionar o ${Valor_campos_profissao.conselho_profissional} no ${Campos_profissao.conselho_profissional}
    E           informar o ${Campos_profissao.ocupacao1}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida
    Atualizar dash sucesso 2

[003] -Cadastro de especialidade (Completo)
    [Tags]      Teste
    Atualizar dash falha "3" "Cadastro de especialidade (Completo)" "Concluido" "Mayara"
    Dado        que o usuario está na tela "cadastro de especialidade"
    Então       preencher o ${Campos_especialidade.denominacao} com ${Valor_campos_especialidade.denominacao}
    Então       preencher o ${Campos_especialidade.descricao} com ${Valor_campos_especialidade.descricao}
    E           selecionar o ${Valor_campos_especialidade.profissao} no ${Campos_especialidade.profissao}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida
    Atualizar dash sucesso 3


[004] -Cadastro de modalidade (Completo)
    [Tags]      Teste
    Atualizar dash falha "4" "Cadastro de modalidade (Completo)" "Concluido" "Mayara"
    Dado        que o usuario está na tela "cadastro modalidade"
    Então       preencher o ${Campos_modalidade.denominacao} com ${Valor_campos_modalidade.denominacao}
    E           selecionar o ${Valor_campos_modalidade.profissao} no ${Campos_modalidade.profissao}
    E           selecionar o ${Valor_campos_modalidade.especialidade} no ${Campos_modalidade.especialidade}
    E           inserir o ${Campos_modalidade.procedimento1}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida
    Atualizar dash sucesso 4

[005] -Cadastro de profissional (Completo)
    [Tags]      Teste
    Atualizar dash falha "5" "Cadastro de profissonal (Completo)" "Concluido" "Mayara"
    Dado        que o usuario está na tela "cadastro profissional"
    Então       preencher o ${Campos_profissional.nome} com ${Valor_campos_profissional.nome}
    E           preencher o campo CPF ${Valor_campos_profissional.CPF}
    E           preencher o ${Campos_profissional.email} com ${Valor_campos_profissional.email}
    E           preencher o ${Campos_profissional.login} com ${Valor_campos_profissional.login}
    E           selecionar o ${Valor_campos_profissional.perfil} no ${Campos_profissional.perfil}
    Sleep    10s
    Quando      clicar no ${Buttons.avançar}
    Então       selecionar o ${Valor_campos_profissional.profissao} no ${Campos_profissional.profissao}
    E           selecionar o ${Valor_campos_profissional.vinculo} no ${Campos_profissional.vinculo}
    E           selecionar o ${Valor_campos_profissional.UF} no ${Campos_profissional.UF}
    E           preencher o ${Campos_profissional.registro_profissional} com ${Valor_campos_profissional.registro_profissional}
    Quando      clicar no ${Buttons.avançar}
    E           informar a especialidade ${Campos_profissional.especialidade1}
    E           informar a modalidade ${Campos_profissional.modalidade1}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida
    Atualizar dash sucesso 5


[009] -Cadastro de oferta de atendimento (Completo)
    [Tags]      Teste
    Atualizar dash falha "6" "Cadastro de oferta (Completo)" "Concluido" "Mayara"
    Dado        que o usuario está na tela "cadastro oferta"
    Então       preencher o ${Campos_oferta.denominacao} com ${Valor_campos_oferta.denominacao}
    E           preencher o ${Campos_oferta.data_inicio} com ${Valor_campos_oferta.data_inicio}
    E           preencher o ${Campos_oferta.data_fim} com ${Valor_campos_oferta.data_fim}
    E           preencher o ${Campos_oferta.inicio_do_expediente} com ${Valor_campos_oferta.inicio_do_expediente}
    E           preencher o ${Campos_oferta.fim_do_expediente} com ${Valor_campos_oferta.fim_do_expediente}
    Quando      clicar no ${Buttons_oferta.avançar}
    Então       inserir modalidade ${Campos_oferta.modalidade1}
    E           adicionar escala ${Valor_campos_oferta.descricao_escala}
    E           clicar no ${Buttons_oferta.concluir}
    Quando      clicar no ${Buttons_oferta.salvar}
    Então       mensagem de cadastro realizado com sucesso é exibida
    Atualizar dash sucesso 6

[012] - Registrar escala (Completo)
    [Tags]      Teste
    Atualizar dash falha "7" "Registrar escala (Completo)" "Concluido" "Mayara"
    Dado        que o usuario está na tela "listar oferta"
    E           preencher o ${Campos_oferta.denominacao} com ${Valor_campos_oferta.denominacao}
    E           clicar no ${Buttons_escala.pesquisar}
    E           clicar em ${Buttons_escala.registrar_escala}
    E           selecionar o ${Valor_campos_escala.denominacao} no ${Campos_escala.denominacao}
    E           selecionar o ${Valor_campos_escala.tipo_atendimento} no ${Campos_escala.tipo_atendimento}
    E           informar profissional ${Valor_campos_escala.profissional2}
    E           clicar no ${Buttons_escala.consultar}
    E           adicionar horario
    Atualizar dash sucesso 7


[010] - Realizar agendamento (Completo)
    [Tags]      Teste
    Atualizar dash falha "8" "Registrar agendamento (Completo)" "Concluido" "Mayara"
    Dado          que o usuario está na tela "agendamento"
    E             informar modalidade para o filtro ${Valor_campos_agendamento.filtro_modalidade}
    E             filtrar ${Filtro_agendamentos.disponiveis}
    E             realizar agendamento
    E             informar qual o tipo de consulta ${Valor_campos_agendamento.consulta_primeira_vez}
    E             informe o usuario de serviço ${Valor_campos_agendamento.usuario_de_servico2}
    E             adicionar observação ao comprovante de agendamento e e-mail
    E             informar a observação do ${Valor_campos_agendamento.observacao}
    E             clicar em ${Buttons_agendamento.salvar}
    Quando        imprimir comprovante de agendamento ${Buttons_agendamento.sim}
    Então         avisar por email ${Buttons_agendamento.sim}
    Atualizar dash sucesso 8

[011] - Cancelar agendamento (Completo)
    [Tags]      Teste
    Atualizar dash falha "9" "Registrar escala (Completo)" "Concluido" "Mayara"
    Dado        que o usuario está na tela "agendamento"
    E           filtrar ${Filtro_agendamentos.agendados}
    E           realizar o cancelamento
    E           informar os status do agendamento ${Valor_campos_agendamento.status_cancelado}
    E           informar a justificativa do cancelamento ${Valor_campos_agendamento.justificativa}
    E           clicar em ${Buttons_agendamento.salvar}
    Então       avisar por email ${Buttons_agendamento.sim}
    Atualizar dash sucesso 9




##[000] - Analise de dados de teste
###   ${config_json}         Get JSON                             config.json 
###    New Browser            ${config_json["navegador"]}          False
###    Iniciar Navegador
###    ${config_json}         Get JSON                   config.json 
###    New page              ${config_json["lelog"]}
###    Select Options By              id=type_chart        Text        Gráfico de barra
###    ${promise}=    Promise To Upload File           ${EXECDIR}/output/log.html
###    Click          xpath=//*[@id="input_file"]/label/span[1]
###    Sleep  10s