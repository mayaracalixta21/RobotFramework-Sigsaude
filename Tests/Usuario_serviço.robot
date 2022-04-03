***Settings***
Documentation     Cadastro usuario de serviço

Resource        ${EXECDIR}/Resources/Keywords.robot

Suite Setup     configurações informações iniciais "Comum"

***Test Cases***

[001] - Cadastro de um usuario de serviço-completo(Reponsavel)
    [Tags]   Usuario1
   # Atualizar dash falha "15" "Cadastro de um usuario de serviço-completo(Reponsavel)" "Concluido" "Mayara"
    Dado         que o usuario está na tela "novo usuario de serviço"
    E            informar os dados do "usuario de serviço"
    E            selecione "Feminino" no campo "Sexo"
    E            selecione "SOLTEIRO(A)" no campo "Estado civil"
    E            selecione "A+" no campo "Tipo Sanguíneo"
    E            selecione "BRANCA" no campo "Cor/Raça"
    E            selecione "Brasil" no campo "País de nascimento"
    E            selecione "RN" no campo "UF de nascimento"
    E            selecione "Natal" no campo "Município de nascimento"
    E            selecione "ALUNO" no campo "Vínculo instituição"
    Quando       clicar em "Salvar e Avançar"
    E            informar endereço
    Quando       clicar em "Avançar"
    E            informar contatos "4"
    Quando       clicar no "Avançar contato"
    E            clicar em "Avançar responsavel"
    E            clicar no "Finalizar cadastrao"
    Então        mensagem de cadastro realizado com sucesso
   # Atualizar dash sucesso 15


[002] - Listar usuario de serviço por nome
    [Tags]   Usuario
    Atualizar dash falha "16" "Listar usuario de serviço por nome" "Concluido" "Mayara"
    Dado         que o usuario está na tela "listar usuarios de serviço"
    E            preenchido o "Nome" com o "${nome}"
    Quando       clicar no "Pesquisar"
    Então        o campo "Nome na tabela" na lista deve ser "${nome_social}"
    Atualizar dash sucesso 16

[003] - Listar usuario de serviço por CPF
   [Tags]   Usuario
   Atualizar dash falha "17" "Listar usuario de serviço por CPF" "Concluido" "Mayara"
   Dado         que o usuario está na tela "listar usuarios de serviço"
   E            preenchido o "CPF" com o "${cpf}"
   Quando       clicar no "Pesquisar"
   Então        o campo "Nome na tabela" na lista deve ser "${nome_social}"
   Atualizar dash sucesso 17


[004] - Listar usuario de serviço por filiação
   [Tags]   Usuario
   Atualizar dash falha "18" "Listar usuario de serviço por filiação" "Concluido" "Mayara"
   Dado         que o usuario está na tela "listar usuarios de serviço"
   E            preenchido o "Filiação" com o "${nome_filiação}"
   Quando       clicar no "Pesquisar"
   Então        o campo "Nome na tabela" na lista deve ser "${nome_social}"
   Atualizar dash sucesso 18


[005] - Listar usuario de serviço por código
   [Tags]   Usuario
   Atualizar dash falha "19" "Listar usuario de serviço por código" "Concluido" "Mayara"
   Dado         que o usuario está na tela "listar usuarios de serviço"
   E            preenchido o "CPF" com o "${cpf}"
   Quando       clicar no "Pesquisar"
   Então        o campo "Nome na tabela" na lista deve ser "${nome_social}"
   E            dar um click no "Botão Visualizar"
   E            capturar código do usuario de serviço
   E            dar um click no "Voltar"
   E            preenchido o "Código" com o "${codigo_usuario}" 
   Quando       clicar no "Pesquisar"
   Então        o campo "Nome na tabela" na lista deve ser "${nome_social}"
   Atualizar dash sucesso 19

[006] - Listar nenhum resultado é exibido na lista
  [Tags]   Usuario
  Atualizar dash falha "20" "Listar nenhum resultado é exibido na lista" "Concluido" "Mayara"
  Dado         que o usuario está na tela "listar usuarios de serviço"
  E            preenchido o "Nome" com o "*["
  Quando       clicar no "Pesquisar"
  Então        o sistema deve exibir a mensagem "Nenhum registro encontrado"
  Atualizar dash sucesso 20


[007] - Inativar usuario de serviço
 
  Atualizar dash falha "21" "Inativar usuario de serviço" "Concluido" "Mayara"
  Dado         que o usuario está na tela "listar usuarios de serviço"
  E            preenchido o "CPF" com o "${cpf}"
  Quando       clicar no "Pesquisar"
  Então        o campo "Nome na tabela" na lista deve ser "${nome_social}"
  E            dar um click no "Botão Inativar"
  E            preenchido o "Justificativa para inativação" com o "Teste automatizado"
  Quando       dar um click no "Inativar"
  Então        mensagem de inatição realizada com sucesso
  Atualizar dash sucesso 21
