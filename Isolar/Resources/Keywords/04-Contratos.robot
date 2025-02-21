*** Settings ***
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_ContratosDashBoard}                //a[contains(.,'Dashboard')]
${Menu_ContratosContratos}                //a[contains(.,'Contratos')]


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

# -4.1.1