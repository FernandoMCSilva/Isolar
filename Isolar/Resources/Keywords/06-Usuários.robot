*** Settings ***
Documentation      Modúlo que Gerencie usuários cadastrados no sistema.
Resource           ../Main.robot

*** Variables ***

*** Keywords ***                
# --6.1
Dado que clico no menu "Usuários"
    Wait Until Element Is Visible    ${MENU_USUARIOS}
    Click Element                    ${MENU_USUARIOS}