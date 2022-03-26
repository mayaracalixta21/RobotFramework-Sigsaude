***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de modalidade (Completo)
    Dado        que o usuario está na tela "cadastro modalidade"
    Então       preencher o ${Campos_modalidade.denominacao} com ${Valor_campos_modalidade.denominacao}
    E           selecionar o ${Valor_campos_modalidade.profissao} no ${Campos_modalidade.profissao}
    E           selecionar o ${Valor_campos_modalidade.especialidade} no ${Campos_modalidade.especialidade}
    E           inserir o ${Campos_modalidade.procedimento1}
    Quando      clicar no ${Buttons.avançar}
    E           clicar no ${Buttons.cadastrar}
    Então       mensagem de cadastro realizado com sucesso é exibida