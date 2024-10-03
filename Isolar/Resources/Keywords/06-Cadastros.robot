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

${nome_pesquisa_GruposConsumidores}             B3 (teste)
${nome_pesquisa_pessoas}                        Fernando
${nome_BuscaNaoEncontrada}                      1234
${botao_buscar_CadastrosPessoas}                //button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10')]
${botao_Editar}                                 (//a[contains(.,'Editar')])[1]
${botao_Excluir_CadastrosPessoas}               //button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-destructive text-destructive-foreground hover:bg-destructive/90 h-10 px-4 py-2')]
${botao_continuar_Excluir}                      //button[contains(.,'Continuar')]
${botao_Cancelar}                               //button[contains(.,'Cancelar')]
${botao_salvar_CadastrosPessoas}                //button[contains(.,'Salvar')]
${botao_Excluir_CadastrosGruposConsumidores}    //button[contains(.,'Excluir')]
${botao_atualizar_CadastrosPessoas}             //button[contains(.,'Atualizar')]
${input_buscar_CadastrosPessoas}                //input[contains(@placeholder,'Buscar...')]
${input_descricao_GruposConsumidores}           //input[@id='descricao']
${input_buscar_GruposConsumidores}              xpath=//input[contains(@class, 'flex h-10')]
${filtro_cards/Lista}                           (//button[@type='button'])[7]
${filtro_botaoLista}                            xpath=//div[@role='option'][contains(.,'Lista')]

*** Keywords ***
# --6.01.01
Dado que clico no menu "Cadastros > Pessoas"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Sleep    2s
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
    Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}
    Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}

E clico no botão "Cancelar" em "Excluir"
    Sleep    2s
    Click Element                    ${botao_Cancelar}

# --6.01.04
E clico no botao buscar
    Sleep    2s
    Click Element     ${botao_buscar_CadastrosPessoas}

E clico no botão "Continuar" em "Excluir"
    Click Element    ${botao_continuar_Excluir}

Então sistema exclui item do menu Cadastro > Pessoas
    Wait Until Page Contains    text=Registro excluído com sucesso!

# --6.01.05
Quando clico no filtro "Cards"
    Sleep    2s
    Click Element    ${filtro_cards/Lista}

E clico em "Lista"
    Click Element    ${filtro_botaoLista}

Então sistema exibe informações com filtro "Lista"
    Sleep    2s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Nome')]
    Run Keyword If    ${titulo_nome}    Log    "O Título Nome está visível. Funcionou."
    ...    ELSE    Fail    "O Título Nome não está visível. Falhou."

# --6.01.06

E preencho informações de pesquisa
    Input Text    //input[@placeholder='Buscar...']    ${nome_pesquisa_GruposConsumidores}

Então sistema exibe informações de pesquisa
     ${nome_resultado}=    Get Text    //p[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_pessoas}'    Log    "O resultado da pesquisa é Fernando. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é Fernando. Teste falhou."    WARN

# --6.01.07

E preencho informações de busca não encontrada
    Input Text    ${input_buscar_CadastrosPessoas}    ${nome_BuscaNaoEncontrada}

Então sistema exibe mensagem de erro
    Wait Until Page Contains    text=Nenhuma pessoa encontrada.

# --6.01.08
E clico em "Fechar"
    Click Element    ${botao_buscar_CadastrosPessoas}
Então sistema verifica se filtro buscar fechou
    ${filtro_buscar}=    Run Keyword And Return Status    Element Should Not Be Visible    //input[@placeholder='Buscar...']
    Run Keyword If    ${filtro_buscar}    Log    "Filtro buscar não está visível. Funcionou."
    ...    ELSE    Fail    "Filtro buscar ainda está visível. Falhou."

Então sistema exibe informações de cadastro de "Grupo Consumidores"
    Wait Until Page Contains     text=Grupos Consumidores

# --6.01.09

Quando clico em "Editar"
    Sleep    2s
    Click Element    ${botao_Editar}

E preencho informações de cadastro editado
    Wait Until Page Contains    text=Editar Informações
    Input Text        //input[@placeholder='Nome completo']    ${nome_pesquisa_GruposConsumidores}
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
    Input Text       //input[@name='Nome']   ${nome_pesquisa_GruposConsumidores}
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
Dado que clico no menu "Cadastros > Grupos Consumidores"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Sleep    2s
    Click Element                    ${Menu_Grupos_Consumidores}

Então sistema exibe informações de cadastro de "Grupos Consumidores"
    Wait Until Page Contains    text=Grupos Consumidores


E preencho informações de inserir novo cadastro de Grupos Consumidores
    Sleep    2s
    Input Text       ${input_descricao_GruposConsumidores}    ${nome_pesquisa_GruposConsumidores}
    Click Element    (//button[@type='button'])[7]
    Click Element    (//div[@tabindex='-1'])[3]

Então sistema exclui item do menu Cadastro > Grupos Consumidores
    Wait Until Page Contains    text=Registro excluído com sucesso!


# --6.02.02

E preencho informações de busca não escontrada em Grupos Consumidores
    Input Text    ${input_buscar_GruposConsumidores}    ${nome_BuscaNaoEncontrada}

Então sistema exibe mensagem de erro em Grupos Consumidores
    Wait Until Page Contains    text=Nenhum grupo consumidor encontrado.


# --6.02.04

Então sistema exibe informações de pesquisa de Grupos Consumidores
    ${nome_resultado}=    Get Text    //p[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_GruposConsumidores}'    Log    "O resultado da pesquisa é B3. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é B3. Teste falhou."    WARN

# --6.03.01
Dado que clico no menu "Cadastros > Tipo de Gerador"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Sleep    2s
    Click Element                    ${Menu_Tipo_de_Gerador}
Então sistema exibe informações de cadastro de "Tipo de Gerador"
    Wait Until Page Contains     text=Tipos de Gerador
    
# --6.03.02

E preencho informações de inserir novo cadastro de Tipo de Gerador
    Sleep    2s
    Input Text    ${input_descricao_GruposConsumidores}    ${nome_pesquisa_GruposConsumidores}
    
# --6.03.03

E preencho informações de cadastro editado em Tipo de Gerador
    Sleep    2s
    Input Text    //input[@id='descricao']    ${nome_pesquisa_GruposConsumidores}
    Click Element    ${botao_atualizar_CadastrosPessoas}

# --6.03.04

Então sistema exclui item do menu Cadastro > Tipo de Gerador
    Wait Until Page Contains    text=Registro excluído com sucesso!

# --6.03.06
Então sistema exibe informações de pesquisa de Tipo de Gerador
    ${nome_resultado}=    Get Text    //p[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_GruposConsumidores}'    Log    "O resultado da pesquisa é B3. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é B3. Teste falhou."    WARN

# --6.03.07

Então sistema exibe mensagem de erro em Tipo de Gerador
    Wait Until Page Contains    text=Nenhum tipo de gerador encontrado.

# --6.04.01
Dado que clico no menu "Cadastros > Tipo de Financiamento"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Sleep    2s
    Click Element                    ${Menu_Tipo_de_Financiamento}
Então sistema exibe informações de cadastro de "Tipo de Financiamento"
    Wait Until Page Contains     text=Tipos de Financiamento

# --6.04.08

Então sistema exibe mensagem de erro de Tipo de Financiamento
    Wait Until Page Contains    text=Nenhum tipo de financiamento encontrado


# --6.05.01
Dado que clico no menu "Cadastros > Classificações"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Classificacoes}
Então sistema exibe informações de cadastro de "Classificações"
    Wait Until Page Contains     text=Classificações

# --6.05.08
Então sistema exibe mensagem de erro de Classificações
    Wait Until Page Contains    text=Nenhum classificação encontrada.


# --6.06.01

Dado que clico no menu "Cadastros > Motivos de Urgência"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Motivos_de_Urgencia}
Então sistema exibe informações de cadastro de "Motivos de Urgência"
    Wait Until Page Contains     text=Motivos de Urgência

# --6.06.02

E preencho informações de inserir novo cadastro de Motivos de Urgência
    Sleep    2s
    Input Text    //input[@id='descricao']    ${nome_pesquisa_GruposConsumidores}
    Click Element    //button[@id='nivel']
    Click Element    (//div[@role='option'])[2]

# --6.06.08

E preencho informações de busca não encontrada em Motivo de Urgência
    Input Text    //input[@type='text']    ${nome_BuscaNaoEncontrada}
Então sistema exibe mensagem de erro de Motivos de Urgência
    Wait Until Page Contains    text=Nenhum motivo de urgência encontrada.
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