*** Settings ***
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_ContratosDashBoard}                //a[contains(.,'Dashboard')]
${Menu_ContratosContratos}                //a[contains(.,'Contratos')]

${botao_FiltrarContratos}                 //button[contains(.,'Filtrar')]

${Departamento_ContratosDashboard}        //button[contains(.,'Selecione um departamento')]
${Filtro_+60Dias}                         (//div[contains(.,'+60 diasNº Contratos8')])[6]
${Filtro_30Dias}                          (//div[contains(.,'30 diasNº Contratos2')])[6]
${Filtro_15Dias}                          (//div[contains(.,'15 diasNº Contratos0')])[6]
${Filtro_Vencidos}                        (//div[contains(.,'VencidosNº Contratos0')])[6]
${Filtro_Indefinidos}                     (//div[contains(.,'IndefinidosNº Contratos9')])[6]
${Filtro_VigenciaInicial}                 //button[@id='vigencia_inicio']
${Filtro_VigenciaFinal}                   //button[@id='vigencia_fim']
${Filtro_Indice}                          //button[@id='indice_data']
${Filtro_TipoIndice}                      //input[@id='tipo_indice']
${Filtro_StatusIndice}                    //button[@id='status_indice']
${Filtro_EmpresaContratos}                //button[@id='empresa']
${Filtro_DepartamentoContratos}           //button[@id='departament']
${Filtro_DocumentoContratos}              //input[@id='documento']
${Filtro_NomeIndividuosContratos}         //input[@id='nome']
${Filtro_StatusVigenciaContratos}         //button[@id='status_vigencia']


*** Keywords ***       
# -4.1.1
Dado que clico no menu Contratos > Dashboard
    Wait Until Element Is Visible    ${MENU_CONTROLECONTRATORS}
    Click Element                    ${MENU_CONTROLECONTRATORS}
    Wait Until Element Is Visible    ${Menu_ContratosDashBoard}
    Click Element                    ${Menu_ContratosDashBoard}

Então sistema exibe tela de Contratos > Dashboard > Dashboard
    Wait Until Page Contains    text=Controle de contratos

# -4.1.2
Dado que clico no menu Contratos > Dashboard > Dashboard
    Wait Until Element Is Visible    locator

E preencho Vigência de:
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[1]
    Input Text                       (//input[@placeholder='DD/MM/YYYY'])[1]    07062024
    Input Text                       (//input[@placeholder='DD/MM/YYYY'])[2]    01042024

E preencho Vigência até:
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[2]
    Input Text                       (//input[@placeholder='DD/MM/YYYY'])[2]    01042026
    Click Element                    ${botao_FiltrarContratos}

Então sistema exibe número de contratos 
    Wait Until Element Is Visible    (//div[contains(.,'4')])[9]

# -4.1.3
E valido filtro departamento em Contratos > Dashboard
    Wait Until Element Is Visible    ${Departamento_ContratosDashboard}
    Click Element                    ${Departamento_ContratosDashboard}
    Click Element                    (//div[contains(.,'Administrativo')])[5]
    Click Element                    ${botao_FiltrarContratos}
Então sistema exibe requisições do departamento em Contratos > Dashboard
    Wait Until Element Is Visible    //h3[contains(.,'Administrativo')]

# -4.1.4

Quando clico no filtro "+60 dias"
    Wait Until Element Is Visible    ${Filtro_+60Dias}
    Click Element                    ${Filtro_+60Dias}

Então sistema exibe informações de filtro "+60 dias"
    Wait Until Element Is Visible    //button[contains(.,'+60 dias')]

# -4.1.5
Quando clico no filtro "30 dias"
    Wait Until Element Is Visible    ${Filtro_30Dias}
    Click Element                    ${Filtro_30Dias}

Então sistema exibe informações de filtro "30 dias"
    Wait Until Element Is Visible    //button[contains(.,'30 dias')]

# -4.1.6
Quando clico no filtro "15 dias"
    Wait Until Element Is Visible    ${Filtro_15Dias}
    Click Element                    ${Filtro_15Dias}

Então sistema exibe informações de filtro "15 dias"
    Wait Until Element Is Visible    //button[contains(.,'15 dias')]

# -4.1.7
Quando clico no filtro "Vencidos"
    Wait Until Element Is Visible    ${Filtro_Vencidos}
    Click Element                    ${Filtro_Vencidos}

Então sistema exibe informações de filtro "Vencidos"
    Wait Until Element Is Visible    //button[contains(.,'Vencidos')]

# -4.1.7
Quando clico no filtro "Indefinidos"
    Wait Until Element Is Visible    ${Filtro_Indefinidos}
    Click Element                    ${Filtro_Indefinidos}

Então sistema exibe informações de filtro "Indefinidos"
    Wait Until Element Is Visible    //button[contains(.,'Indefinidos')]

# -4.2.1
Dado que clico no menu Contratos > Contratos
    Wait Until Element Is Visible    ${MENU_CONTROLECONTRATORS}
    Click Element                    ${MENU_CONTROLECONTRATORS}
    Wait Until Element Is Visible    ${Menu_ContratosContratos}
    Click Element                    ${Menu_ContratosContratos}

Então sistema exibe informações de cadastros de Contratos 
    Wait Until Page Contains    text=Controle de Contratos

# -4.2.2
E preencho informação de filtro Vigência inicial
    Wait Until Element Is Visible    ${Filtro_VigenciaInicial}
    Click Element                    ${Filtro_VigenciaInicial}
    FOR     ${i}    IN RANGE     2
        Click Element    (//button[@type='button'])[18]
        Sleep    0.5s
    END
    Click Element    (//button[contains(.,'1')])[1]
    Click Element    (//button[contains(.,'31')])[3]
    Click Element    ${Filtro_VigenciaInicial}

Então sistema exibe informações de filtro Vigência inicial
    Wait Until Element Is Visible    //td[contains(.,'01/01/2025')]

# -4.2.3
E preencho informação de filtro Vigência final
    Wait Until Element Is Visible    ${Filtro_VigenciaFinal}
    Click Element                    ${Filtro_VigenciaFinal}
    FOR     ${i}    IN RANGE     13
        Click Element    (//button[@type='button'])[54]
        Sleep    0.3s
    END
    Click Element    (//button[contains(.,'1')])[16]
    Click Element    ${Filtro_VigenciaFinal}


Então sistema exibe informações de filtro Vigência final
    Wait Until Element Is Visible    (//td[contains(.,'01/04/2026')])[1]

# -4.2.4
E preencho informação de filtro Índice
    Wait Until Element Is Visible    ${Filtro_Indice}
    Click Element                    ${Filtro_Indice}
   FOR     ${i}    IN RANGE     1
        Click Element    (//button[@type='button'])[18]
        Sleep    0.3s
    END
    Click Element    (//button[contains(.,'1')])[2]
    Sleep    2.5s
    Click Element    (//button[contains(.,'28')])[3]
    Click Element    ${Filtro_Indice}

Então sistema exibe informações de filtro Índice
    Wait Until Element Is Visible    (//td[contains(.,'12/02/2025')])[1]

# -4.2.5
E preencho informação de filtro Tipo de índice
    Wait Until Element Is Visible    ${Filtro_TipoIndice}
    Input Text                       ${Filtro_TipoIndice}    IP

Então sistema exibe informações de filtro Tipo de índice
    Wait Until Element Is Visible    //td[contains(.,'IP')]

# -4.2.6
E preencho informação de filtro Status do índice
    Wait Until Element Is Visible    ${Filtro_StatusIndice}
    Click Element                    ${Filtro_StatusIndice}
    Click Element                    (//div[contains(.,'Não atualizado')])[5]

Então sistema exibe informações de filtro Status do índice
    Wait Until Element Is Visible    //td[contains(.,'ConsoliDATA')]

# -4.2.7
E preencho informação de filtro Empresa
    Wait Until Element Is Visible    ${Filtro_EmpresaContratos}
    Click Element                    ${Filtro_EmpresaContratos}
    Click Element                    (//div[contains(.,'Unifabricas')])[14]

Então sistema exibe informações de filtro Empresa
    Wait Until Element Is Visible    //td[contains(.,'Caleb Otávio Mendes')]

# -4.2.8
E preencho informação de filtro Departamento
    Wait Until Element Is Visible    ${Filtro_DepartamentoContratos}
    Click Element                    ${Filtro_DepartamentoContratos}
    Click Element                    (//div[contains(.,'TI')])[14]

Então sistema exibe informações de filtro Departamento em Contratos
    Wait Until Element Is Visible    //td[contains(.,'TI')]

# -4.2.9
E preencho informação de filtro Documento
    Wait Until Element Is Visible    ${Filtro_DocumentoContratos}
    Input Text                       ${Filtro_DocumentoContratos}    19895982771

Então sistema exibe informações de filtro Documento
    Wait Until Element Is Visible    //td[contains(.,'teste1234')]

# -4.2.10
E preencho informação de filtro Nome de indivíduo
    Wait Until Element Is Visible    ${Filtro_NomeIndividuosContratos}
    Input Text                       ${Filtro_NomeIndividuosContratos}    teste1234

Então sistema exibe informações de filtro Nome de indivíduo
    Wait Until Element Is Visible    //td[contains(.,'teste1234')]

# -4.2.11
E preencho informação de filtro Status de vigência
    Wait Until Element Is Visible    ${Filtro_StatusVigenciaContratos}
    Click Element                    ${Filtro_StatusVigenciaContratos}
    Click Element                    (//div[contains(.,'Renovado')])[5]
    
Então sistema exibe informações de filtro Status de vigência
    Wait Until Element Is Visible    //td[contains(.,'André Giovanni Raimundo Aparício')]


# -4.2.11