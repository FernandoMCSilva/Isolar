*** Settings ***
Documentation      Modúlo gerencia Configurações no sistema.
Resource           ../Main.robot

*** Variables ***
${MENU_CONFIGURACOES}                 (//div[contains(.,'Configurações')])[8]
${MENU_DOCUMENTOS}                    //a[contains(.,'Documentos')]
${Menu_ConfigRequisicoes}             (//p[contains(.,'Requisições')])[2]
${Menu_ConfigDocumentos}              (//p[contains(.,'Documentos')])[2]
${Menu_ConfigEstimativa}              (//p[contains(.,'Estimativa')])[2]
${Menu_ConfigSistema}                 //span[contains(.,'Sistema')]
${Menu_ConfigMinerandoSol}            (//a[contains(@href,'misol')])[2]

${botao_NovoTipo}                   //button[contains(.,'Novo tipo')]
${botao_Perguntas}                  //button[contains(.,'Perguntas')]
${botao_Salvar}                     //button[contains(.,'Salvar')]
${botao_InserirPergunta}            (//button[@data-state='closed'])[9]
${botaox_ExcluirPergunta}           //button[contains(@class,'ml-2')]
${filtro_cards/Lista_Perguntas}     //button[contains(.,'Cards')]
${filtro_botaoLista_Perguntas}      (//div[contains(.,'Lista')])[9]
${quantidade_perguntas}             2
${input_NomeDaRequisicao}           //input[@placeholder='Ex: Técnico']
${input_NomeSecao}                  //div[contains(@class, 'col-start-2') and contains(@class, 'col-end-3') and contains(text(), 'Clique para editar o nome da Seção')]
${input_NomeSecaoSelecionado}       //div[contains(@class, 'col-start-2') and contains(@class, 'col-end-3') and contains(@class, 'min-w-24') and contains(@class, 'min-h-12') and contains(@class, 'border') and contains(@class, 'p-2') and contains(@class, 'rounded-sm')]
${box_Departamento}                 (//div[contains(.,'Selecione as requisições')])[12]
${box_DepartamentoTI}               (//div[contains(.,'TI')])[13]
${box_EscolhaPergunta}              (//div[contains(.,'Selecione um opção')])[16]
${box_EscolhaPerguntaNomeCompleto}  (//div[contains(.,'Nome completo')])[17]
${box_TipodoCampo}                  //button[contains(.,'Selecione')]
${box_TipodoCampoData}              (//div[contains(.,'Data')])[4]
${botao_SecaoCliente}               (//button[@type='button'])[7]
${botao_AdicionarSecao}             //button[contains(.,'Adicionar seção')]
${botao_ExcluirSecao}               (//button[@data-state='closed'])[14]
${botao_SalvarNovaPergunta}         (//button[contains(.,'Salvar')])[2]
${botao_CadastrarPergunta}          (//button[contains(@data-state,'closed')])[10]
${botao_TornarObrigatorias}         (//button[@data-state='closed'])[7]
${input_NovaPergunta}               //input[@name='nome']
${opcao_ObrigatorioNao}             //button[@id='opcao1']
${opcao_ObrigatorioSim}             //button[@id='opcao2']

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
    Input Text                   ${input_NomeDaRequisicao}    ${nome_pesquisa_GruposConsumidores}
    Click Element                ${box_Departamento}
    Click Element                ${box_DepartamentoTI}
    Click Element                ${input_NomeDaRequisicao}
    Sleep    1s
    Click Element                ${botao_SecaoCliente}
    Click Element                ${botao_SecaoCliente}
    Click Element                ${botao_TornarObrigatorias}
    Click Element                ${botao_CadastrarPergunta}
    Input Text                   ${input_NovaPergunta}   ${nome_pesquisa_GruposConsumidores}
    Click Element                ${box_TipodoCampo}
    Click Element                ${box_TipodoCampoData}
    Click Element                ${botao_SalvarNovaPergunta}
    Wait Until Page Contains     text=Pergunta adicionada com sucesso!
    Sleep    4s
    Click Element                ${botaox_ExcluirPergunta}
    Click Element                ${botao_InserirPergunta}
    Click Element                ${botao_InserirPergunta}
    Click Element                ${botaox_ExcluirPergunta}
    Click Element                ${box_EscolhaPergunta}
    Click Element                ${box_EscolhaPerguntaNomeCompleto}
    Click Element                ${opcao_ObrigatorioNao}
    Click Element                ${opcao_ObrigatorioSim}
    Click Element                ${botao_AdicionarSecao}
    Click Element                ${botao_ExcluirSecao}
Então sistema salva novo Tipo de requisição
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -9.01.03
E preencho informações de cadastro editado no menu Configurações > Requisições
    Sleep    2s
    Input Text               ${input_NomeDaRequisicao}    ${nome_pesquisa_GruposConsumidores}
    Click Element            (//div[contains(.,'TI')])[12]
    Click Element            (//div[contains(.,'Comercial')])[13]
    Click Element            ${input_NomeDaRequisicao}
    Sleep    1s
    Click Element            ${botao_InserirPergunta}
    Click Element            ${botao_Salvar}

Então sistema exibe informações de "Editar" no menu Configurações > Requisições
    Wait Until Page Contains    text=Registro editado com sucesso!

# -9.01.04
Quando clico no filtro status
    Click Element            //button[contains(@class, 'peer') and contains(@class, 'inline-flex') and contains(@class, 'cursor-pointer') and contains(@class, 'rounded-full') and contains(@class, 'border-2') and contains(@aria-checked, 'true')]
    
Então sistema exibe mensagem de status atualizado
    Wait Until Page Contains    text=Status do tipo de requisição atualizado com sucesso!
    

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

# -9.03.01
Dado que clico no menu "Configurações > Documentos"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Wait Until Element Is Visible    ${Menu_Documentos}
    Click Element                    ${Menu_Documentos}
Então sistema exibe informações de menu Documentos
    Wait Until Page Contains    text=Informações referentes aos historicos dos documentos gerados no sistema.

# -9.03.01
E seleciono filtro "Tipo de documento"
    Click Element            (//button[contains(.,'Selecione')])[1]
    Click Element            (//div[contains(.,'teste-cadastro')])[13]
Então sistema exibe informações de filtro selecionado
    Wait Until Page Contains    text=Registros carregados com sucesso!

# -9.03.02
E seleciono filtro "Departamento"
    Click Element            (//button[contains(.,'Selecione')])[2]
    Click Element            (//div[contains(.,'TI')])[5]

# -9.03.01
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