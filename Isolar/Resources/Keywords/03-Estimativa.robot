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
${EXPECTED_RESULTS}    10

*** Keywords ***
# --3.1
Dado que clico no menu "Estimativa"
    Sleep    5s
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
    Wait Until Element Is Visible    //span[contains(.,'Quantidade de itens por pág')]    timeout=10s
    Click Element    //span[contains(.,'Quantidade de itens por pág')]

E preencho informações no campo quantidade
    Input Text    //input[contains(@id,'itensPorPagina')]   ${EXPECTED_RESULTS}

Então sistema exibe informações de acordo com quantidade preenchida
    Click Element    (//div[contains(.,'Quantidade')])[10]
    Sleep    5s
    ${resultados}    Get WebElements    xpath=//tr[contains(@class, 'border-b transition-colors')]
    ${quantidade}    Get Length    ${resultados}
    Should Be Equal As Numbers    ${quantidade - 1}    ${EXPECTED_RESULTS}

# --3.9

Quando clico em "Próximo"
    Wait Until Element Is Visible    //button[contains(.,'Próximo')]
    Click Element    //button[contains(.,'Próximo')]

Então sistema exibe próximas Estimativa
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior está visível. Funcionou."
    ...    ELSE    Log    "Botão Anterior não está visível. Falhou."    WARN

# --3.10

E clico em "Anterior"
    Click Element    //button[contains(.,'Anterior')]

Então sistema exibe Estimativa anteriores
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Not Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior não está visível. Funcionou.
    ...    ELSE    Log    "Botão Anterior ainda está visível. Falhou."    WARN


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

# --3.15

# E clico em "Fechar PDF"
#     Sleep    3s
#     Click Element    

# --3.16

E clico em "imprimir Estimativa"
    Click Element    //button[contains(.,'Imprimir Estimativa')]


Então sistema exibe informações de estimativa em arquivo PDF
    Wait Until Page Contains    text=PROPOSTA COMERCIAL

# --3.17
Quando clico no botão "Aplicar desconto"
    Sleep    5s
    Click Element    xpath=(//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[6]
E clico em "Cancelar"
    Click Element    (//button[@type='button'])[11]

Então sistema retorna e exibe informações do menu Estimativa
    Wait Until Page Contains    text=Histórico das estimativas

# --3.18
E preencho informações de desconto
    Input Text    //input[@id='descontoMaximo']    5
    Click Element    //button[contains(.,'Confirmar')]

Então sistema aplica desconto e exibe informações em arquivo PDF
    Wait Until Page Contains    text=Valor do projeto atualizado com sucesso!

# --3.19

E preencho informações de desconto acima do limite
    Input Text    //input[@id='descontoMaximo']    6
    Click Element    //button[contains(.,'Confirmar')]

Então sistema exibe mensagem de erro de desconto máximo permitido
    Wait Until Page Contains    text=O valor digitado é maior que o desconto máximo permitido.

# PÁGINA GERAR ESTIMATIVA
# --3.20

Quando clico no botão "Gerar"
    Wait Until Element Is Visible    //button[contains(.,'Gerar')]
    Click Element    //button[contains(.,'Gerar')]

Então sistema exibe informações do botão Gerar
    Wait Until Page Contains    text=Informe os campos para geração de estimativa para o estado de Santa Catarina.

E seleciono Local de instalação "Solo"
    Sleep    5s
    Click Element    xpath=//button[contains(@aria-controls,'radix-:rq:')]
    Click Element    xpath=//div[@role='option'][contains(.,'Solo')]

E seleciono Autoconsumo ou Aluguel "Autoconsumo"
    Click Element    xpath=//button[contains(@id,'consuInvest')]
    Click Element    xpath=//div[@role='option'][contains(.,'Autoconsumo')]

E seleciono GD1 ou GD2 "GD1"
    Click Element    xpath=//button[contains(@id,'GD1eGD2')]
    Click Element    xpath=//div[@role='option'][contains(.,'GD1')]


E seleciono Local de geração "Junto a carga"
    Click Element    xpath=//button[contains(@id,'localGeracao')]
    Click Element    xpath=//div[@role='option'][contains(.,'Junto a carga')]

E seleciono Estimativa pôr "Gasto mensal em R$" 
    Click Element    xpath=//button[contains(@id,'estimativaPor')]
    Click Element    xpath=//div[@role='option'][contains(.,'Gasto mensal em R$')]

E seleciono Valor da classificação "Trifásico"
    Click Element    xpath=//button[contains(@id,'valorClassificacao')]
    Click Element    xpath=//div[@role='option'][contains(.,'Trifásico')]

E preencho valor de Gasto mensal
    Input Text    //input[contains(@id,'mensalValor')]    500

E seleciono valor de tensão FF "220v"
    Click Element    xpath=//button[contains(@aria-controls,'radix-:r10:')]
    Click Element    xpath=//div[@role='option'][contains(.,'220 V')]

E seleciono valor de tensão FN "220v"
    Click Element    xpath=//button[contains(@id,'tensaoValor')]
    Click Element    xpath=//div[@role='option'][contains(.,'220 V')]

E clico em Gerar cálculos
    Click Element    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2'][contains(.,'Gerar cálculos')]


Então sistema exibe resultado dos cálculos
    Wait Until Page Contains    text=Resultado dos cálculos


# --3.22

E clico no botão "Constantes personalizadas"
    Wait Until Element Is Visible    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 mt-4 bg-blue-400'][contains(.,'Constantes personalizadas')] 
   Click Element    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 mt-4 bg-blue-400'][contains(.,'Constantes personalizadas')] 


Então sistema exibe aba de Constantes personalizadas
    Wait Until Page Contains    text=Constantes personalizadas
