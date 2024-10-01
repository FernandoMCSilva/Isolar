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

${botao_buscar_CadastrosPessoas}      //button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10')]
${botao_Editar}                       (//a[contains(.,'Editar')])[1]
${botao_Excluir}                      //button[contains(.,'Excluir')]
${botao_continuar_Excluir}            //button[contains(.,'Continuar')]
${botao_Cancelar}                     //button[contains(.,'Cancelar')]
${input_buscar_CadastrosPessoas}      //input[@placeholder='Buscar...']
${filtro_cards/Lista}                 (//button[@type='button'])[7]
${filtro_botaoLista}                  xpath=//div[@role='option'][contains(.,'Lista')]
${botao_atualizar_CadastrosPessoas}   //button[contains(.,'Atualizar')]
${botao_salvar_CadastrosPessoas}      //button[contains(.,'Salvar')]

${nome_pesquisa_pessoas}                  Fernando
${nome_pesquisa_GruposConsumidores}       B3
${input_buscar_GruposConsumidores}        xpath=//input[contains(@class, 'flex h-10')]
${input_descricao_GruposConsumidores}    //input[@id='descricao']
*** Keywords ***
# --6.01.01
Dado que clico no menu "Cadastros > Pessoas"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Pessoas}
Então sistema exibe informações de cadastro de "Pessoas"
    Wait Until Page Contains     text=Pessoas

# --6.01.02
Quando clico no botão "Inserir"
    Sleep    3s
    Click Element    //button[contains(.,'Inserir')]

# --6.01.03
Quando clico em "Excluir"
    Sleep    2s
    Wait Until Element Is Visible    ${botao_Excluir}
    Click Element                    ${botao_Excluir}

E clico no botão "Cancelar" em "Excluir"
    Wait Until Element Is Visible    ${botao_Cancelar}
    Click Element                    ${botao_Cancelar}

# --6.01.04
E clico no botao buscar
    Sleep    2s
    Click Element     ${botao_buscar_CadastrosPessoas}
    Input Text        ${input_buscar_CadastrosPessoas}    Gileade
E clico no botão "Continuar" em "Excluir"
    Click Element    ${botao_continuar_Excluir}

Então sistema exlcui item do menu Cadastro > Pessoas
    Wait Until Page Contains    text=Registro excluído com sucesso!

# --6.01.05
Quando clico no filtro "Cards"
    Sleep    2s
    Click Element    ${filtro_cards/Lista}

E clico em "Lista"
    Click Element    ${filtro_botaoLista}

Então sistema exibe informações com filtro "Lista"
    Sleep    5s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Nome')]
    Run Keyword If    ${titulo_nome}    Log    "O Título Nome está visível. Funcionou."
    ...    ELSE    Fail    "O Título Nome não está visível. Falhou."

# --6.01.06

Quando clico no botão "Buscar"
    Wait Until Element Is Visible    ${botao_buscar_CadastrosPessoas}
    Click Element                    ${botao_buscar_CadastrosPessoas}

E preencho informações de pesquisa
    Input Text    //input[@placeholder='Buscar...']    ${nome_pesquisa_GruposConsumidores}

Então sistema exibe informações de pesquisa
     ${nome_resultado}=    Get Text    //p[contains(.,'Fernando Morais da Costa Silva')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_pessoas}'    Log    "O resultado da pesquisa é Fernando. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é Fernando. Teste falhou."    WARN

# --6.01.07

E preencho informações de busca não encontrada
    Input Text    ${input_buscar_CadastrosPessoas}    Gileade

Então sistema exibe mensagem de erro
    Wait Until Page Contains    text=Nenhuma pessoa encontrada.

# --6.01.08
E clico em "Fechar"
    Click Element    ${botao_buscar_CadastrosPessoas}
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

# --6.01.09

Quando clico em "Editar"
    Sleep    5s
    Click Element    ${botao_Editar}

E preencho informações de cadastro editado
    Sleep    5s
    Input Text        //input[@placeholder='Nome completo']    Gileade do Nascimento Santos
    Input Text        //input[@placeholder='000.000.000-00']    19895982771
    Input Text        //input[@placeholder='(99) 99999-9999']    21981905892
    Input Text        //input[@placeholder='00000-000']    289901541
    Click Element     xpath=//div[@role='button' and contains(@class, 'select__multi-value__remove')]
    Click Element     xpath=//div[@class='select__input-container css-o3kr9i']
    Click Element     (//div[contains(.,'Vendedor técnico')])[13]
    Click Element     (//div[contains(.,'Representante comercial')])[13]
    Click Element     xpath=//div[contains(@class, 'select__multi-value__remove')]
    Click Element     ${botao_atualizar_CadastrosPessoas}

Então sistema exibe informações de "Editar"
    
    Wait Until Page Contains    text=Informações atualizadas com sucesso!

# --6.01.09

E preencho informações de inserir novo cadastro de pessoas
    Sleep    5s
    Input Text       //input[@name='Nome']    Gileade
    Input Text       //input[@name='CPF']    19895982771
    Input Text       //input[@name='Telefone']    21981905892
    Input Text       //input[@name='CEP']    28990154
    Click Element    xpath=//div[@class='select__value-container select__value-container--is-multi css-hlgwow'][contains(.,'Selecione a função')]
    Click Element    (//div[contains(.,'Vendedor técnico')])[13]
 

E clico em "Salvar"
    Click Element    ${botao_salvar_CadastrosPessoas}

Então sistema salva novo cadastro de pessoas
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# --6.02.01

E preencho informações de inserir novo cadastro de Grupos Consumidores
    Sleep    2s
    Input Text    ${input_descricao_GruposConsumidores}    B3 (Gileade)
    Click Element    (//button[@type='button'])[7]
    Click Element    (//div[@tabindex='-1'])[3]

Então sistema exlcui item do menu Cadastro > Grupos Consumidores
    Wait Until Page Contains    text=Registro excluído com sucesso!


# --6.02.02

E preencho informações de busca não escontrada em Grupos Consumidores
    Input Text    ${input_buscar_GruposConsumidores}    ${nome_pesquisa_pessoas}

Então sistema exibe mensagem de erro em Grupos Consumidores
    Wait Until Page Contains    text=Nenhum grupo consumidor encontrado.


# --6.02.04

Então sistema exibe informações de pesquisa de Grupos Consumidores
    ${nome_resultado}=    Get Text    //p[contains(.,'B3 (COMERCIAL)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_GruposConsumidores}'    Log    "O resultado da pesquisa é B3. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é B3. Teste falhou."    WARN

# --6.03.01
Dado que clico no menu "Cadastros > Tipo de Gerador"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Tipo_de_Gerador}
Então sistema exibe informações de cadastro de "Tipo de Gerador"
    Wait Until Page Contains     text=Tipos de Gerador


# --6.03.02

E preencho informações de inserir novo cadastro de Tipo de Gerador
    Sleep    2s
    Input Text    ${input_descricao_GruposConsumidores}    B3 (Gileade)
    



# --6.4
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