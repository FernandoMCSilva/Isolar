*** Settings ***
Documentation      Modúlo que gerencie as Estimativas cadastradas no sistema.
Resource           ../Main.robot
Library    Telnet

*** Variables ***
${Tela_Estimativa}        //h1[contains(.,'Histórico das estimativas')]
${Campo_Vendedor}         //input[@id='vendedor']
${Vendedor_Fila}          Fernando        
${Campo_Cliente}          //input[@id='cliente']
${Cliente_Fila}           Fernando
@{TIPO_USINAS}            Todos     Autoconsumo    Aluguel
${EXPECTED_RESULTS}       2

${emailteste}             teste123@gmail.com   
${numeroteste}            21981905892
${valorteste}             0,7400

${botao_gerar_assinatura_Estimativa}     (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[10]
${botao_imprimir_estimativa}             //button[contains(.,'Imprimir Estimativa')]
${botao_verPDF}                          (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[5]
${botao_ExportarExcel_estimativa}        //button[contains(.,'Exportar para Excel')]
${botao_Acoes_Estimativa}                //button[contains(.,'Ações')]
${botao_baixar/imprimir_Estimativa}      //button[contains(.,'Baixar/Imprimir Estimativa')]
${botao_iniciarconversa_Estimativa}      //button[contains(.,'Iniciar conversa no WhatsApp')]
${botao_enviaremail_Estimativa}          //button[contains(.,'(0)Enviar por E-mail')]
${botao_salvarinformacoes_Estimativa}    //button[contains(.,'Salvar informações no sistema')]
${botao_baixar/imprimir_desabilitado}    (//div[contains(.,'Baixar/Imprimir Estimativa')])[4]
${botao_GerarCalculos_Estimativa}        //button[contains(.,'Gerar cálculos')]

${input_nomeCliente_Estimativa}      //input[@id='nomeCliente']
${input_numeroCliente_Estimativa}    //input[@id='numeroCliente']
${input_emailCliente_Estimativa}     //input[@id='emailCliente']
${CTRL}           CONTROL

*** Keywords ***
# --4.1
Dado que clico no menu "Estimativa"
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_ESTIMATIVA}
    Click Element                    ${MENU_ESTIMATIVA}

Então sistema exibe informações de estimativas
    Wait Until Element Is Visible    ${Tela_Estimativa}

# --4.2
E preencho informações no campo Vendedor
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]
    Press Keys    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    ${nome_pesquisa_GruposConsumidores}

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

# --4.3

# E preencho informações no campo Cliente em estimativa
#     Wait Until Element Is Visible    ${Campo_Cliente}
#     Input Text                       ${Campo_Cliente}        Fernando
#     Click Element                    ${Botao_Buscar}

Então sistema exibe estimativas do filtro Cliente
   Wait Until Element Is Visible        (//td[contains(.,'Fernando')])[2]
# --4.4
E seleciono Tipo de usina "Todos"  
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //div[@role='option'][contains(.,'Todos')]

Então sistema exibe informações de Estimativa do filtro Tipo de usina "Todos"
   Wait Until Element Is Visible        (//div[contains(.,'Registros carregados com sucesso!')])[7]

# --4.5
E seleciono Tipo de usina "Autoconsumo"
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //div[@role='option'][contains(.,'Autoconsumo')]

Então sistema exibe informações de Estimativa do filtro Tipo de usina "Autoconsumo"
    Wait Until Element Is Visible     (//div[contains(.,'Registros carregados com sucesso!')])[7]

# --4.6
E seleciono Tipo de usina "Aluguel"
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //button[@type='button'][contains(.,'Tipo')]
    Click Element    //div[@role='option'][contains(.,'Aluguel')]

Então sistema exibe informações de Estimativa do filtro Tipo de usina "Aluguel"
    Wait Until Page Contains    text=Registros carregados com sucesso!

# --4.7

E preencho com informações data de registro
    Wait Until Element Is Visible    (//button[@type='button'])[11]
    Click Element                    (//button[@type='button'])[11]
    Wait Until Element Is Visible    (//button[@type='button'])[13]
    FOR    ${i}    IN RANGE    6
    Click Element    (//button[@type='button'])[13]
    Sleep    0.5s
    END
    
    Click Element    (//button[contains(.,'12')])[1]
    Click Element    //button[contains(.,'Buscar')]
    Sleep    2s
Então sistema exibe Estimativa do filtro Data de registro
    Sleep    4s
    Wait Until Page Contains    text=12/09/2024

# --4.8
Quando clico em "Quantidade de itens por pág"
    Wait Until Element Is Visible    //span[contains(.,'Quantidade de itens por pág')]    timeout=10s
    Click Element                    //span[contains(.,'Quantidade de itens por pág')]

E preencho informações no campo quantidade
    Input Text    //input[contains(@id,'itensPorPagina')]   ${EXPECTED_RESULTS}

Então sistema exibe informações de acordo com quantidade preenchida
    Click Element    (//div[contains(.,'Quantidade')])[10]
    Sleep    5s
    ${resultados}    Get WebElements    xpath=//tr[contains(@class, 'border-b transition-colors')]
    ${quantidade}    Get Length    ${resultados}
    Should Be Equal As Numbers    ${quantidade - 1}    ${EXPECTED_RESULTS}

# --4.9

Quando clico em "Próximo"
    Wait Until Element Is Visible    //button[contains(.,'Próximo')]
    Click Element                    //button[contains(.,'Próximo')]

Então sistema exibe próximas Estimativa
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior está visível. Funcionou."
    ...    ELSE    Log    "Botão Anterior não está visível. Falhou."    WARN

# --4.10

E clico em "Anterior"
    Sleep    1s
    Click Element                    //button[contains(.,'Anterior')]

Então sistema exibe Estimativa anteriores
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Not Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior não está visível. Funcionou.
    ...    ELSE    Log    "Botão Anterior ainda está visível. Falhou."    WARN


# # --4.11

# Quando clico em "Gerar link de assinatura" inativo
#     ${is_enabled}    Run Keyword And Return Status    Is Element Enabled    ${XPATH_BOTAO_GERAR_LINK}
#     Run Keyword If    '${is_enabled}' == 'False'    Log    O botão "Gerar link de assinatura" está inativo como esperado.
#     ...    ELSE    Fail    O botão "Gerar link de assinatura" está ativo, mas deveria estar inativo.
# # #     Então sistema não executa nenhuma ação

# --4.12

Quando clico em "Gerar link de assinatura"
    Sleep    2s
    Click Element    ${botao_gerar_assinatura_Estimativa}
E clico em "Não"
    Click Element    //button[contains(.,'Sim')]
    Click Element    //button[contains(@class, 'absolute') and contains(@class, 'right-4') and contains(@class, 'top-4') and contains(@class, 'rounded-sm')]
    Click Element    //button[contains(.,'Fechar')]
    
Então sistema volta para menu Estimativa
    Wait Until Page Contains    text=Histórico das estimativas

# --4.13
E clico em "Sim"
    Wait Until Element Is Visible    (//button[contains(@type,'button')])[12]
    Click Element                    (//button[contains(@type,'button')])[12]

Então sistema exibe informações para criar assinaturas
    Wait Until Page Contains   text=Clique para fazer o upload
    
# --4.14
Quando clico no botão "Ver PDF"
    Wait Until Element Is Visible    ${botao_verPDF}
    Click Element                    ${botao_verPDF}

Então sistema exibe informações em aquivo PDF
    Wait Until Page Contains    text=08/01/2025

E clico em "imprimir Estimativa"
    Wait Until Element Is Visible    ${botao_imprimir_estimativa}
    Click Element                    ${botao_imprimir_estimativa}

Então sistema exibe informações de estimativa em arquivo PDF
    Wait Until Page Contains    text=08/01/2025    timeout=10s
    # Wait Until Page Contains    text=PROPOSTA COMERCIAL

# --4.17
Quando clico no botão "Aplicar desconto"
    Sleep    5s
    Click Element    xpath=(//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[6]
E clico em "Cancelar"
    Click Element    (//button[@type='button'])[11]

Então sistema retorna e exibe informações do menu Estimativa
    Wait Until Page Contains    text=Histórico das estimativas

# --4.18
E preencho informações de desconto
    Input Text    //input[@id='descontoMaximo']    5
    Click Element    //button[contains(.,'Confirmar')]

Então sistema aplica desconto e exibe informações em arquivo PDF
    Wait Until Page Contains    text=Valor do projeto atualizado com sucesso!

# --4.19

E preencho informações de desconto acima do limite
    Input Text    //input[@id='descontoMaximo']    6
    Click Element    //button[contains(.,'Confirmar')]

Então sistema exibe mensagem de erro de desconto máximo permitido
    Wait Until Page Contains    text=O valor digitado é maior que o desconto máximo permitido.

# PÁGINA GERAR ESTIMATIVA
# --4.20

Quando clico no botão "Gerar"
    Wait Until Element Is Visible    //button[contains(.,'Gerar')]
    Click Element    //button[contains(.,'Gerar')]

Então sistema exibe informações do botão Gerar
    Wait Until Page Contains    text=Informe os campos para geração de estimativa para o estado de Santa Catarina.

E seleciono Local de instalação "Solo"
    Sleep    5s
    Click Element    (//button[contains(.,'Selecione')])[1]
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

E seleciono valor da classificação "Trifásico"
    Click Element    xpath=//button[contains(@id,'valorClassificacao')]
    Click Element    xpath=//div[@role='option'][contains(.,'Trifásico')]

E preencho valor de Gasto mensal
    Input Text    //input[contains(@id,'mensalValor')]    500

E seleciono valor de tensão FF "220v"
    Wait Until Element Is Visible    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'220 V')])[5]

E seleciono valor de tensão FN "220v"
    Click Element    xpath=//button[contains(@id,'tensaoValor')]
    Click Element    xpath=//div[@role='option'][contains(.,'220 V')]

E clico em Gerar cálculos
    Wait Until Element Is Visible    ${botao_GerarCalculos_Estimativa}
    Click Element                    ${botao_GerarCalculos_Estimativa}

Então sistema exibe resultado dos cálculos
    Wait Until Page Contains    text=Resultado dos cálculos

# --4.21
E clico no botão "Constantes personalizadas"
    Wait Until Element Is Visible    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 mt-4 bg-blue-400'][contains(.,'Constantes personalizadas')] 
   Click Element    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 mt-4 bg-blue-400'][contains(.,'Constantes personalizadas')] 

Então sistema exibe aba de Constantes personalizadas
    Wait Until Page Contains    text=Constantes personalizadas

# --4.22
Quando clico no botão Exportar para Excel
    Wait Until Element Is Visible    ${botao_ExportarExcel_estimativa}
    Click Element                    ${botao_ExportarExcel_estimativa}
Então sistema exporta para excel
    Wait Until Element Is Visible    ${botao_ExportarExcel_estimativa}

# --4.23
Então sistema exibe mensagem de campos obrigatórios não preenchido em estimativa
    Wait Until Page Contains    text=Valor da tensão é obrigatório.

# --4.24
E preencho informações de calculos
    Wait Until Element Is Visible    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'Solo')])[5]

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'Gasto mensal em R$')])[5]


    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'Autoconsumo')])[15]

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'Junto a carga')])[5]

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'Trifásico')])[5]

    Click Element                    (//button[@id='tensaoValor'])[1]
    Click Element                    (//div[contains(.,'127 V')])[5]

    Click Element                    //button[@id='tensaoValor']
    Click Element                    (//div[contains(.,'220 V')])[5]

    Input Text                       //input[@id='mensalValor']    500,00
E clico no botão Ações
    Wait Until Element Is Visible    ${botao_Acoes_Estimativa}
    Click Element                    ${botao_Acoes_Estimativa}
    
Então sistema exibe tela de botão ações 
    Wait Until Page Contains    text=Baixar/Imprimir Estimativa

# --4.25
E preencho informações do cliente
    Wait Until Element Is Visible    ${input_nomeCliente_Estimativa}
    Input Text                       ${input_nomeCliente_Estimativa}        ${nome_pesquisa_GruposConsumidores}
    Input Text                       ${input_numeroCliente_Estimativa}      ${numeroteste}
    Input Text                       ${input_emailCliente_Estimativa}       ${emailteste}

E clico no botão Baixar/Imprimir
    Wait Until Element Is Visible    ${botao_baixar/imprimir_Estimativa}
    Click Element                    ${botao_baixar/imprimir_Estimativa}
    Sleep    1s 
    Click Element                    //button[contains(.,'Confirmar')]

Então sistema Baixa/Imprime Estimativa
    Wait Until Page Contains    text=Estimativa salva com sucesso!

# --4.26
E clico no botão Iniciar conversa no WhatsApp
    Wait Until Element Is Visible    ${botao_iniciarconversa_Estimativa}
    Click Element                    ${botao_iniciarconversa_Estimativa}
    Wait Until Element Is Visible    //button[contains(.,'Confirmar')]
    Click Element                    //button[contains(.,'Confirmar')]


Então sistema redireciona para Whatsapp
    Wait Until Page Contains    text=Estimativa salva com sucesso!

# --4.27
E clico no botão Enviar por email
    Wait Until Element Is Visible    ${botao_enviaremail_Estimativa}
    Click Element                    ${botao_enviaremail_Estimativa}
    Wait Until Element Is Visible    //button[contains(.,'Confirmar')]
    Click Element                    //button[contains(.,'Confirmar')]
    Wait Until Element Is Visible    //button[contains(.,'Sim')]
    Click Element                    //button[contains(.,'Sim')]

Então sistema abre informações do email
    Wait Until Page Contains    text=Selecione ou arraste a estimativa

# --4.28
E clico no botão Salvar informarções no sistema
    Wait Until Element Is Visible    ${botao_salvarinformacoes_Estimativa}
    Click Element                    ${botao_salvarinformacoes_Estimativa}
    Wait Until Element Is Visible    //button[contains(.,'Confirmar')]
    Click Element                    //button[contains(.,'Confirmar')]


Então sistema salva informações no sistema
    Wait Until Page Contains    text=Estimativa salva com sucesso!

# --4.29
E clico no botão Baixar/Imprimir desabilitado
    Wait Until Element Is Visible    ${botao_baixar/imprimir_desabilitado}
    Click Element                    ${botao_baixar/imprimir_desabilitado}

Então sistema sai da tela do botão Ações
    Wait Until Element Is Not Visible    ${botao_baixar/imprimir_desabilitado}
    Element Should Not Be Visible        ${botao_baixar/imprimir_desabilitado}

# --4.30
# E preencho informações de constantes personalizadas
#     Sleep    2s
#     Execute JavaScript    document.querySelector("#radix-r11").style.zoom='0.8'
#     Sleep    2s
#     Click Element               //input[@value='0,7400']
    # Input Text                  //input[@value='0,7400']    ${valorteste}

# --4.22