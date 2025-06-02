* Settings *
Documentation      Modúlo que Gerencie o menu Novidades
Resource           ../Main.robot

* Variables *
${botao_Atulaizacoes_Novidades}       //button[contains(.,'Atualizações')]
${botao_FAQ_Novidades}                //button[contains(.,'FAQ')]


* Keywords *
# --12.1
Dado que clico no menu "Novidades"
    Wait Until Element Is Visible    ${MENU_NOVIDADES}
    Click Element                    ${MENU_NOVIDADES}

Então sistema exibe página de Novidades
    Wait Until Page Contains    text=Acompanhe as funcionalidades adicionadas ao sistema.

# --12.2
Quando clico no menu FAQ
    Wait Until Element Is Visible    ${botao_FAQ_Novidades}
    Click Element                    ${botao_FAQ_Novidades}

Então sistema exibe página de FAQ
    Wait Until Page Contains    text=Novidades
    
# --12.3
Quando clico no menu Atualizações
    Wait Until Element Is Visible    ${botao_Atulaizacoes_Novidades}
    Click Element                    ${botao_Atulaizacoes_Novidades}
Então sistema exibe página de Atualizações
    Wait Until Page Contains    text=Novidades