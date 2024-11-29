*** Settings ***
Documentation      Modúlo gerencia Relatórios no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Relatorios}                   (//span[contains(.,'Relatórios')])[2]
${Menu_Relatorios>Relatorios}        //a[contains(.,'Relatórios')]
${Menu_Homologatorias}               //p[contains(.,'Homologatórias')]
${nome_pesquisa_Relatórios}          Teste

${Campo_Cliente}                     //input[@id='cliente']

${botao_exportarPDF_Relatorios}      //button[contains(.,'Exportar para PDF')]


*** Keywords ***
# --10.01.01
Dado que clico no menu "Relatórios > Relatórios"
    Wait Until Element Is Visible    ${Menu_Relatorios}
    Click Element                    ${Menu_Relatorios}
    Wait Until Element Is Visible    ${Menu_Relatorios>Relatorios}
    Click Element                    ${Menu_Relatorios>Relatorios}

Então sistema exibe informações de menu Relatórios > Relatórios
    Wait Until Page Contains    text=Gerencie um resumo das informações cadastradas no sistema.

# --10.01.02
E preencho informações de filtro "Cliente"
    Wait Until Element Is Visible         ${Campo_Cliente}
    Input Text        ${Campo_Cliente}    ${nome_pesquisa_Relatórios}

Então sistema exibe informações de filtro "Cliente"
    Wait Until Element Is Visible    (//td[contains(@class,'p-4 align-middle [&:has([role=checkbox])]:pr-0 text-center')])[2]    timeout=10s
    ${resultado}=    Get Text    (//td[contains(@class,'p-4 align-middle [&:has([role=checkbox])]:pr-0 text-center')])[2]
    Run Keyword If    '${resultado}' == '${nome_pesquisa_Relatórios}'    Log    Aprovado.
    Run Keyword Unless    '${resultado}' == '${nome_pesquisa_Relatórios}'    Fail    Reprovado.

# --10.01.03
E seleciono filtro Status "Fila"
    Click Element    //button[@id='status']
    Click Element    (//div[contains(.,'Fila')])[5]

Então sistema exibe informações de filtro Status "Fila"
    Wait Until Element Is Visible    (//div[contains(.,'Fila')])[18]

# --10.01.04
E seleciono filtro Responsável "suporte"
    Click Element    (//button[contains(.,'Todos')])[2]
    Click Element    (//div[contains(.,'suporte')])[5]

Então sistema exibe informações de filtro Responsável "suporte"
    Wait Until Element Is Visible    //td[contains(.,'suporte')]    timeout=10s
    ${resultado}=    Get Text    //td[contains(.,'suporte')]
    Run Keyword If    '${resultado}' == 'suporte'    Log    Aprovado.
    Run Keyword Unless    '${resultado}' == 'suporte'    Fail    Reprovado.

# --10.01.05
E seleciono filtro Vendedor Técnico "Todos"
    Click Element    (//button[contains(.,'Todos')])[3]
    Click Element    (//div[contains(.,'Todos')])[28]
Então sistema exibe informações de filtro Vendedor Técnico "Todos"
    Wait Until Page Contains    text=Não definido

# --10.01.06
E seleciono filtro Representante comercial "B3 (teste)"
    Wait Until Element Is Visible    (//button[contains(.,'Todos')])[4]
    Click Element                    (//button[contains(.,'Todos')])[4]
    Click Element                    (//div[contains(.,'B3 (teste)')])[5]

Então sistema exibe informações de filtro Representante comercial "B3 (teste)"
    Wait Until Page Contains    text=Nenhum relatório encontrado.

# --10.01.07
E seleciono o filtro Renovadas "Renovadas"
    Wait Until Element Is Visible    //button[@id='renovada']
    Click Element                    //button[@id='renovada']
    Click Element                    (//div[contains(.,'Renovadas')])[19]

Então sistema exibe informações de filtro Renovadas "Renovadas"
    Wait Until Element Is Visible    (//div[contains(.,'Produção')])[9]

# --10.01.08
E preencho informações de filtro Unidade consumidora
    Wait Until Element Is Visible    //input[@id='unidade_consumidora']
    Input Text                       //input[@id='unidade_consumidora']    1234

Então sistema exibe informações de filtro Unidade Consumidora
    Wait Until Page Contains    text=alexander leidou

# --10.01.09
E seleciono filtro Tipo de requisição "Estimativa"
    Wait Until Element Is Visible    //button[@id='tipo']
    Click Element                    //button[@id='tipo']
    Click Element                    (//div[contains(.,'Estimativa')])[18]

Então sistema exibe informações de filtro Tipo de requisição "Estimativa"
    Wait Until Element Is Visible    (//td[contains(.,'Estimativa')])[1]

# --10.01.10
E seleciono filtro Data de criação
    Wait Until Element Is Visible    //button[contains(.,'Selecione a data')]
    Click Element                    //button[contains(.,'Selecione a data')]
    Click Element                    (//button[@type='button'])[19]    # Clica na seta para voltar
    Click Element                    (//button[@type='button'])[19]    # Clica na seta para voltar
    Sleep    1s
    # Sai do loop e clica no dia 12 de setembro
    Click Element    (//button[contains(.,'1')])[1]
    Click Element    //button[contains(.,'31')]

Então sistema exibe informações de filtro Data de criação
    Wait Until Element Is Visible    (//td[contains(.,'02/09/2024')])[1]

# --10.01.11
E seleciono filtro Promotor "Todos"
    Wait Until Element Is Visible    (//button[contains(.,'Todos')])[7]
    Click Element                    (//button[contains(.,'Todos')])[7]
    Click Element                    (//div[contains(.,'Todos')])[28]

Então sistema exibe informações de filtro Promotor "Todos"
    Wait Until Element Is Visible    (//td[contains(.,'Não definido')])[2]

# --10.01.12
E seleciono filtro Indicador "Todos"
    Wait Until Element Is Visible    (//button[contains(.,'Todos')])[8]
    Click Element                    (//button[contains(.,'Todos')])[8]
    Click Element                    (//div[contains(.,'Todos')])[28]
    
Então sistema exibe informações de filtro Indicador "Todos"
    Wait Until Element Is Visible    (//td[contains(.,'Não definido')])[2]

# --10.01.13
E seleciono fitro Departamento "TI"
    Wait Until Element Is Visible    (//button[contains(.,'Todos')])[9]
    Click Element                    (//button[contains(.,'Todos')])[9]
    Click Element                    (//div[contains(.,'TI')])[5]

Então sistema exibe informações de filtro Departamento "TI"
    Wait Until Page Contains    text=Nenhum relatório encontrado.

# --10.01.16
Quando clico no botão Exportar para PDF
    Wait Until Element Is Visible    ${botao_exportarPDF_Relatorios}
    Click Element                    ${botao_exportarPDF_Relatorios}

Então sistema exporta para PDF
    Wait Until Element Is Visible    ${botao_exportarPDF_Relatorios}

# --10.01.17
Então sistema exibe próximas informações
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior está visível. Funcionou."
    ...    ELSE    Log    "Botão Anterior não está visível. Falhou."    WARN

# --10.01.18
Então sistema exibe informações anteriores   
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Not Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior não está visível. Funcionou.
    ...    ELSE    Log    "Botão Anterior ainda está visível. Falhou."    WARN

# --10.02.01
Dado que clico no menu "Relatórios > Homologatórias"
    Wait Until Element Is Visible    ${MENU_RELATORIOS}
    Click Element                    ${MENU_RELATORIOS}
    Wait Until Element Is Visible    ${Menu_Homologatorias}
    Click Element                    ${Menu_Homologatorias}

Então sistema exibe informações do menu Relatórios > Homologatórias
    Wait Until Page Contains    text=Homologatórias ANEEL



# --10.02.12
Então sistema exibe quantidade de itens preenchida em Relatórios
    Click Element    (//div[contains(.,'Quantidade')])[15]
    Sleep    5s
    ${resultados}    Get WebElements    xpath=//tr[contains(@class, 'border-b transition-colors')]
    ${quantidade}    Get Length    ${resultados}
    Should Be Equal As Numbers    ${quantidade - 1}    ${EXPECTED_RESULTS}

# --10.02.01