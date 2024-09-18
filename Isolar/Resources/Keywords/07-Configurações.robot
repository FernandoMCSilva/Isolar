*** Settings ***
Documentation      Modúlo gerencia Configurações no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Requisicoes}             (//p[contains(.,'Requisições')])[2]
${Menu_Documentos}              (//p[contains(.,'Documentos')])[2]
${Menu_Estimativa}              (//p[contains(.,'Estimativa')])[2]
${Menu_Sistema}                 //span[contains(.,'Sistema')]

*** Keywords ***
# --7.1
Dado que clico no menu "Configurações > Requisições"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Click Element                    ${Menu_Requisicoes} 

# --7.2
Dado que clico no menu "Configurações > Documentos"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Wait Until Element Is Visible    ${Menu_Documentos}
    Click Element                    ${Menu_Documentos}

# --7.3
Dado que clico no menu "Configurações > Estimativa"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Wait Until Element Is Visible    ${Menu_Estimativa}
    Click Element                    ${Menu_Estimativa}

# --7.4
Dado que clico no menu "Configurações > Sistema"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Click Element                    ${Menu_Sistema}