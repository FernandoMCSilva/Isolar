*** Settings ***
Documentation      Modúlo que gerencie as Estimativas cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Tela_Estimativa}        //h1[contains(.,'Histórico das estimativas')]
${Campo_Vendedor}         //input[@id='vendedor']
${Vendedor_Fila}          Fernando        
${Campo_Cliente}          //input[@id='cliente']
${Cliente_Fila}           Fernando
@{TIPO_USINAS}        Todos     Autoconsumo    Aluguel

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

# --3.3

# E preencho informações no campo Cliente em estimativa
#     Wait Until Element Is Visible    ${Campo_Cliente}
#     Input Text                       ${Campo_Cliente}        Fernando
#     Click Element                    ${Botao_Buscar}

Então sistema exibe estimativas do filtro Cliente
   Wait Until Element Is Visible        xpath=//td[contains(normalize-space(),'Fernando')]       timeout=10s
    ${statuses}=    Get Webelements      xpath=//td[contains(normalize-space(),'Fernando')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Contain    ${text}    ${Cliente_Fila}
    END

# --3.4
E seleciono Tipo de usina "Todos"  
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //div[@role='option'][contains(.,'Todos')]

Então sistema exibe informações de Estimativa do filtro Tipo de usina "Todos"
   Wait Until Element Is Visible        (//div[contains(.,'Registros carregados com sucesso!')])[7]

# --3.5
E seleciono Tipo de usina "Autoconsumo"
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //div[@role='option'][contains(.,'Autoconsumo')]

Então sistema exibe informações de Estimativa do filtro Tipo de usina "Autoconsumo"
    Wait Until Element Is Visible     (//div[contains(.,'Registros carregados com sucesso!')])[7]

# --3.6
E seleciono Tipo de usina "Aluguel"
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //div[@role='option'][contains(.,'Aluguel')]

Então sistema exibe informações de Estimativa do filtro Tipo de usina "Aluguel"
    Wait Until Element Is Visible     (//div[contains(.,'Registros carregados com sucesso!')])[7]