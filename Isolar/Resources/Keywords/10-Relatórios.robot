*** Settings ***
Documentation      Modúlo gerencia Relatórios no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Relatorios}                   (//span[contains(.,'Relatórios')])[2]
${Menu_Relatorios>Relatorios}        //a[contains(.,'Relatórios')]
${Menu_Homologatorias}               //p[contains(.,'Homologatórias')]
${nome_pesquisa_Relatórios}          Teste

${filtro_ANEEL}                      (//div[contains(.,'Selecione ...')])[17]
${filtro_Concessionaria}             (//div[contains(.,'Selecione ...')])[22]
${filtro_Acessante}                  (//div[contains(.,'Selecione ...')])[27]
${filtro_Classe}                     (//div[contains(.,'Selecione ...')])[32]
${filtro_Detalhe}                    (//div[contains(.,'Selecione ...')])[37]
${filtro_Posto}                      (//div[contains(.,'Selecione ...')])[42]
${filtro_Ano}                        //button[contains(.,'Selecione um ano')]
${filtro_Subgrupo}                   (//div[contains(.,'Selecione ...')])[48]
${filtro_Modalidade}                 (//div[contains(.,'Selecione ...')])[53]
${filtro_SubClasse}                  (//div[contains(.,'Selecione ...')])[58]
${filtro_Outorga}                    (//div[contains(.,'Todos')])[17]

${result_ANEEL}                      (//td[@class='p-4 align-middle [&:has([role=checkbox])]:pr-0 text-center font-bold'][contains(.,'DSP RETIFICAÇÃO DE 24 DE NOVEMBRO DE 2016')])[1]
${result_Concessionaria}             (//td[contains(.,'Castro - DIS')])[1]
${result_Acessante}                  //td[@class='p-4 align-middle [&:has([role=checkbox])]:pr-0 text-center'][contains(.,'ADVOGADO EDUARDO SOARES (ANTIGA BOA ESPERANÇA)')]
${result_Classe}                     (//td[contains(.,'Residencial')])[1]
${result_Detalhe}                    (//td[contains(.,'TIPO 02')])[1]
${result_Posto}                      (//td[contains(.,'Fora ponta')])[1]
${result_Ano}                        (//td[contains(.,'01/11/2020')])[1]
${result_Subgrupo}                   (//td[contains(.,'B3')])[1]
${result_Modalidade}                 (//td[contains(.,'Convencional')])[1]
${result_Subclasse}                  (//td[contains(.,'Baixa Renda')])[1]
${result_Outorga}                    (//td[contains(.,'Amazonas Energia')])[1]

${Campo_Cliente}                     //input[@id='cliente']
${campo_clienteRelatorios}           //div[@class='select__value-container css-hlgwow'][contains(.,'Digite o nome do cliente...')]
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
    Wait Until Element Is Visible    ${campo_clienteRelatorios}
    Sleep    2s
    Click Element                    ${campo_clienteRelatorios}
    Click Element                    (//div[contains(.,'Evandro Carlos Mior')])[19]
Então sistema exibe informações de filtro "Cliente"
    Wait Until Element Is Visible    //td[contains(.,'Evandro Carlos Mior')]    timeout=10s
    ${resultado}=    Get Text    //td[contains(.,'Evandro Carlos Mior')]
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
    Click Element    (//div[contains(.,'Todos')])[27]
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
E seleciono filtro Tipo de requisição "Todos"
    Wait Until Element Is Visible    //button[@id='tipo']
    Click Element                    //button[@id='tipo']
    Click Element                    (//div[contains(.,'Todos')])[27]

Então sistema exibe informações de filtro Tipo de requisição "Todos"
    Wait Until Element Is Visible    (//td[contains(.,'Técnico')])[1]

# --10.01.10
E seleciono filtro Data de criação
    Wait Until Element Is Visible    //button[contains(.,'Selecione a data')]
    Click Element                    //button[contains(.,'Selecione a data')]
    Click Element                    (//button[@type='button'])[19]    # Clica na seta para voltar
    Click Element                    (//button[@type='button'])[19]    # Clica na seta para voltar
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
    Click Element                    (//div[contains(.,'Todos')])[27]

Então sistema exibe informações de filtro Promotor "Todos"
    Wait Until Element Is Visible    (//td[contains(.,'Não definido')])[2]

# --10.01.12
E seleciono filtro Indicador "Todos"
    Wait Until Element Is Visible    (//button[contains(.,'Todos')])[8]
    Click Element                    (//button[contains(.,'Todos')])[8]
    Click Element                    (//div[contains(.,'Todos')])[27]
    
Então sistema exibe informações de filtro Indicador "Todos"
    Wait Until Element Is Visible    (//td[contains(.,'Não definido')])[2]

# --10.01.13
E seleciono fitro Departamento "TI"
    Wait Until Element Is Visible    //button[contains(.,'Comercial')]
    Click Element                    //button[contains(.,'Comercial')]
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

# --10.02.02
E preencho informação de filtro resolução ANEEL
    Wait Until Element Is Visible    ${filtro_ANEEL}
    Click Element                    ${filtro_ANEEL}
    Sleep    1s
    Click Element                    //div[@id='react-select-2-option-1']

Então sistema exibe informações de filtro resolução ANEEL
    Wait Until Element Is Visible    ${result_ANEEL}

# --10.02.02
E preencho informação de filtro Concessionária
    Wait Until Element Is Visible    ${filtro_Concessionaria}
    Click Element                    ${filtro_Concessionaria}
    Click Element                    (//div[contains(.,'Castro - DIS')])[4]
Então sistema exibe informações de filtro Concessionária
    Wait Until Element Is Visible    ${result_Concessionaria}

# --10.02.04
E preencho informação de filtro Acessante
    Wait Until Element Is Visible    ${filtro_Acessante}    
    Click Element                    ${filtro_Acessante}
    Click Element                    (//div[contains(.,'ADVOGADO EDUARDO SOARES (ANTIGA BOA ESPERANÇA)')])[4]

Então sistema exibe informações de filtro Acessante
    Wait Until Element Is Visible    ${result_Acessante}

# --10.02.05
E preencho informação de filtro Classe
    Wait Until Element Is Visible    ${filtro_Classe}
    Click Element                    ${filtro_Classe}
    Click Element                    (//div[contains(.,'Residencial')])[4]

Então sistema exibe informações de filtro Classe
    Wait Until Element Is Visible    ${result_Classe}

# --10.02.06
E preencho informação de filtro Detalhe
    Wait Until Element Is Visible    ${filtro_Detalhe}
    Click Element                    ${filtro_Detalhe}
    Click Element                    (//div[contains(.,'TIPO 02')])[12]

Então sistema exibe informações de filtro Detalhe
    Wait Until Element Is Visible    ${result_Detalhe}    

# --10.02.07
E preencho informação de filtro Posto
    Wait Until Element Is Visible    ${filtro_Posto}
    Click Element                    ${filtro_Posto}
    Click Element                    (//div[contains(.,'Fora ponta')])[12]

Então sistema exibe informações de filtro Posto
    Wait Until Element Is Visible    ${result_Posto}

# --10.02.08
E preencho informação de filtro Ano
    Wait Until Element Is Visible    ${filtro_Ano}
    Click Element                    ${filtro_Ano}
    Click Element                    (//div[contains(.,'2020')])[5]

Então sistema exibe informações de filtro Ano
    Wait Until Element Is Visible    ${result_Ano}

# --10.02.09
E preencho informação de filtro Subgrupo
    Wait Until Element Is Visible    ${filtro_Subgrupo}
    Click Element                    ${filtro_Subgrupo}
    Click Element                    (//div[contains(.,'B3')])[4]

Então sistema exibe informações de filtro Subgrupo
    Wait Until Element Is Visible    ${result_Subgrupo}

# --10.02.10
E preencho informação de filtro Modalidade
    Wait Until Element Is Visible    ${filtro_Modalidade}
    Click Element                    ${filtro_Modalidade}
    Click Element                    (//div[contains(.,'Convencional')])[4]

Então sistema exibe informações de filtro Modalidade
    Wait Until Element Is Visible    ${result_Modalidade}

# --10.02.11
E preencho informação de filtro SubClasse
    Wait Until Element Is Visible    ${filtro_SubClasse}
    Click Element                    ${filtro_SubClasse}
    Click Element                    (//div[contains(.,'Baixa Renda')])[4]

Então sistema exibe informações de filtro SubClasse
    Wait Until Element Is Visible    ${result_Subclasse}

# --10.02.12
E preencho informação de filtro Outorga
    Wait Until Element Is Visible    ${filtro_Outorga}
    Click Element                    ${filtro_Outorga}
    Click Element                    (//div[contains(.,'Concessionária')])[23]
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    2s

Então sistema exibe informações de filtro Outorga
    Wait Until Element Is Visible    ${result_Outorga}

# --10.02.01
Então sistema exibe informações do menu Relatórios > Homologatórias
    Wait Until Page Contains    text=Homologatórias ANEEL

# --10.02.12
Então sistema exibe quantidade de itens preenchida em Relatórios
    Click Element    (//div[contains(.,'Quantidade')])[15]
    Sleep    5s
    ${resultados}    Get WebElements    xpath=//tr[contains(@class, 'border-b transition-colors')]
    ${quantidade}    Get Length    ${resultados}
    Should Be Equal As Numbers    ${quantidade - 1}    ${EXPECTED_RESULTS}
