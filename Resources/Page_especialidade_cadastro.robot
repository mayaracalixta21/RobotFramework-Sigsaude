***Settings***
Documentation       Cadastro especialidade

*** Variables ***

&{Campos_especialidade}
...  denominacao=inputDenominacao
...  profissao=selectProfissao
...  descricao=inputDescricao

&{Valor_campos_especialidade}
...  denominacao=HOMOLOG
...  profissao=${Valor_campos_profissao.nome_da_profissao}
...  descricao=Teste automatizado

&{Buttons}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button

