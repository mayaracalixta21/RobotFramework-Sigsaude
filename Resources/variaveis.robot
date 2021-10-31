***Settings***
Documentation       Keywords variaveis

Resource            ${EXECDIR}/Resources/nav.robot
Resource            ${EXECDIR}/Resources/base.robot


***Variables***  
${descrição}

***Keywords***
Padrão descrição 
    ${descrição}=       Get File      ${EXECDIR}/Resources/Auxiliar/descrição.txt         UTF-8           strict
    [Return]        ${descrição}

        
