***Settings***
Documentation       Cadastro especialidade

*** Variables ***

&{Campos_modalidade}
...  denominacao=inputDenominacao
...  profissao=selectProfissao
...  espelicalidade=selectEspecialidade
...  procedimento1=//*[@id="selectProcedimentoBorder"]/div/button/div/div/div
...  procedimento2=bs-select-1-0

&{Valor_campos_modalidade}
...  denominacao=Atendimento SOS
...  profissao=${Valor_campos_profissao.nome_da_profissao}
...  espelicalidade=${Valor_campos_especialidade.denominacao}

&{Buttons}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button

***Keywords***

inserir o ${CAMPO}
    Click           xpath=${CAMPO}
    Click           id=${Campos_modalidade.procedimento2}