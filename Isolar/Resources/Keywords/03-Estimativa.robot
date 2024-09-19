*** Settings ***
Documentation      Modúlo que gerencie as Estimativas cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Tela_Estimativa}        //h1[contains(.,'Histórico das estimativas')]
${Campo_Vendedor}         //input[@id='vendedor']
${Vendedor_Fila}          Fernando

*** Keywords ***
# --3.1
Dado que clico no menu "Estimativa"
    Wait Until Element Is Visible    ${MENU_ESTIMATIVA}
    Click Element                    ${MENU_ESTIMATIVA}

Então sistema exibe informações de estimativas
    Wait Until Element Is Visible    ${Tela_Estimativa}

# --3.2
E preencho informações no campo Vendedor
    Wait Until Element Is Visible    ${Campo_Vendedor}
    Input Text                       ${Campo_Vendedor}        Fernando

E clico em "Buscar"
    Click Element                    ${Botao_Buscar}

Então sistema exibe estimativas de filtro Vendedor
    Wait Until Element Is Visible        xpath=//td[contains(normalize-space(),'Fernando')]       timeout=10s
    ${statuses}=    Get Webelements      xpath=//td[contains(normalize-space(),'Fernando')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Contain    ${text}    ${Vendedor_Fila}
    END