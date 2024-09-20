*** Settings ***
Documentation      Gerenciar informações de rede direto pelo sistema.
Resource           ../Main.robot

*** Variables ***


*** Keywords ***
# --10.1
Dado que clico no menu "Monitoramento"
    Wait Until Element Is Visible    ${MENU_MONITORAMENTO}
    Click Element                    ${MENU_MONITORAMENTO}