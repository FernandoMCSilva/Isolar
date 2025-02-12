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
${botao_InserirPergunta}            (//button[@data-state='closed'])[12]
${botaox_ExcluirPergunta}           xpath=//div[contains(@class, 'flex items-center justify-center gap-4')]//button[contains(@data-state, 'closed')]

${filtro_cards/Lista_Perguntas}     //button[contains(.,'Cards')]
${filtro_botaoLista_Perguntas}      (//div[contains(.,'Lista')])[9]
${quantidade_perguntas}             2
${quatidade_padrao}                 7

${input_NomeDaRequisicao}           //input[@placeholder='Ex: Técnico']
${input_NomeSecao}                  //div[contains(@class, 'col-start-2') and contains(@class, 'col-end-3') and contains(text(), 'Clique para editar o nome da Seção')]
${input_NomeSecaoSelecionado}       //div[contains(@class, 'col-start-2') and contains(@class, 'col-end-3') and contains(@class, 'min-w-24') and contains(@class, 'min-h-12') and contains(@class, 'border') and contains(@class, 'p-2') and contains(@class, 'rounded-sm')]
${input_NovaPergunta}               //input[@name='nome']
${input_ValorConfins}               //input[@id='cofins']
${input_ValorPis}                   //input[@id='pis']
${input_ValorICMS}                  //input[@id='icms']
${input_ValorAutoconsumo}           //input[@id='autoconsumo']
${input_ValorGeracaoCompartilhada}  //input[@id='geracao_compartilhada']

${box_Departamento}                 (//div[contains(.,'Selecione as requisições')])[12]
${box_DepartamentoTI}               (//div[contains(.,'TI')])[13]
${box_EscolhaPergunta}              (//div[contains(.,'Selecione um opção')])[16]
${box_EscolhaPerguntaNomeCompleto}  (//div[contains(.,'Nome completo')])[17]
${box_TipodoCampo}                  //button[contains(.,'Selecione')]
${box_TipodoCampoTexto}             (//div[contains(.,'Texto')])[4]

${botao_SecaoCliente}               (//button[contains(@type,'button')])[9]
${botao_AdicionarSecao}             //button[contains(.,'Adicionar seção')]
${botao_ExcluirSecao}               (//button[@data-state='closed'])[11]
${botao_SalvarNovaPergunta}         (//button[contains(.,'Salvar')])[2]
${botao_CadastrarPergunta}          (//button[contains(@data-state,'closed')])[13]
${botao_TornarObrigatorias}         (//button[@data-state='closed'])[10]
${botao_DecontoNivelAssociados}     //button[contains(.,'Nível de Associados')]
${botao_DecontoConcessionarias}     //button[contains(.,'Concessionárias')]
${botao_DecontoGruposTarifarios}    //button[contains(.,'Grupos tárifarios')]
${botaox_RemoverSupervisor}         //div[contains(@aria-label,'Remove Fernando Morais da Costa Silva')]
${botao_AtualizarConfig}            //button[contains(.,'Atualizar')]
${botao_Editar_Configuracoes}       //button[contains(.,'Editar')]

${opcao_ObrigatorioNao}             //button[@id='opcao1']
${opcao_ObrigatorioSim}             //button[@id='opcao2']

${nomeSecao_TipoRequisicao}         //input[@id='nome']

*** Keywords ***
# -10.01.01
Dado que clico no menu "Configurações > Requisições"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Click Element                    ${Menu_ConfigRequisicoes} 
Então sistema exibe informações de menu Requisições
    Wait Until Page Contains    text=Tipos de requisição

# -10.01.02
Quando clico no botão "Novo tipo"
    Sleep    2s
    Click Element    ${botao_NovoTipo}
E preencho informações de cadastro de Novo tipo de Requisições
    Sleep    2s
    Input Text                       ${input_NomeDaRequisicao}    ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${box_Departamento}
    Click Element                    ${box_DepartamentoTI}
    Click Element                    ${input_NomeDaRequisicao}
    Sleep    1s
    Click Element                    ${botao_SecaoCliente}
    Click Element                    ${botao_SecaoCliente}
    Click Element                    ${botao_CadastrarPergunta}
    Input Text                       ${input_NovaPergunta}   ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${box_TipodoCampo}
    Click Element                    ${box_TipodoCampoTexto}
    Input Text                   //input[@name='placeholder']    teste
    Click Element                ${botao_SalvarNovaPergunta}
    Wait Until Page Contains     text=Pergunta adicionada com sucesso!
    Sleep    4s
    Click Element                    ${botao_TornarObrigatorias}
    Click Element                    ${botaox_ExcluirPergunta}
    Click Element                    ${botao_InserirPergunta}
    Click Element                    ${botao_InserirPergunta}
    Click Element                    ${botaox_ExcluirPergunta}
    Click Element                    ${box_EscolhaPergunta}
    Sleep    1s
    Click Element                    ${box_EscolhaPerguntaNomeCompleto}
    Click Element                    ${opcao_ObrigatorioNao}
    Click Element                    ${opcao_ObrigatorioSim}
    Sleep    1s
    Execute Javascript               window.scrollBy(0,-100)
    Wait Until Element Is Visible    ${botao_ExcluirSecao}
    Click Element                    ${botao_ExcluirSecao}
    Click Element                    ${botao_AdicionarSecao}
    Click Element                    ${botao_ExcluirSecao}
    Sleep    0.5s

#não tem que mudar o nome da seção, se estiver com erro, provavelmente está no botão excluir seção

Então sistema salva novo Tipo de requisição
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -10.01.03
Quando clico em "Editar" em configuracoes
    Wait Until Element Is Visible    ${botao_Editar_Configuracoes}
    Click Element                    ${botao_Editar_Configuracoes}

E preencho informações de cadastro editado no menu Configurações > Requisições
    Sleep    2s
    Input Text               ${input_NomeDaRequisicao}    ${nome_pesquisa_GruposConsumidores}
    Click Element            (//div[contains(.,'TI')])[12]
    Click Element            (//div[contains(.,'Compras')])[13]
    Click Element            ${input_NomeDaRequisicao}
    Sleep    1s
    Click Element            ${botao_InserirPergunta}
    Click Element            ${botao_ExcluirSecao}
    Click Element            ${botao_Salvar}

Então sistema exibe informações de "Editar" no menu Configurações > Requisições
    Wait Until Page Contains    text=Registro editado com sucesso!

# -10.01.04
Quando clico no filtro status
    Click Element            //button[contains(@class, 'peer') and contains(@class, 'inline-flex') and contains(@class, 'cursor-pointer') and contains(@class, 'rounded-full') and contains(@class, 'border-2') and contains(@aria-checked, 'true')]
    
Então sistema exibe mensagem de status atualizado
    Wait Until Page Contains    text=Status do tipo de requisição atualizado com sucesso!
    

# -10.01.05
Então sistema exibe informações de pesquisa de tipo de requisição
    ${nome_resultado}=    Get Text    //h3[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_pessoas}'    Log    "O resultado da pesquisa é Fernando. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é Fernando. Teste falhou."    WARN


# -10.01.06
Quando clico em "Excluir" em configurações
    Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}
    Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}

Quando clico em "Excluir" em configurações em perguntas
    Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}
    Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}
    Sleep    1s
    Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}

# -10.01.07
Então sistema exclui item do menu Configurações > Requisições
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -10.01.08
Então sistema exibe informações da pagina perguntas
    Wait Until Page Contains    text=Adicionar uma nova pergunta


# --10.01.09
E clico no botao "Perguntas"
    Wait Until Element Is Visible    ${botao_Perguntas}
    Click Element                    ${botao_Perguntas}
E preencho informações de nova pergunta
    Sleep    2s
    Input Text            //input[@name='nome']    ${nome_pesquisa_GruposConsumidores}
    Click Element         //button[contains(.,'Selecione')]
    Click Element         (//div[contains(.,'Texto')])[4]
    Sleep                 1s
    Input Text            //input[@name='placeholder']    ${nome_pesquisa_GruposConsumidores}
    Click Element         //button[contains(.,'Não')]
    Click Element         (//div[contains(.,'Sim')])[4]
    Click Element         //button[contains(.,'Sim')]
    Click Element         (//div[contains(.,'Não')])[4]
    Click Element         //button[contains(.,'Selecione')]
    Click Element         (//div[contains(.,'Endereço/Rua')])[4]
Então sistema exibe mensagem de pergunta adicionada no menu Configurações > Requisições
    Wait Until Page Contains    text=Pergunta adicionada com sucesso!

# -10.01.10
E vou para o fim da página
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Quando clico em "Editar" em configurações
    Wait Until Element Is Visible    ${botao_Editar_Configuracoes}
    Click Element                    ${botao_Editar_Configuracoes}

E preencho informações de pergunta editada no menu Configurações > Requisições > Perguntas
    Sleep    2s
    Input Text            //input[@name='nome']    ${nome_pesquisa_GruposConsumidores}
    Click Element         //button[contains(.,'Texto')]
    Click Element         (//div[contains(.,'Data')])[4]
    Sleep    2s
    Click Element         ${botao_Salvar}

Então sistema exibe informações de "Editar" no menu Configurações > Requisições > Perguntas
    Wait Until Page Contains    text=Pergunta atualizada com sucesso!

# --10.01.11
Então sistema exibe informações de pesquisa de perguntas
    Sleep    1s
    ${nome_resultado}=    Get Text    //h3[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_pessoas}'    Log    "O resultado da pesquisa é Fernando. Teste passou."
    ...    ELSE    Log    "O resultado da pesquisa não é Fernando. Teste falhou."    WARN

# --10.01.12
Então sistema exclui pergunta do menu Configurações > Requisições > Perguntas
    Wait Until Page Contains    text=Pergunta deletada com sucesso!

# --10.01.13
Quando clico no filtro "Cards" em perguntas
    Sleep    2s
    Click Element    ${filtro_cards/Lista_Perguntas}
E clico em "Lista" em perguntas
    Sleep    1s
    Click Element    ${filtro_botaoLista_Perguntas}

# --10.01.14
Então sistema exibe mensagem de erro em Perguntas
    Wait Until Page Contains    text=Nenhum tipo de requisição encontrado.

# --10.01.15
E preencho informações no campo quantidade em perguntas
    Input Text    //input[contains(@id,'itensPorPagina')]   ${quantidade_perguntas}
    Click Element    (//div[contains(.,'Quantidade')])[12]
Então sistema exibe informações de acordo com quantidade preenchida em perguntas
    Sleep    3s
    ${resultados}=    Get WebElements    //tbody/tr[contains(@class, 'border-b')]
    ${quantidade}=    Get Length    ${resultados}
    Log    Quantidade de elementos encontrados: ${quantidade}
    Should Be Equal As Numbers    ${quantidade}    ${quantidade_perguntas}    A quantidade de elementos retornados não corresponde à quantidade esperada

# --10.01.17
Então sistema exibe informações com filtro "Lista" em Configurações > Requisições
    Sleep    2s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Tipo')]
    Run Keyword If    ${titulo_nome}    Log    "O Título Nome está visível. Funcionou."
    ...    ELSE    Fail    "O Título Nome não está visível. Falhou."

# --10.01.18
Então sistema exibe mensagem de erro em Configurações > Requisições
    Wait Until Page Contains    text=Nenhum tipo de requisição encontrado.

# --10.02.01
Dado que clico no menu "Configurações > Minerando sol"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Wait Until Element Is Visible    ${Menu_ConfigMinerandoSol}
    Click Element                    ${Menu_ConfigMinerandoSol}
Então sistema exibe informações de menu Minerando sol
    Wait Until Page Contains    text=Configurar valores das constantes da Minerando Sol

# -10.02.02
Quando preencho informações do menu "Geral" no menu Configurações > Minerando Sol
    Sleep    2s
    Input Text        ${input_ValorConfins}                    2,35    
    Input Text        ${input_ValorPis}                        0,5
    Input Text        ${input_ValorICMS}                       17
    Input Text        ${input_ValorAutoconsumo}                1
    Input Text        ${input_ValorGeracaoCompartilhada}       1
    Click Element     ${botao_DecontoNivelAssociados}
    Click Element     ${botao_DecontoConcessionarias}
    Click Element     ${botao_DecontoGruposTarifarios}
    Input Text        //input[@id='concessionaria-4']            ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-6']            ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-7']            ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-8']            ${quatidade_padrao}
    Input Text        //input[@id='grupo-106']                   ${quatidade_padrao}
    Input Text        //input[@id='grupo-107']                   ${quatidade_padrao}
    Input Text        //input[@id='grupo-108']                   ${quatidade_padrao}
    Input Text        //input[@id='grupo-109']                   ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-8']            ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-9']            ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-10']           ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-11']           ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-12']           ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-24']           ${quatidade_padrao}
    Input Text        //input[@id='concessionaria-25']           ${quatidade_padrao}
    Input Text        (//input[@value='7'])[16]                  ${quatidade_padrao}
    Input Text        (//input[@value='7'])[17]                  ${quatidade_padrao}
    Input Text        (//input[@value='7'])[18]                  ${quatidade_padrao}
    Input Text        (//input[@value='7'])[19]                  ${quatidade_padrao}
    Input Text        (//input[@type='number'])[5]               ${quatidade_padrao}
    Click Element     //button[contains(.,'Adicionar Novo Associado')]
    Click Element     (//button[contains(.,'Remover')])[6]
    Sleep    1s
    Click Element     ${botaox_RemoverSupervisor}
    Click Element     (//div[@aria-hidden='true'])[2]
    Click Element     (//div[contains(.,'Fernando Morais da Costa Silva')])[16]
    Click Element     //button[@class='peer inline-flex h-[24px] w-[44px] shrink-0 cursor-pointer items-center rounded-full border-2 border-transparent transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=unchecked]:bg-slate-400']
    Click Element     //button[@class='peer inline-flex h-[24px] w-[44px] shrink-0 cursor-pointer items-center rounded-full border-2 border-transparent transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=unchecked]:bg-slate-400']
E clico em Atualizar
    Click Element     ${botao_AtualizarConfig}

Então sistema exibe mensagem de atualização
    Wait Until Page Contains    text=Registro atualizado com sucesso!

# -10.02.03
Quando preencho informações do menu "Template > Campos CPF" no menu Configurações > Minerando Sol
    Sleep    1s
    Click Element    (//button[contains(.,'Texto')])[1]
    Click Element    (//div[contains(.,'Data')])[5]
    Click Element    (//button[contains(.,'Nenhuma')])[1]
    Click Element    (//div[contains(.,'Endereço/Rua')])[5]
    Input Text       (//input[@value='Nome'])[1]    ${nome_pesquisa_GruposConsumidores}
    Click Element    //button[contains(.,'Atualizar campos Pessoa física - Termos')]
    Wait Until Page Contains    text=Campos atualizados com sucesso.
    Sleep    4s



# -10.02.03
# -10.03.01
Dado que clico no menu "Configurações > Documentos"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Wait Until Element Is Visible    ${Menu_Documentos}
    Click Element                    ${Menu_Documentos}
Então sistema exibe informações de menu Documentos
    Wait Until Page Contains    text=Informações referentes aos historicos dos documentos gerados no sistema.

# -10.03.01
E seleciono filtro "Tipo de documento"
    Click Element            (//button[contains(.,'Selecione')])[1]
    Click Element            (//div[contains(.,'teste-cadastro')])[13]
Então sistema exibe informações de filtro selecionado
    Wait Until Page Contains    text=Registros carregados com sucesso!

# -10.03.02
E seleciono filtro "Departamento"
    Click Element            (//button[contains(.,'Selecione')])[2]
    Click Element            (//div[contains(.,'TI')])[5]

# -10.03.01
# # -10.4
# Dado que clico no menu "Configurações > Estimativa"
#     Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
#     Click Element                    ${MENU_CONFIGURACOES}
#     Wait Until Element Is Visible    ${Menu_Estimativa}
#     Click Element                    ${Menu_Estimativa}

# # -10.5
# Dado que clico no menu "Configurações > Sistema"
#     Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
#     Click Element                    ${MENU_CONFIGURACOES}
#     Click Element                    ${Menu_Sistema}