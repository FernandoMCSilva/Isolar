*** Settings ***
Documentation      Modúlo que Gerencie informações cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Pessoas}                   //a[contains(.,'Pessoas')]
${Menu_Grupos_Consumidores}       //a[contains(.,'Grupos Consumidores')]
${Menu_Tipo_de_Gerador}           //a[contains(.,'Tipo de Gerador')]
${Menu_Tipo_de_Financiamento}     //a[contains(.,'Tipo de Financiamento')]
${Menu_Classificacoes}            //a[contains(.,'Classificações')]
${Menu_Motivos_de_Urgencia}       //a[contains(.,'Motivos de Urgência')]
${Menu_Concessionarias}           //a[contains(.,'Concessionárias')]
${Menu_Departamentos}             //a[contains(.,'Departamentos')]
${Menu_Origem_da_Indicacao}       //a[contains(.,'Origem da indicação')]

*** Keywords ***
# --6.1
Dado que clico no menu "Cadastros > Pessoas"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Pessoas}

# --6.2
Dado que clico no menu "Cadastros > Grupos Consumidores"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Grupos_Consumidores}

# --6.3
Dado que clico no menu "Cadastros > Tipo de Gerador"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Tipo_de_Gerador}

# --6.4
Dado que clico no menu "Cadastros > Tipo de Financiamento"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Tipo_de_Financiamento}

# --6.5
Dado que clico no menu "Cadastros > Classificações"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Classificacoes}

# --6.6
Dado que clico no menu "Cadastros > Motivos de Urgência"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Motivos_de_Urgencia}

# --6.7
Dado que clico no menu "Cadastros > Concessionárias"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Concessionarias}

# --6.8
Dado que clico no menu "Cadastros > Departamentos"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Departamentos}

# --6.8
Dado que clico no menu "Cadastros > Origem da Indicação"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Origem_da_Indicacao}