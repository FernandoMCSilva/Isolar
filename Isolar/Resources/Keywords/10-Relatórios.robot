*** Settings ***
Documentation      Modúlo gerencia Relatórios no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Relatorios}                   (//span[contains(.,'Relatórios')])[2]
${Menu_Relatorios>Relatorios}        //a[contains(.,'Relatórios')]
${Menu_Homologatorias}               //p[contains(.,'Homologatórias')]
${nome_pesquisa_Relatórios}          Teste

${Campo_Cliente}                     //input[@id='cliente']

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
# E seleciono filtro Vendedor Técnico "Todos"
#     Click Element    (//button[contains(.,'Todos')])[3]
#     Click Element    (//div[contains(.,'Todos')])[28]
# Então sistema exibe informações de filtro Vendedor Técnico "Todos"
#     Wait Until Element Is Visible    (//td[contains(.,'Não definido')])[2]    timeout=10s
#     ${resultado}=    Get Text    (//td[contains(.,'Não definido')])[2]
#     Run Keyword If    '${resultado}' == 'Todos'    Log    Aprovado.
#     Run Keyword Unless    '${resultado}' == 'Todos'    Fail    Reprovado.

# # --10.01.06
# E seleciono filtro Representante comercial "Todos"

# Então sistema exibe informações de filtro Representante comercial "Todos"

# # --10.01.07
# E seleciono o filtro Renovadas "Renovadas"

# Então sistema exibe informações de filtro Renovadas "Renovadas"

# # --10.01.08
# E preencho informações de filtro Unidade consumidora

# Então sistema exibe informações de filtro Unidade Consumidora

# # --10.01.09
# E seleciono filtro Tipo de requisição "Estimativa"

# Então sistema exibe informações de filtro Tipo de requisição "Estimativa"

# # --10.01.10
# E seleciono filtro Data de criação

# Então sistema exibe informações de filtro Data de criação

# # --10.01.11
# E seleciono filtro Promotor "Todos"

# Então sistema exibe informações de filtro Promotor "Todos"

# # --10.01.12
# E seleciono filtro Indicador "Todos"

# Então sistema exibe informações de filtro Indicador "Todos"

# # --10.01.13
# E seleciono fitro Departamento "Comercial"

# Então sistema exibe informações de filtro Departamento "Comercial"

# # --10.01.14
# E clico em Quantidade de itens por pág

# E preencho informações de quantidade de itens

# Então sistema exibe informações de quantidade de itens por pág

# # --10.01.15
# Quando clico no botão Exportar para Excel

# Então sistema realiza download de arquivo para Excel

# # --10.01.16
# Quando clico no botão Exportar para PDF

# Então sistema realiza download de arquivo para PDF

# # --10.01.17
# Quando clico no botão Próximo

# Então sistema exibe informações de botão Próximo

# # --10.01.18
# Quando clico no botão Anterior

# Então sistema exibe informações de botão Anterior 



# --10.01.02
# --10.02.01
Dado que clico no menu "Relatórios > Homologatórias"
    Wait Until Element Is Visible    ${MENU_RELATORIOS}
    Click Element                    ${MENU_RELATORIOS}
    Wait Until Element Is Visible    ${Menu_Homologatorias}
    Click Element                    ${Menu_Homologatorias}
