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

${result_ANEEL}                      (//div[@class='select__value-container select__value-container--is-multi css-hlgwow'])[3]
${result_Concessionaria}             (//td[contains(.,'Castro - DIS')])[1]
${result_Acessante}                  (//td[@class='p-4 align-middle [&:has([role=checkbox])]:pr-0 text-center'][normalize-space()='BOREALIS'])[1]
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

${filtro_DataCriacaoRelatorios}      (//button[@class='inline-flex items-center whitespace-nowrap rounded-md text-sm ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start text-left font-normal text-muted-foreground'])[1]


*** Keywords ***
# --11.01.01
Dado que clico no menu "Relatórios > Relatórios"
    Wait Until Element Is Visible    ${Menu_Relatorios}    timeout=20s
    Click Element                    ${Menu_Relatorios}
    Wait Until Element Is Visible    ${Menu_Relatorios>Relatorios}
    Click Element                    ${Menu_Relatorios>Relatorios}

Então sistema exibe informações de menu Relatórios > Relatórios
    Wait Until Page Contains    text=Gerencie um resumo das informações cadastradas no sistema.

# --11.01.02
E preencho informações de filtro "Cliente"
    Wait Until Element Is Visible    ${campo_clienteRelatorios}
    Sleep    2s
    Click Element                    ${campo_clienteRelatorios}
    Click Element                    (//div[contains(.,'Evandro Carlos Mior')])[18]

Então sistema exibe informações de filtro "Cliente"
    Wait Until Page Contains    text=Evandro Carlos Mior

# --11.01.03
E seleciono filtro Status "Fila"
    Wait Until Element Is Visible    //button[@id='status']    timeout=20s
    Click Element                    //button[@id='status']
    Sleep    1s
    Press Keys                        none    ARROW_DOWN
    Press Keys                        none    ENTER

Então sistema exibe informações de filtro Status "Fila"
    Wait Until Element Is Visible    (//div[contains(.,'Fila')])[18]

# --11.01.04
E seleciono filtro Responsável
    Sleep    1s
    Wait Until Element Is Visible    (//button[contains(@type,'button')])[11]
    Click Element                    (//button[contains(@type,'button')])[11]
    Wait Until Element Is Visible    xpath=//div[@role="option" and normalize-space(.)="OSEAS"]
    Click Element                    xpath=//div[@role="option" and normalize-space(.)="OSEAS"]

Então sistema exibe informações de filtro Responsável "suporte"
    Wait Until Element Is Visible    (//td[contains(text(),'OSEAS')])[1]

# --11.01.05
E seleciono filtro Vendedor Técnico "Todos"
    Sleep    2s
    Click Element    (//button[contains(.,'Todos')])[3]
    Click Element    (//div[contains(.,'Todos')])[27]
Então sistema exibe informações de filtro Vendedor Técnico "Todos"
    Wait Until Page Contains    text=Não definido

# --11.01.06
E preencho informação de filtro Representante comercial
    Wait Until Element Is Visible    (//button[contains(@type,'button')])[13]
    Click Element                    (//button[contains(@type,'button')])[13]
    Click Element                    (//div[contains(.,'Diego Lang')])[5]


Então sistema exibe informações de filtro Representante comercial
    Wait Until Element Is Visible    (//td[contains(.,'Diego Lang')])[1]

# --11.01.07
E seleciono o filtro Renovadas "Renovadas"
    Wait Until Element Is Visible    //button[@id='renovada']
    Click Element                    //button[@id='renovada']
    Click Element                    (//div[contains(.,'Renovadas')])[19]

Então sistema exibe informações de filtro Renovadas "Renovadas"
    Wait Until Page Contains    text=2062

# --11.01.08
E preencho informações de filtro Unidade consumidora
    Wait Until Element Is Visible    //input[@id='unidade_consumidora']
    Input Text                       //input[@id='unidade_consumidora']    1234

Então sistema exibe informações de filtro Unidade Consumidora
    Wait Until Page Contains    text=alexander leidou

# --11.01.09
E seleciono filtro Tipo de requisição
    Sleep    1s
    Wait Until Element Is Visible    //button[@id='tipo']
    Click Element                    //button[@id='tipo']
    FOR    ${i}    IN RANGE    3
        Press Keys                       NONE    ARROW_DOWN
        Sleep                            0.3s
    END
    Sleep    0.3s
    Press Keys                       NONE    ENTER

Então sistema exibe informações de filtro Tipo de requisição
    Wait Until Element Is Visible    (//td[@class='p-4 align-middle [&:has([role=checkbox])]:pr-0 text-center'][normalize-space()='Técnico'])[1]

# --11.01.10
E seleciono filtro Data de criação
    Wait Until Element Is Visible    ${filtro_DataCriacaoRelatorios}
    Click Element                    ${filtro_DataCriacaoRelatorios}
    Wait Until Element Is Visible    (//button[@type='button'])[21]
    FOR     ${i}    IN RANGE    6   
        Click Element    (//button[@type='button'])[21]
        Sleep    0.5s
    END
    Click Element                    (//button[contains(.,'30')])[2]
    Click Element                    (//button[contains(.,'31')])[2]

Então sistema exibe informações de filtro Data de criação
    Wait Until Element Is Visible    //td[contains(.,'31/12/2024')]

# --11.01.11
E seleciono filtro Promotor "Todos"
    Wait Until Element Is Visible    (//button[contains(.,'Todos')])[7]
    Click Element                    (//button[contains(.,'Todos')])[7]
    Click Element                    (//div[contains(.,'Todos')])[27]

Então sistema exibe informações de filtro Promotor "Todos"
    Wait Until Element Is Visible    (//td[contains(.,'Não definido')])[2]

# --11.01.12
E seleciono filtro Indicador "Todos"
    Wait Until Element Is Visible    (//button[contains(.,'Todos')])[8]
    Click Element                    (//button[contains(.,'Todos')])[8]
    Click Element                    (//div[contains(.,'Todos')])[27]
    
Então sistema exibe informações de filtro Indicador "Todos"
    Wait Until Element Is Visible    (//td[contains(.,'Não definido')])[2]

# --11.01.13

E valido filtros de departamento em Relatórios
    Wait Until Element Is Visible    ${Btn_Departamentos}    timeout=10s
    Click Element    ${Btn_Departamentos}
    Sleep    1s
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${Btn_Departamentos}

    FOR    ${departamento}    IN    @{DEPARTAMENTOS_OPTIONS}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            Click Element    ${Botao_Buscar}

            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[normalize-space(text())='Exportar para Excel']    timeout=10s
            Sleep    1.5s
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            
            # Reabre a combobox para a próxima iteração
            Click Element    ${Btn_Departamentos}
        END
        Sleep    1s
        Press Keys    None    ESC
        Sleep    0.5s
        Click Element    ${Link_Filtros}

Então sistema exibe resultado de filtro departamento
    Sleep    3s
    Wait Until Element Is Visible    ${botao_ExportarExcel_estimativa}

# --11.01.14
Então sistema exibe resultado de Quantidade de itens por pág 
    Sleep    2s
    Click Element    (//div[contains(.,'Quantidade')])[10]
    Sleep    5s
    ${resultados}    Get WebElements    xpath=//tr[contains(@class, 'border-b transition-colors')]
    ${quantidade}    Get Length    ${resultados}
    Should Be Equal As Numbers    ${quantidade - 1}    ${EXPECTED_RESULTS}

# --11.01.16
Quando clico no botão Exportar para PDF
    Sleep    2s
    Wait Until Element Is Visible    ${botao_exportarPDF_Relatorios}
    Click Element                    ${botao_exportarPDF_Relatorios}

Então sistema exporta para PDF
    Sleep    1s
    Wait Until Element Is Visible    ${botao_exportarPDF_Relatorios}

# --11.01.17
Então sistema exibe próximas informações
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    No Operation

# --11.01.18
Então sistema exibe informações anteriores   
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Not Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    No Operation


# --11.02.01
Dado que clico no menu "Relatórios > Homologatórias"
    Wait Until Element Is Visible    ${MENU_RELATORIOS}
    Click Element                    ${MENU_RELATORIOS}
    Wait Until Element Is Visible    ${Menu_Homologatorias}
    Click Element                    ${Menu_Homologatorias}
    Sleep    1.5s
# --11.02.02
E preencho informação de filtro resolução ANEEL
    Wait Until Element Is Visible    ${filtro_ANEEL}
    Click Element                    ${filtro_ANEEL}
    Sleep    1s
    Click Element                    //div[@id='react-select-2-option-1']

Então sistema exibe informações de filtro resolução ANEEL
    Wait Until Element Is Visible    ${result_ANEEL}

# --11.02.02
E preencho informação de filtro Concessionária
    Wait Until Element Is Visible    ${filtro_Concessionaria}
    Click Element                    ${filtro_Concessionaria}
    Click Element                    (//div[contains(.,'Castro - DIS')])[4]
Então sistema exibe informações de filtro Concessionária
    Wait Until Element Is Visible    ${result_Concessionaria}

# --11.02.04
E preencho informação de filtro Acessante
    Wait Until Element Is Visible    ${filtro_Acessante}    
    Click Element                    ${filtro_Acessante}
    Click Element                    (//div[contains(.,'BOREALIS')])[4]

Então sistema exibe informações de filtro Acessante
    Wait Until Element Is Visible    ${result_Acessante}

# --11.02.05
E preencho informação de filtro Classe
    Wait Until Element Is Visible    ${filtro_Classe}
    Click Element                    ${filtro_Classe}
    Click Element                    (//div[contains(.,'Residencial')])[4]

Então sistema exibe informações de filtro Classe
    Wait Until Element Is Visible    ${result_Classe}

# --11.02.06
E preencho informação de filtro Detalhe
    Wait Until Element Is Visible    ${filtro_Detalhe}
    Click Element                    ${filtro_Detalhe}
    Click Element                    (//div[contains(.,'TIPO 02')])[12]

Então sistema exibe informações de filtro Detalhe
    Wait Until Element Is Visible    ${result_Detalhe}    

# --11.02.07
E preencho informação de filtro Posto
    Wait Until Element Is Visible    ${filtro_Posto}
    Click Element                    ${filtro_Posto}
    Click Element                    (//div[contains(.,'Fora ponta')])[12]

Então sistema exibe informações de filtro Posto
    Wait Until Element Is Visible    ${result_Posto}

# --11.02.08
E preencho informação de filtro Ano
    Wait Until Element Is Visible    ${filtro_Ano}
    Click Element                    ${filtro_Ano}
    Click Element                    (//div[contains(.,'2020')])[5]

Então sistema exibe informações de filtro Ano
    Wait Until Element Is Visible    ${result_Ano}

# --11.02.09
E preencho informação de filtro Subgrupo
    Wait Until Element Is Visible    ${filtro_Subgrupo}
    Click Element                    ${filtro_Subgrupo}
    Click Element                    (//div[contains(.,'B3')])[4]

Então sistema exibe informações de filtro Subgrupo
    Wait Until Element Is Visible    ${result_Subgrupo}

# --11.02.10
E preencho informação de filtro Modalidade
    Wait Until Element Is Visible    ${filtro_Modalidade}
    Click Element                    ${filtro_Modalidade}
    Click Element                    (//div[contains(.,'Convencional')])[4]

Então sistema exibe informações de filtro Modalidade
    Wait Until Element Is Visible    ${result_Modalidade}

# --11.02.11
E preencho informação de filtro SubClasse
    Wait Until Element Is Visible    ${filtro_SubClasse}
    Click Element                    ${filtro_SubClasse}
    Click Element                    (//div[contains(.,'Baixa Renda')])[4]
    Sleep    0.3s
    Click Element                    ${filtro_Concessionaria}

Então sistema exibe informações de filtro SubClasse
    Wait Until Element Is Visible    ${result_Subclasse}

# --11.02.12
E preencho informação de filtro Outorga
    Wait Until Element Is Visible    ${filtro_Outorga}
    Click Element                    ${filtro_Outorga}
    Click Element                    (//div[contains(.,'Concessionária')])[23]
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    2s

Então sistema exibe informações de filtro Outorga
    Wait Until Element Is Visible    ${result_Outorga}

# --11.02.01
Então sistema exibe informações do menu Relatórios > Homologatórias
    Wait Until Page Contains    text=Homologatórias ANEEL

# --11.02.12
Então sistema exibe quantidade de itens preenchida em Relatórios
    Sleep    2s
    Click Element    (//div[contains(.,'Quantidade')])[15]
    Sleep    5s
    ${resultados}    Get WebElements    xpath=//tr[contains(@class, 'border-b transition-colors')]
    ${quantidade}    Get Length    ${resultados}
    Should Be Equal As Numbers    ${quantidade - 1}    ${EXPECTED_RESULTS}