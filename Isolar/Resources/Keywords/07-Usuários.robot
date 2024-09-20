*** Settings ***
Documentation      Modúlo que Gerencie usuários cadastrados no sistema.
Resource           ../Main.robot

*** Variables ***
${Tela_Usuarios}            //h1[contains(.,'Usuários')]

*** Keywords ***                
# --7.1
Dado que clico no menu "Usuários"
    Wait Until Element Is Visible    ${MENU_USUARIOS}
    Click Element                    ${MENU_USUARIOS}

Então sistema exibe usuários
    Wait Until Element Is Visible    ${Tela_Usuarios}

# --7.2
Quando clico em combo "Lista"
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Cards')]
    Click Element                    //button[@type='button'][contains(.,'Cards')]
    Click Element                    //div[@role='option'][contains(.,'Lista')]
    Capture Page Screenshot

Então sistema exibe usuários como lista

# --7.3
Quando clico em combo "Cards"
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Cards')]
    Click Element                    //button[@type='button'][contains(.,'Cards')]
    Click Element                    //div[@role='option'][contains(.,'Cards')]
    Capture Page Screenshot

Então sistema exibe usuários como cards