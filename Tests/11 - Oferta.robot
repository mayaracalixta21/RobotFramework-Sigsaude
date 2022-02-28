***Settings***
Documentation       Teste Agendamento

Resource        ${EXECDIR}/Resources/keywords_atendimento.robot

Suite Setup     iniciar navegador sessão "Endocrinologia" 

***Test Cases***
[001] -Cadastro de oferta (Completo)
    Dado        que o usuario está na tela "cadastro oferta"
    Então       preencher o ${Campos_oferta.denominacao} com ${Valor_campos_oferta.denominacao}
    E           preencher o ${Campos_oferta.data_inicio} com ${Valor_campos_oferta.data_inicio}
    E           preencher o ${Campos_oferta.data_fim} com ${Valor_campos_oferta.data_fim}
    E           preencher o ${Campos_oferta.inicio_do_expediente} com ${Valor_campos_oferta.inicio_do_expediente}
    E           preencher o ${Campos_oferta.fim_do_expediente} com ${Valor_campos_oferta.fim_do_expediente}
    Quando      clicar no ${Buttons.avançar}



    


    Sleep   30s