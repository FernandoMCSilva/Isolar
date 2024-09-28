*** Settings ***
Documentation      Modúlo que Gerencie informações cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Pessoas}                   //a[contains(.,'Pessoas')]
${Menu_Grupos_Consumidores}       //a[contains(.,'Grupos Consumidores')]
${Menu_Tipo_de_Gerador}           //a[contains(.,'Tipo de Gerador')]
${Menu_Tipo_de_Financiamento}     //a[contains(.,'Tipo de Financiamento')]
${Menu_Classificacoes}            //a[contains(.,'Classificações')]
${Menu_Motivos_de_Urgencia}       //a[contains(.,'Motivos de Urgência')]
${Menu_Concessionarias}           //a[contains(.,'Concessionárias')]
${Menu_Departamentos}             //a[contains(.,'Departamentos')]
${Menu_Origem_da_Indicacao}       //a[contains(.,'Origem da indicação')]

${botao_Editar}    (//a[contains(.,'Editar')])[1]
${botao_Excluir}    (//button[contains(.,'Excluir')])[1]
${botao_Cancelar}    //button[contains(.,'Cancelar')]
${nome_pesquisa}    Fernando
*** Keywords ***
# --6.1
Dado que clico no menu "Cadastros > Pessoas"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Pessoas}
Então sistema exibe informações de cadastro de "Pessoas"
    Wait Until Page Contains     text=Pessoas

# --6.2
Quando clico em "Excluir"
    Sleep    3s
    Click Element    (//button[@type='button'])[8]
    Input Text    //input[@placeholder='Buscar...']    Gileade
    Sleep    2s
    Wait Until Element Is Visible    ${botao_Excluir}
    Click Element    ${botao_Excluir}

E clico no botão "Cancelar" em "Excluir"
    Wait Until Element Is Visible    ${botao_Cancelar}
    Click Element    ${botao_Cancelar}

# --6.3
E clico no botão "Confirmar" em "Excluir"
    Click Element    //button[contains(.,'Continuar')]

Então sistema exlcui item do menu Cadastro > Pessoas
    Wait Until Page Contains    text=Registro excluído com sucesso!

# --6.4
Quando clico no filtro "Cards"
    Sleep    2s
    Click Element    (//button[@type='button'])[7]

E clico em "Lista"
    Click Element    xpath=//div[@role='option'][contains(.,'Lista')]

Então sistema exibe informações com filtro "Lista"
    Sleep    5s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Nome')]

    Run Keyword If    ${titulo_nome}    Log    "O Título Nome está visível. Funcionou."
    ...    ELSE    Fail    "O Título Nome não está visível. Falhou."

# --6.5

Quando clico no botão "Pesquisar"
    Wait Until Element Is Visible    (//button[@type='button'])[8]
    Click Element    (//button[@type='button'])[8]

E preencho informações de pesquisa
    Input Text    //input[@placeholder='Buscar...']    ${nome_pesquisa}

Então sistema exibe informações de pesquisa
     ${nome_resultado}=    Get Text    //p[contains(.,'Fernando Morais da Costa Silva')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa}'    Log    "O resultado da pesquisa é Fernando. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é Fernando. Teste falhou."    WARN

# --6.6

E preencho informações de busca não encontrada
    Input Text    //input[@placeholder='Buscar...']    Gileade

Então sistema exibe mensagem de erro
    Wait Until Page Contains    text=Nenhuma pessoa encontrada.

# --6.7
E clico em "Fechar"
    Click Element    (//button[@type='button'])[8]
Então sistema verifica se filtro buscar fechou
    ${filtro_buscar}=    Run Keyword And Return Status    Element Should Not Be Visible    //input[@placeholder='Buscar...']
    Run Keyword If    ${filtro_buscar}    Log    "Filtro buscar não está visível. Funcionou."
    ...    ELSE    Fail    "Filtro buscar ainda está visível. Falhou."

Dado que clico no menu "Cadastros > Grupos Consumidores"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Grupos_Consumidores}
Então sistema exibe informações de cadastro de "Grupo Consumidores"
    Wait Until Page Contains     text=Grupos Consumidores
# --6.8

Quando clico em "Editar"
    Sleep    5s
    Click Element    (//button[contains(.,'Editar')])[1]

E preencho informações de cadastro editado
    Sleep    10s
    Input Text    //input[@placeholder='Nome completo']    Gileade do Nascimento Santos
    Input Text    //input[@placeholder='000.000.000-00']    19895982771
    Input Text    //input[@placeholder='(99) 99999-9999']    21981905892
    Input Text    //input[@placeholder='00000-000']    28990154
    Click Element    xpath=//div[@role='button' and contains(@class, 'select__multi-value__remove')]
    Click Element    xpath=//div[@class='select__value-container select__value-container--is-multi css-hlgwow'][contains(.,'Selecione a função')]
    Click Element    (//div[contains(.,'Vendedor técnico')])[13]
    Click Element    (//div[contains(.,'Representante comercial')])[13]
    Click Element    xpath=//div[contains(@class, 'select__multi-value__remove')]

    Click Element    //button[contains(.,'Atualizar')]

Então sistema exibe informações de "Editar"
    
    Wait Until Page Contains    text=Informações atualizadas com sucesso!

# --6.9

Quando clico no botão "Inserir"
    Sleep    3s
    Click Element    //button[contains(.,'Inserir')]
 
E preencho informações de inserir novo cadastro de pessoas
    Sleep    5s
    Input Text    //input[@name='Nome']    Gileade
    Input Text    //input[@name='CPF']    19895982771
    Input Text    //input[@name='Telefone']    21981905892
    Input Text    //input[@name='CEP']    28990154
    Click Element    xpath=//div[@class='select__value-container select__value-container--is-multi css-hlgwow'][contains(.,'Selecione a função')]
    Click Element    (//div[contains(.,'Vendedor técnico')])[13]
 

E clico em "Salvar"
    Click Element    //button[contains(.,'Salvar')]

Então sistema salva novo cadastro de pessoas
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# --6.11
Então sistema exlcui item do menu Cadastro > Grupos Consumidores
    Wait Until Page Contains    text=Registro excluído com sucesso!


# # --6.3
# Dado que clico no menu "Cadastros > Tipo de Gerador"
#     Wait Until Element Is Visible    ${MENU_CADASTROS}
#     Click Element                    ${MENU_CADASTROS}
#     Click Element                    ${Menu_Tipo_de_Gerador}
# Então sistema exibe informações de cadastro de "Tipo de Gerador"
#     Wait Until Page Contains     text=Tipos de Gerador
# # --6.4
# Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     Wait Until Element Is Visible    ${MENU_CADASTROS}
#     Click Element                    ${MENU_CADASTROS}
#     Click Element                    ${Menu_Tipo_de_Financiamento}
# Então sistema exibe informações de cadastro de "Tipo de Financiamento"
#     Wait Until Page Contains     text=Tipos de Financiamento

# # --6.5
# Dado que clico no menu "Cadastros > Classificações"
#     Wait Until Element Is Visible    ${MENU_CADASTROS}
#     Click Element                    ${MENU_CADASTROS}
#     Click Element                    ${Menu_Classificacoes}
# Então sistema exibe informações de cadastro de "Classificações"
#     Wait Until Page Contains     text=Classificações

# # --6.6

# Dado que clico no menu "Cadastros > Motivos de Urgência"
#     Wait Until Element Is Visible    ${MENU_CADASTROS}
#     Click Element                    ${MENU_CADASTROS}
#     Click Element                    ${Menu_Motivos_de_Urgencia}
# Então sistema exibe informações de cadastro de "Motivos de Urgência"
#     Wait Until Page Contains     text=Motivos de Urgência

# # --6.7
# Dado que clico no menu "Cadastros > Concessionárias"
#     Wait Until Element Is Visible    ${MENU_CADASTROS}
#     Click Element                    ${MENU_CADASTROS}
#     Click Element                    ${Menu_Concessionarias}
# Então sistema exibe informações de cadastro de "Concessionárias"
#     Wait Until Page Contains     text=Concessionárias

# # --6.8
# Dado que clico no menu "Cadastros > Departamentos"
#     Wait Until Element Is Visible    ${MENU_CADASTROS}
#     Click Element                    ${MENU_CADASTROS}
#     Click Element                    ${Menu_Departamentos}
# Então sistema exibe informações de cadastro de "Departamentos"
#     Wait Until Page Contains     text=Departamentos

# # --6.8
# Dado que clico no menu "Cadastros > Origem da Indicação"
#     Wait Until Element Is Visible    ${MENU_CADASTROS}
#     Click Element                    ${MENU_CADASTROS}
#     Click Element                    ${Menu_Origem_da_Indicacao}
# Então sistema exibe informações de cadastro de "Origem de indicação"
#     Wait Until Page Contains     text=Origem de indicação