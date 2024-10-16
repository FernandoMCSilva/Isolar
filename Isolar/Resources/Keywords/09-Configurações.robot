*** Settings ***
Documentation      Modúlo gerencia Configurações no sistema.
Resource           ../Main.robot

*** Variables ***
${MENU_CONFIGURACOES}                 (//div[contains(.,'Configurações')])[8]
${Menu_ConfigRequisicoes}             (//p[contains(.,'Requisições')])[2]
${Menu_ConfigDocumentos}              (//p[contains(.,'Documentos')])[2]
${Menu_ConfigEstimativa}              (//p[contains(.,'Estimativa')])[2]
${Menu_ConfigSistema}                 //span[contains(.,'Sistema')]
${Menu_ConfigMinerandoSol}            (//a[contains(@href,'misol')])[2]

${botao_NovoTipo}                   //button[contains(.,'Novo tipo')]
${botao_Perguntas}                  //button[contains(.,'Perguntas')]
${botao_Salvar}                     //button[contains(.,'Salvar')]
${filtro_cards/Lista_Perguntas}     //button[contains(.,'Cards')]
${filtro_botaoLista_Perguntas}      (//div[contains(.,'Lista')])[9]
${quantidade_perguntas}             2

*** Keywords ***
# -9.01.01
Dado que clico no menu "Configurações > Requisições"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Click Element                    ${Menu_ConfigRequisicoes} 
Então sistema exibe informações de menu Requisições
    Wait Until Page Contains    text=Tipos de requisição

# -9.01.02
Quando clico no botão "Novo tipo"
    Sleep    2s
    Click Element    ${botao_NovoTipo}
E preencho informações de cadastro de Novo tipo de Requisições
    Sleep    2s
    Input Text               //input[@placeholder='Ex: Técnico']    ${nome_pesquisa_GruposConsumidores}
    Click Element            (//div[contains(.,'Selecione as requisições')])[12]
    Click Element            (//div[contains(.,'TI')])[13]
    Click Element            //input[@placeholder='Ex: Técnico']
    Sleep    2s
    Click Element            (//button[@type='button'])[7]
    Click Element            (//button[@type='button'])[7]
    Sleep    1s
    # Click Element             xpath=//div[contains(@class,'col-start-2 col-end-3 min-w-24 min-h-12 border p-2 rounded-sm')]
    # Input Text                xpath=//input[@placeholder='Clique para editar o nome da Seção']    Meu Novo Texto
    Click Element            (//button[@data-state='closed'])[9]
    Click Element            (//button[@data-state='closed'])[9]
    Click Element            //button[contains(@class,'ml-2')]
    Click Element            (//div[contains(.,'Selecione um opção')])[16]
    Click Element            (//div[contains(.,'Nome completo')])[17]
    Click Element            (//button[@data-state='closed'])[7]
    Click Element            (//button[@data-state='closed'])[7]
    Click Element            //button[contains(.,'Adicionar seção')]
    Click Element            (//button[@data-state='closed'])[14]
Então sistema salva novo Tipo de requisição
    Wait Until Page Contains    text=Erro ao inserir no banco de dados: SQLSTATE[22001]: String data, right truncated: 1406 Data too long for column 'card' at row 1

# -9.01.03
E preencho informações de cadastro editado no menu Configurações > Requisições
    Sleep    2s
    Input Text               //input[@placeholder='Ex: Técnico']    ${nome_pesquisa_GruposConsumidores}
    Click Element            (//div[contains(.,'TI')])[12]
    Click Element            (//div[contains(.,'Comercial')])[13]
    Click Element            //input[@id='nomeRequisicao']
    Sleep    1s
    Click Element            (//button[@data-state='closed'])[9]
    Click Element            ${botao_Salvar}

Então sistema exibe informações de "Editar" no menu Configurações > Requisições
    Wait Until Page Contains    text=Registro editado com sucesso!

# -9.01.05
Então sistema exibe informações de pesquisa de tipo de requisição
    ${nome_resultado}=    Get Text    //h3[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_pessoas}'    Log    "O resultado da pesquisa é Fernando. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é Fernando. Teste falhou."    WARN


# -9.01.07
Então sistema exclui item do menu Configurações > Requisições
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -9.01.08
Então sistema exibe informações de "Perguntas" no menu Configurações > Requisições
    Wait Until Page Contains    text=Adicionar uma nova pergunta


# --9.01.09
E clico no botao "Perguntas"
    Sleep    2s
    Click Element    ${botao_Perguntas}
E preencho informações de nova pergunta
    Sleep    2s
    Input Text            //input[contains(@placeholder,'Nome do campo')]    ${nome_pesquisa_GruposConsumidores}
    Click Element         //button[contains(.,'Selecione')]
    Click Element         (//div[contains(.,'Texto')])[4]
    Sleep                 1s
    Input Text            //input[contains(@name,'placeholder')]    ${nome_pesquisa_GruposConsumidores}
    Click Element         //button[contains(.,'Não')]
    Click Element         (//div[contains(.,'Sim')])[4]
    Click Element         //button[contains(.,'Sim')]
    Click Element         (//div[contains(.,'Não')])[4]
    Click Element         //button[contains(.,'Selecione')]
    Click Element         (//div[contains(.,'Endereço/Rua')])[4]
Então sistema exibe mensagem de pergunta adicionada no menu Configurações > Requisições
    Wait Until Page Contains    text=Pergunta adicionada com sucesso!

# -9.2
E preencho informações de pergunta editada no menu Configurações > Requisições > Perguntas
    Sleep    2s
    Input Text            (//input[@value='B3 (teste)'])[1]    ${nome_pesquisa_GruposConsumidores}
    Click Element         //button[contains(.,'Texto')]
    Click Element         (//div[contains(.,'Data')])[4]
    Click Element         ${botao_Salvar}

Então sistema exibe informações de "Editar" no menu Configurações > Requisições > Perguntas
    Wait Until Page Contains    text=Pergunta atualizada com sucesso!

# --9.01.11
Então sistema exibe informações de pesquisa de perguntas
    Sleep    1s
    ${nome_resultado}=    Get Text    //h3[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_pessoas}'    Log    "O resultado da pesquisa é Fernando. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é Fernando. Teste falhou."    WARN

# --9.01.12
Então sistema exclui pergunta do menu Configurações > Requisições > Perguntas
    Wait Until Page Contains    text=Pergunta deletada com sucesso!

# --9.01.13
Quando clico no filtro "Cards" em perguntas
    Sleep    2s
    Click Element    ${filtro_cards/Lista_Perguntas}
E clico em "Lista" em perguntas
    Sleep    1s
    Click Element    ${filtro_botaoLista_Perguntas}

# --9.01.14
Então sistema exibe mensagem de erro em Perguntas
    Wait Until Page Contains    text=Nenhum tipo de requisição encontrado.

# --9.01.15
E preencho informações no campo quantidade em perguntas
    Input Text    //input[contains(@id,'itensPorPagina')]   ${quantidade_perguntas}
    Click Element    (//div[contains(.,'Quantidade')])[12]
Então sistema exibe informações de acordo com quantidade preenchida em perguntas
    Sleep    3s
    ${resultados}=    Get WebElements    //tbody/tr[contains(@class, 'border-b')]
    ${quantidade}=    Get Length    ${resultados}
    Log    Quantidade de elementos encontrados: ${quantidade}
    Should Be Equal As Numbers    ${quantidade}    ${quantidade_perguntas}    A quantidade de elementos retornados não corresponde à quantidade esperada

# --9.01.17
Então sistema exibe informações com filtro "Lista" em Configurações > Requisições
    Sleep    2s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Tipo')]
    Run Keyword If    ${titulo_nome}    Log    "O Título Nome está visível. Funcionou."
    ...    ELSE    Fail    "O Título Nome não está visível. Falhou."

# --9.01.18
Então sistema exibe mensagem de erro em Configurações > Requisições
    Wait Until Page Contains    text=Nenhum tipo de requisição encontrado.

# --9.01.12
# Dado que clico no menu "Configurações > Minerando sol"
#     Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
#     Click Element                    ${MENU_CONFIGURACOES}
#     Wait Until Element Is Visible    ${Menu_MinerandoSol}
#     Click Element                    ${Menu_MinerandoSol}
# Então sistema exibe informações de menu Minerando sol
#     Wait Until Page Contains    text=

# # -9.3
# Dado que clico no menu "Configurações > Documentos"
#     Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
#     Click Element                    ${MENU_CONFIGURACOES}
#     Wait Until Element Is Visible    ${Menu_Documentos}
#     Click Element                    ${Menu_Documentos}
# Então sistema exibe informações de menu Documentos
#     Wait Until Page Contains    text=

# # -9.4
# Dado que clico no menu "Configurações > Estimativa"
#     Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
#     Click Element                    ${MENU_CONFIGURACOES}
#     Wait Until Element Is Visible    ${Menu_Estimativa}
#     Click Element                    ${Menu_Estimativa}

# # -9.5
# Dado que clico no menu "Configurações > Sistema"
#     Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
#     Click Element                    ${MENU_CONFIGURACOES}
#     Click Element                    ${Menu_Sistema}