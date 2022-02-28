***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de profissional (Completo)
    Dado        que o usuario está na tela "cadastro profissional"
    Então       preencher o ${Campos_profissional.nome} com ${Valor_campos_profissional.nome}
    E           preencher o ${Campos_profissional.CPF} com ${Valor_campos_profissional.CPF}
    E           preencher o ${Campos_profissional.email} com ${Valor_campos_profissional.email}
    E           preencher o ${Campos_profissional.login} com ${Valor_campos_profissional.login}
    E           selecionar o ${Valor_campos_profissional.perfil} no ${Campos_profissional.perfil}
    Quando      clicar no ${Buttons.avançar}
    Então       selecionar o ${Valor_campos_profissional.profissao} no ${Campos_profissional.profissao}
    E           selecionar o ${Valor_campos_profissional.vinculo} no ${Campos_profissional.vinculo}
    E           selecionar o ${Valor_campos_profissional.UF} no ${Campos_profissional.UF}
    E           preencher o ${Campos_profissional.registro_profissional} com ${Campos_profissional.registro_profissional}
    Quando      clicar no ${Buttons.avançar}
    E           informar a especialidade ${Campos_profissional.especialidade1}
    E           informar a modalidade ${Campos_profissional.modalidade1}
    Quando      clicar no ${Buttons.avançar}
