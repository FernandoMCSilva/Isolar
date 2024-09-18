*** Settings ***
Documentation      Modúlo gerencia Perfil no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Graficos}                      //span[contains(.,'Gráficos')]
${Menu_Perfil_Configuracoes}          (//span[contains(.,'Configurações')])[2]
${Menu_☼}                             //svg[contains(@xmlns,'http://www.w3.org/2000/svg')]

*** Keywords ***
# --10.1
Dado que clico no menu "Perfil > Gráficos"
    Wait Until Element Is Visible    ${MENU_PERFIL}
    Click Element                    ${MENU_PERFIL}
    Wait Until Element Is Visible    ${Menu_Graficos} 
    Click Element                    ${Menu_Graficos} 

# --10.2
Dado que clico no menu "Perfil > Configurações"
    Wait Until Element Is Visible    ${MENU_PERFIL}
    Click Element                    ${MENU_PERFIL}
    Wait Until Element Is Visible    ${Menu_Perfil_Configuracoes}
    Click Element                    ${Menu_Perfil_Configuracoes}

# --10.3
Dado que clico no menu "Perfil > ☼"
    Wait Until Element Is Visible    ${MENU_PERFIL}
    Click Element                    ${MENU_PERFIL}
    Wait Until Element Is Visible    ${Menu_☼}
    Click Element                    ${Menu_☼}