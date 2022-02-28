***Settings***
Documentation       Cadastro colaborador
*** Variables ***

&{Campos_profissional}
...  CPF=inputCPF
...  nome=inputNome
...  login=inputLogin
...  email=inputEmail
...  perfil=selectPerfil
...  profissao=selectProfissao
...  vinculo=selectVinculo
...  UF=ufConselho
...  registro_profissional=inputIdentidadeProfissional
...  especialidade1=//*[@id="selectEspecialidadeBorder"]/div/button/div/div/div
...  especialidade2=bs-select-1-0
...  modalidade1=//*[@id="selectModalidadesBorder"]/div/button/div/div/div
...  modalidade2=bs-select-3-0


&{Valor_campos_profissional}
...  nome=Bruna Guedes Silva
...  CPF=26238612002
...  perfil=ADM GERAL
...  email=teste690@email.com
...  login=bruguuuess
...  profissao=${Valor_campos_profissao.sigla} - ${Valor_campos_profissao.nome_da_profissao}
...  vinculo=EXTERNO
...  UF=RN
...  registro_profissional=11235


&{Buttons}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button


***Keywords***

informar a especialidade ${CAMPO}
    Click           xpath=${CAMPO}
    Click           id=${Campos_profissional.especialidade2}

informar a modalidade ${CAMPO}
    Click           xpath=${CAMPO}
    Click           id=${Campos_profissional.modalidade2}