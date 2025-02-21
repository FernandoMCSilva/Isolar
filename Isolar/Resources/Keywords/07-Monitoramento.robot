*** Settings ***
Documentation      Gerenciar informações de rede direto pelo sistema.
Resource           ../Main.robot

*** Variables ***
${MENU_MONITORAMENTO_local}    //a[contains(.,'Monitoramento')]
# Não está funcionando com a variável GLOBAL, então criei uma variavel local e funcionou. 
*** Keywords ***
# --6.1
Dado que clico no menu "Monitoramento"
    Wait Until Element Is Visible    ${MENU_MONITORAMENTO_local}
    Click Element                    ${MENU_MONITORAMENTO_local}
    Sleep    4s
    
Então sistema entra na página Monitoramento
    Wait Until Page Contains    text=Gerenciar informações de rede direto pelo sistema