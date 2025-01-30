*** Settings ***
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_ObrasDashboard}                //a[contains(.,'Dashboard')]
${Menu_ObrasRequisicoes}              (//a[contains(.,'Requisições')])[2]



*** Keywords ***                
# -3.1.1
Dado que clico no menu Obras > Dashboard
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_OBRAS}
    Click Element                    ${MENU_OBRAS}
    Wait Until Element Is Visible    ${Menu_ObrasDashboard}
    Click Element                    ${Menu_ObrasDashboard}

Então sistema exibe tela de Obras > Dashboard
    Wait Until Page Contains    text=Obras
    Wait Until Page Contains    text=Gerencie um resumo das informações cadastradas no sistema.

# -3.1.2
Então sistema exibe informações de filtros de data
    Wait Until Element Is Visible    (//span[contains(.,'1')])[3]


# -3.1.1