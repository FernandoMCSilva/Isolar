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

# --3.7

E preencho com informações data de registro
    Click Element    (//button[@type='button'])[9]
    Click Element    (//button[contains(.,'12')])[1]
    Click Element    //button[contains(.,'Buscar')]
    Sleep    5s
Então sistema exibe Estimativa do filtro Data de registro
    Wait Until Page Contains    text=Fernando Morais da Costa Silva

# --3.8

Quando clico em "Quantidade de itens por pág"
    Sleep    5s
    Click Element    //span[contains(.,'Quantidade de itens por pág')]

E preencho informações no campo quantidade
    Input Text    //input[@value='12']    3
    Click Element    (//div[contains(.,'Quantidade')])[10]

Então sistema exibe informações de acordo com quantidade preenchida
    Sleep    10s
    Wait Until Page Contains    text=Suporte Francisco	

# --3.9

Quando clico em "Próximo"
    Sleep    5s
    Click Element    //button[contains(.,'Próximo')]

Então sistema exibe próximas Estimativa
    Wait Until Page Contains    text=Registros carregados com sucesso!

# --3.10

E clico em "Anterior"
    Click Element    //button[contains(.,'Anterior')]

Então sistema exibe Estimativa anteriores
    Wait Until Page Contains    text=Registros carregados com sucesso!

# # --3.11

# Quando clico em "Gerar link de assinatura" inativo
#     ${is_enabled}    Run Keyword And Return Status    Is Element Enabled    ${XPATH_BOTAO_GERAR_LINK}
#     Run Keyword If    '${is_enabled}' == 'False'    Log    O botão "Gerar link de assinatura" está inativo como esperado.
#     ...    ELSE    Fail    O botão "Gerar link de assinatura" está ativo, mas deveria estar inativo.
# # #     Então sistema não executa nenhuma ação

# --3.12

Quando clico em "Gerar link de assinatura"
    Sleep    5s
    Click Element    xpath=(//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10'])[2]

E clico em "Não"
    Click Element    (//button[@type='button'])[9]
    
Então sistema volta para menu Estimativa
    Wait Until Page Contains    text=Histórico das estimativas

# --3.13

E clico em "Sim"
    Sleep    5s
    Click Element    (//button[@type='button'])[10]

Então sistema exibe informações para criar assinaturas
    Wait Until Page Contains   text=Criar assinatura
    
# --3.14

Quando clico no botão "Ver PDF"
    Sleep    5s
    Click Element    xpath=(//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[5]

Então sistema exibe informações em aquivo PDF
    Wait Until Page Contains    text=Estimativa 