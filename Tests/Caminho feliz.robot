***Settings***
Documentation      Cadastro profissão

Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot
Resource        ${EXECDIR}/Resources/Page_profissão_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_especialidade_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_modalidade_cadastro.robot


Suite Setup     iniciar navegador sessão "Endocrinologia"

***Test Cases***
[001] -Cadastro de profissão (Completo)
    Dado        que o usuario está na tela "cadastro de profissão"
    Então       preencher o ${Campos_profissao.nome_da_profissao} com ${Valor_campos_profissao.nome_da_profissao}
    E           preencher o ${Campos_profissao.sigla} com ${Valor_campos_profissao.sigla}
    E           selecionar o ${Valor_campos_profissao.nivel_formacao} no ${Campos_profissao.nivel_formacao}
    E           selecionar o ${Valor_campos_profissao.conselho_profissional} no ${Campos_profissao.conselho_profissional}
    E           informar o ${Campos_profissao.ocupacao1}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida

[002] -Cadastro de especialidade (Completo)
    Dado        que o usuario está na tela "cadastro de especialidade"
    Então       preencher o ${Campos_especialidade.denominacao} com ${Valor_campos_especialidade.denominacao}
    Então       preencher o ${Campos_especialidade.descricao} com ${Valor_campos_especialidade.descricao}
    E           selecionar o ${Valor_campos_especialidade.profissao} no ${Campos_especialidade.profissao}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida

[003] -Cadastro de modalidade (Completo)
    Dado        que o usuario está na tela "cadastro modalidade"
    Então       preencher o ${Campos_modalidade.denominacao} com ${Valor_campos_modalidade.denominacao}
    E           selecionar o ${Valor_campos_modalidade.profissao} no ${Campos_modalidade.profissao}
    E           selecionar o ${Valor_campos_modalidade.profissao} no ${Campos_modalidade.profissao}
    E           inserir o ${Campos_modalidade.procedimento1}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida
    Sleep    30s