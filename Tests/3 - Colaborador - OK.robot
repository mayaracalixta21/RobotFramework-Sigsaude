***Settings***
Documentation       Teste cadastro coladorador

Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot
Resource        ${EXECDIR}/Resources/Page_colaborador_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_colaborador_listar.robot


Suite Setup     iniciar navegador sessão "Psicologia"

***Test Cases***
[001] - Cadastro completo
    Dado         que o usuario está na tela "cadastro de colaborador"
    Então        preencher o ${Campos_colaborador.CPF} com ${Valor_campos_colaborador.CPF}
    E            preencher o ${Campos_colaborador.nome} com ${Valor_campos_colaborador.nome}
    E            preencher o ${Campos_colaborador.telefone} com ${Valor_campos_colaborador.telefone}
    E            preencher o ${Campos_colaborador.email} com ${Valor_campos_colaborador.email}
    E            preencher o ${Campos_colaborador.login} com ${Valor_campos_colaborador.login}
    E            selecionar o ${Valor_campos_colaborador.perfil} no ${Campos_colaborador.perfil}
    E            selecionar o ${Valor_campos_colaborador.vinculo} no ${Campos_colaborador.vinculo}
    Quando       clicar no ${Buttons.avançar}
    E            clicar no ${Buttons.cadastrar}
    Então        mensagem de cadastro realizado com sucesso é exibida


[002] - Listar colaborador por nome
    Dado         que o usuario está na tela "listar colaborador"
    E            preencher o ${Campos_listar_colaborador.nome} com ${Valor_campos_listar_colaborador.nome}
    E            clicar no ${Buttons_listar.pesquisar}
    Então        o ${Campos_listar_colaborador.nome_na_tabela} deve ser igual a ${Valor_campos_listar_colaborador.nome}

[003] - Listar colaborador por login
    Dado         que o usuario está na tela "listar colaborador"
    E            preencher o ${Campos_listar_colaborador.login} com ${Valor_campos_listar_colaborador.login}
    E            clicar no ${Buttons_listar.pesquisar}
    Então        o ${Campos_listar_colaborador.nome_na_tabela} deve ser igual a ${Valor_campos_listar_colaborador.nome}


[004] - Listar colaborador por email
    Dado         que o usuario está na tela "listar colaborador"
    E            preencher o ${Campos_listar_colaborador.email} com ${Valor_campos_listar_colaborador.email}
    E            clicar no ${Buttons_listar.pesquisar}
    Então        o ${Campos_listar_colaborador.nome_na_tabela} deve ser igual a ${Valor_campos_listar_colaborador.nome}


[005] - Listar nenhum resultado é exibido na lista
    Dado         que o usuario está na tela "listar colaborador"
    E            preencher o ${Campos_listar_colaborador.nome} com ${Valor_campos_listar_colaborador.nome_failed}
    E            clicar no ${Buttons_listar.pesquisar}
    Então        o sistema deve mostrar a mensagem ${Valor_campos_listar_colaborador.nenhum_registro}

[006] - Inativar colaborador
    Dado         que o usuario está na tela "listar colaborador"
    E            preencher o ${Campos_listar_colaborador.nome} com ${Valor_campos_listar_colaborador.nome}
    E            clicar no ${Buttons_listar.pesquisar}
    Então        o ${Campos_listar_colaborador.nome_na_tabela} deve ser igual a ${Valor_campos_listar_colaborador.nome}
    E            clicar em ${Buttons_listar.icone_inativar}
    E            preencher o ${Campos_listar_colaborador.justificativa} com ${Valor_campos_listar_colaborador.justificativa}
    E            clicar em ${Buttons_listar.inativar}
    Então        mensagem de inatição realizada com sucesso é exibida