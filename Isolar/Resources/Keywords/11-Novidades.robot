*** Settings ***
Documentation      Modúlo que Gerencie o menu Novidades
Resource           ../Main.robot

*** Keywords ***
# --11.1
Dado que clico no menu "Novidades"
    Wait Until Element Is Visible    ${MENU_NOVIDADES}
    Click Element                    ${MENU_NOVIDADES}