***Settings***
Documentation      Cadastro profissão

Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot
Resource        ${EXECDIR}/Resources/Formulário comum/Page_DS.robot


Suite Setup     iniciar navegador sessão "Endocrinologia"

***Test Cases***

[000] -  DS
    #Dado        que o usuario está na tela "cadastro de profissão"
    Então       preencher o ${Campos_DS.quantidade_de_moradores_da_residência} com ${Valor_campos_DS.quantidade_de_moradores_da_residência}
    E           preencher o ${Campos_DS.quantidade_de_pessoas_que_trabalham} com ${Valor_campos_DS.quantidade_de_pessoas_que_trabalham}
    E           preencher o ${Campos_DS.renda_familiar_total} com ${Valor_campos_DS.renda_familiar_total}
    E           selecionar o ${Valor_campos_DS.possui_benefício_social} no ${Campos_DS.possui_benefício_social}
    E           informar o beneficio ${Valor_campos_DS.benefícios_sociais2}
    Quando      clicar no ${Buttons_DS.avançar}
    Então       clicar no ${Buttons_DS.alfabetizado}
    E           selecionar o ${Valor_campos_DS.grau_de_escolaridade} no ${Campos_DS.grau_de_escolaridade}
    E           selecionar o ${Valor_campos_DS.instituição_de_ensino} no ${Campos_DS.instituição_de_ensino}
    E           preencher o ${Campos_DS.curso} com ${Valor_campos_DS.curso}
    E           informar a profissao ${Valor_campos_DS.profissoes2}
    E           preencher o ${Campos_DS.outra_profissao} com ${Valor_campos_DS.outra_profissao}
    E           informar a profissao ${Valor_campos_DS.ocupacoes2}
    E           preencher o ${Campos_DS.outra_ocupacao} com ${Valor_campos_DS.outra_ocupacao}
    Quando      clicar no ${Buttons_DS.avançar}
    Então       preencher o ${Campos_DS.informacoes_adicionais} com ${Valor_campos_DS.informacoes_adicionais}
    E           clicar no ${Buttons_DS.avançar}
    Quando      clicar no ${Buttons_oferta.salvar}
    Então       mensagem de cadastro realizado com sucesso é exibida

[000] -  DBS