*** Settings ***
Documentation      Modúlo gerencia Relatórios no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Relatorios}                   (//span[contains(.,'Relatórios')])[2]
${Menu_Homologatorias}               //p[contains(.,'Homologatórias')]

*** Keywords ***
# --8.1
Dado que clico no menu "Relatórios > Relatórios"
    Wait Until Element Is Visible    ${MENU_RELATORIOS}
    Click Element                    ${MENU_RELATORIOS}
    Wait Until Element Is Visible    ${Menu_Relatorios}
    Click Element                    ${Menu_Relatorios}

Dado que clico no menu "Relatórios > Homologatórias"
    Wait Until Element Is Visible    ${MENU_RELATORIOS}
    Click Element                    ${MENU_RELATORIOS}
    Wait Until Element Is Visible    ${Menu_Homologatorias}
    Click Element                    ${Menu_Homologatorias}
