*** Settings ***
Documentation      Modúlo gerencia Configurações no sistema.
Resource           ../Main.robot

*** Variables ***
${MENU_CONFIGURACOES}               //button[@aria-controls='radix-:r82:']
${MENU_DOCUMENTOS}                  (//p[contains(.,'Documentos')])[2]
${Menu_ConfigRequisicoes}           (//p[contains(.,'Requisições')])[2]
${Menu_ConfigDocumentos}            (//p[contains(.,'Documentos')])[2]
${Menu_ConfigProposta}            (//a[@href='/configuracoes/constantes_estimativa'])[1]
${Menu_ConfigSistema}               //button[@class='inline-flex items-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground px-4 py-2 w-full justify-center h-10 mb-1']
${Menu_ConfigMinerandoSol}          (//a[contains(@href,'misol')])[2]
${Menu_ConfigMonitoramento}         (//p[contains(.,'Monitoramento')])[2]
${Menu_ConfigObras}                 (//p[contains(.,'Obras')])[2]
${Menu_ConfigContratos}             (//a[@href='/configuracoes/controle_contratos'])[1]

${filtro_buscarConfig}              (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10'])[1]
${filtro_DataRegistroRequisicoes}   (//button[@class='inline-flex items-center whitespace-nowrap rounded-md text-sm ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start text-left font-normal text-muted-foreground'])[1]
${filtro_cards/Lista_Perguntas}     //button[contains(.,'Cards')]
${filtro_cards/lista_Config}        (//button[@role='combobox'])[2]
${filtro_botaoLista_Perguntas}      (//div[contains(.,'Lista')])[9]
${quantidade_perguntas}             2
${quatidade_padrao}                 7
${nomeSecao_TipoRequisicao}         //input[@id='nome']
${ValorPadrao_IP}                   177.38.13.190         

${input_NomeDaRequisicao}           //input[@placeholder='Ex: Técnico']
${input_NomeSecao}                  //div[contains(@class, 'col-start-2') and contains(@class, 'col-end-3') and contains(text(), 'Clique para editar o nome da Seção')]
${input_NomeSecaoSelecionado}       //div[contains(@class, 'col-start-2') and contains(@class, 'col-end-3') and contains(@class, 'min-w-24') and contains(@class, 'min-h-12') and contains(@class, 'border') and contains(@class, 'p-2') and contains(@class, 'rounded-sm')]
${input_NovaPergunta}               //input[@name='nome']
${input_ValorConfins}               //input[@id='cofins']
${input_ValorPis}                   //input[@id='pis']
${input_ValorICMS}                  //input[@id='icms']
${input_ValorAutoconsumo}           //input[@id='autoconsumo']
${input_ValorGeracaoCompartilhada}  //input[@id='geracao_compartilhada']
${input_TotalArvores}               (//div[@class='relative']//input)[1]
${input_TotalCO2}                   (//label[normalize-space(text())='Total CO2']/following::input)[1]
${input_TotalResidencias}           (//label[normalize-space(text())='Total de residências']/following::input)[1]
${input_FatorSimultaniedade}        (//label[normalize-space(text())='Fator de simultaneidade']/following::input)[1]
${input_TaxaImposto1MW}             (//label[normalize-space(text())='Taxa de imposto até 1MW de inversor']/following::input)[1]
${input_DemandaGeracao}             (//label[normalize-space(text())='Demanda Contratada Geração']/following::input)[1]
${input_Porcentagem1MW}             (//label[normalize-space(text())='Porcentagem OEM até 1MW de inversor em solo']/following::input)[1]
${input_ModuloW}                    (//label[normalize-space(text())='Módulo - W']/following::input)[1]
${input_PesoPorModulo}              (//label[normalize-space(text())='Peso por módulo']/following::input)[1]
${input_AreaMediaSolo}              (//label[normalize-space(text())='Área Média Utilizada por Painel no Solo (m²)']/following::input)[1]
${input_FatorPotencia}              (//label[normalize-space(text())='Fator de Potência']/following::input)[1]
${input_FaixaInicial}               (//input[@value='0,00'])[2]
${input_FaixaFinal}                 (//input[@value='0,00'])[3]

${Original_TotalArvores}            7,07
${Original_TotalCO2}                33,581
${Original_TotalResidencias}        2,501
${Original_FatorSimultaniedade}     30
${Original_TaxaImposto1MW}          8,14
${Original_DemandaGeracao}          4,92
${Original_Porcentagem1MW}          0,5
${Original_ModuloW}                 585
${Original_PesoPorModulo}           29,1
${Original_AreaMediaSolo}           6
${Original_FatorPotencia}           0,92
${Original_MensagemWhatsapp}        Olá, tudo bem? Falei com você agora pouco, sou o vendedor 
...    representando a Isolar Energy, vamos dar continuidade a nossa conversa.
${Original_MensagemEmail}           Olá, tudo bem? Falei com você agora pouco, sou o vendedor 
...    representando a Isolar Energy, vamos dar continuidade a nossa conversa. No anexo, terá a estimativa gerada.

${box_Departamento}                 (//div[contains(.,'Selecione as requisições')])[12]
${box_DepartamentoTI}               (//div[contains(.,'TI')])[13]
${box_EscolhaPergunta}              (//div[contains(.,'Selecione um opção')])[16]
${box_EscolhaPerguntaNomeCompleto}  (//div[contains(.,'Nome completo')])[17]
${box_TipodoCampo}                  //button[contains(.,'Selecione')]
${box_TipodoCampoTexto}             (//div[contains(.,'Texto')])[4]

${botao_NovoTipo}                   //button[contains(.,'Novo tipo')]
${botao_Perguntas}                  //button[contains(.,'Perguntas')]
${botao_Salvar}                     //button[contains(.,'Salvar')]
${botao_InserirPergunta}            (//button[@data-state='closed'])[12]
${botaox_ExcluirPergunta}           xpath=//div[contains(@class, 'flex items-center justify-center gap-4')]//button[contains(@data-state, 'closed')]
${botao_SecaoCliente}               (//button[contains(@type,'button')])[9]
${botao_AdicionarSecao}             //button[contains(.,'Adicionar seção')]
${botao_ExcluirSecao}               (//button[@data-state='closed'])[11]
${botao_SalvarNovaPergunta}         (//button[contains(.,'Salvar')])[2]
${botao_CadastrarPergunta}          (//button[contains(@data-state,'closed')])[13]
${botao_TornarObrigatorias}         (//button[@data-state='closed'])[10]
${botao_DecontoNivelAssociados}     //button[contains(.,'Nível de Associados')]
${botao_DecontoConcessionarias}     //button[contains(.,'Concessionárias')]
${botao_DecontoGruposTarifarios}    //button[contains(.,'Grupos tárifarios')]
${botaox_RemoverSupervisor}         (//div[text()='Fernando QA']/following-sibling::div)[1]
${botao_AtualizarConfig}            //button[contains(.,'Atualizar')]
${botao_Editar_Configuracoes}       (//button[normalize-space()='Editar'])[1]
${Botao_VerTemplate_Configuracoes}  (//td[contains(@class,'p-4 align-middle')]//button)[1]
${Botao_Historico_Configuracoes}    (//td[contains(@class,'p-4 align-middle')]//button)[2]
${Botao_AtualizarTemplate}          (//td[contains(@class,'p-4 align-middle')]//button)[3]
${Botao_EditarTemplate}             (//td[contains(@class,'p-4 align-middle')]//a)[1]
${Botao_Criar_ConfiguracoesDoc}     //button[normalize-space(text())='Criar']
${Botao_ConstantesAmbientais}       (//button[normalize-space()='Constantes ambientais'])[1]
${Botao_ConstantesImpostos}         (//button[normalize-space()='Constantes Impostos'])[1]
${Botao_ConstantesTécnicas}         (//button[normalize-space()='Constantes técnicas'])[1]
${Botao_PrecoInvestimento}          //button[normalize-space(text())='Preço para Investimento kWp']
${Botao_InvestimentoSolo}           //button[normalize-space(text())='Investimento para Solo']
${Botao_InvestimentoFibrocimento}   //button[normalize-space(text())='Investimento para Telhado de FibroCimento']
${Botao_InvestimentoAlunzinco}      //button[normalize-space(text())='Investimento para Telhado de Aluzinco']
${Botao_PrecoConsumo}               //button[normalize-space(text())='Preço para Consumo kWp']
${Botao_ConsumoSolo}                //button[normalize-space(text())='Consumo para Solo']
${Botao_ConsumoFibroCimento}        //button[normalize-space(text())='Consumo para Telhado de FibroCimento']
${Botao_Alunzinco}                  //button[normalize-space(text())='Consumo para Telhado de Aluzinco']
${Botao_AdicionarRegistroConfig}    //button[normalize-space(text())='Adicionar Novo Registro']
${Botao_RemoverRegistroConfig}      //button[contains(@class, 'inline-flex') and contains(text(), 'Remover')]
${Botao_SalvarConfig}               //button[@type='submit']
${Botao_SalvarMensagensConfig}      //button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2']
${Botao_VisualizarConfig}           (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10'])[2]
${Botao_Anterior}                   (//button[normalize-space()='Anterior'])[1]

${opcao_ObrigatorioNao}             //button[@id='opcao1']
${opcao_ObrigatorioSim}             //button[@id='opcao2']

*** Keywords ***
# -10.01.01
Dado que clico no menu "Configurações > Requisições"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Wait Until Element Is Visible    ${Menu_ConfigRequisicoes}
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
    Input Text                       //input[@name='placeholder']    teste
    Click Element                    ${botao_SalvarNovaPergunta}
    Wait Until Page Contains         text=Pergunta adicionada com sucesso!
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
    Sleep    4s
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

E preencho informações de pesquisa em Configurações
    Input Text    //input[@placeholder='Buscar...']    teste
    Sleep    1s
    Wait Until Page Contains    text=teste

Quando clico no filtro status
    Click Element            //button[contains(@class, 'peer') and contains(@class, 'inline-flex') and contains(@class, 'cursor-pointer') and contains(@class, 'rounded-full') and contains(@class, 'border-2') and contains(@aria-checked, 'true')]
    
Então sistema exibe mensagem de status atualizado
    Wait Until Page Contains    text=Status do tipo de requisição atualizado com sucesso!
    
# -10.01.05
Então sistema exibe informações de pesquisa de tipo de requisição
    ${nome_resultado}=    Get Text    //h3[contains(.,'teste')]



# -10.01.06
Quando clico em "Excluir" em configurações
    Sleep    0.5s
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
    Sleep    3s
    Wait Until Page Contains    text=Adicionar uma nova pergunta


# --10.01.09
E clico no botao "Perguntas"
    Sleep    1s
    Wait Until Element Is Visible    ${botao_Perguntas}
    Click Element                    ${botao_Perguntas}

E preencho informações de nova pergunta
    Sleep    2s
    Input Text            //input[@name='nome']    teste
    Click Element         //button[contains(.,'Selecione')]
    Click Element         (//div[contains(.,'Texto')])[4]
    Sleep                 1s
    Input Text            //input[@name='placeholder']    teste
    Click Element         //button[contains(.,'Não')]
    Click Element         (//div[contains(.,'Sim')])[4]
    Click Element         //button[contains(.,'Sim')]
    Click Element         (//div[contains(.,'Não')])[4]
    Click Element         //button[contains(.,'Selecione')]
    Click Element         (//div[contains(.,'Endereço/Rua')])[4]
Então sistema exibe mensagem de pergunta adicionada no menu Configurações > Requisições
    Wait Until Page Contains    text=Pergunta adicionada com sucesso!

# -10.01.10
Rolar para o fim da página
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
Quando clico no botão buscar
    Sleep    1s
    Wait Until Element Is Visible    ${botao_buscarPerguntas}
    Click Element                    ${botao_buscarPerguntas}


Então sistema exibe informações de pesquisa de perguntas
    Sleep    1s
    ${nome_resultado}=    Get Text    //h3[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_pessoas}'    No Operation

# --10.01.12
Então sistema exclui pergunta do menu Configurações > Requisições > Perguntas
    Wait Until Page Contains    text=Pergunta deletada com sucesso!

# --10.01.13
Quando clico no filtro "Cards" em perguntas
    Sleep    4s
    Click Element    ${filtro_cards/lista_Config}
    
E clico em "Lista" em perguntas
    Sleep    2s
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

# NÃO EXISTE MAIS ESSE CÓDIGO
# # --10.02.01
# Dado que clico no menu "Configurações > Minerando sol"
#     Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
#     Click Element                    ${MENU_CONFIGURACOES}
#     Wait Until Element Is Visible    ${Menu_ConfigMinerandoSol}
#     Click Element                    ${Menu_ConfigMinerandoSol}
# Então sistema exibe informações de menu Minerando sol
#     Wait Until Page Contains    text=Configurar valores das constantes da Minerando Sol

# # -10.02.02
# Quando preencho informações do menu "Geral" no menu Configurações > Minerando Sol
# # 1
#     Sleep    2s
#     Input Text        ${input_ValorConfins}                    2,35    
#     Input Text        ${input_ValorPis}                        0,5
#     Input Text        ${input_ValorICMS}                       17
#     Input Text        ${input_ValorAutoconsumo}                1
#     Input Text        ${input_ValorGeracaoCompartilhada}       1
#     Click Element     ${botao_DecontoNivelAssociados}
#     Click Element     ${botao_DecontoConcessionarias}
#     Click Element     ${botao_DecontoGruposTarifarios}
# # 2

#     Input Text        //input[@id='concessionaria-4']            ${quatidade_padrao}
#     Input Text        //input[@id='concessionaria-6']            ${quatidade_padrao}
#     Input Text        //input[@id='concessionaria-7']            ${quatidade_padrao}
#     Input Text        //input[@id='concessionaria-8']            ${quatidade_padrao}
#     Input Text        (//label[normalize-space(text())='Enel']/following::input)[1]                    ${quatidade_padrao}
#     Input Text        (//label[normalize-space(text())='AMAZONAS ENERGIA']/following::input)[1]        ${quatidade_padrao}
#     Input Text        (//label[normalize-space(text())='Cemig']/following::input)[1]                   ${quatidade_padrao}
#     Input Text        (//label[normalize-space(text())='CRERAL']/following::input)[1]                  ${quatidade_padrao}
#     Input Text        //input[@id='concessionaria-8']            ${quatidade_padrao}
#     Input Text        //input[@id='concessionaria-9']            ${quatidade_padrao}
#     Input Text        //input[@id='concessionaria-10']           ${quatidade_padrao}
#     Input Text        //input[@id='concessionaria-11']           ${quatidade_padrao}
#     Input Text        //input[@id='concessionaria-12']           ${quatidade_padrao}
#     Input Text        (//label[normalize-space(text())='Creluz']/following::input)[1]           ${quatidade_padrao}
#     Input Text        (//label[normalize-space(text())='Energisa']/following::input)[1]         ${quatidade_padrao}
#     Input Text        (//label[normalize-space(text())='Equatorial']/following::input)[1]       ${quatidade_padrao}
#     Input Text        (//input[@value='7'])[17]                  ${quatidade_padrao}
#     Input Text        (//input[@value='7'])[18]                  ${quatidade_padrao}
#     Input Text        (//input[@value='7'])[19]                  ${quatidade_padrao}
#     Input Text        (//input[@type='number'])[5]               ${quatidade_padrao}
#     Click Element     //button[contains(.,'Adicionar Novo Associado')]
#     Click Element     (//button[contains(.,'Remover')])[6]
#     Sleep    1s
#     Sleep    3s
#     Click Element     ${botaox_RemoverSupervisor}
#     Click Element     (//div[@aria-hidden='true'])[2]
#     Click Element     //div[normalize-space(text())='Fernando QA']
#     Click Element     //button[@class='peer inline-flex h-[24px] w-[44px] shrink-0 cursor-pointer items-center rounded-full border-2 border-transparent transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=unchecked]:bg-slate-400']
#     Click Element     //button[@class='peer inline-flex h-[24px] w-[44px] shrink-0 cursor-pointer items-center rounded-full border-2 border-transparent transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=unchecked]:bg-slate-400']
# E clico em Atualizar
#     Wait Until Element Is Visible    ${botao_AtualizarConfig}
#     Click Element                    ${botao_AtualizarConfig}

# Então sistema exibe mensagem de atualização
#     Wait Until Page Contains    text=Registro atualizado com sucesso!

# # -10.02.03
# Quando preencho informações do menu Template
#     Sleep    1s
#     Wait Until Element Is Visible    //button[normalize-space(text())='Template']
#     Click Element                    //button[normalize-space(text())='Template']
#     Click Element                    (//button[contains(.,'Texto')])[1]
#     Click Element                    (//div[contains(.,'Data')])[5]
#     Click Element                    (//button[contains(.,'Nenhuma')])[1]
#     Click Element                    (//div[contains(.,'Endereço/Rua')])[5]
#     Input Text                       (//input[@value='Nome'])[1]    ${nome_pesquisa_GruposConsumidores}
#     Click Element                    //button[contains(.,'Atualizar campos Pessoa física - Termos')]
#     Wait Until Page Contains         text=Campos atualizados com sucesso.
#     Sleep    4s

# -10.02.01
Dado que clico no menu "Configurações > Documentos"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Sleep    1s 
    Wait Until Element Is Visible    ${Menu_ConfigDocumentos}
    Click Element                    ${Menu_ConfigDocumentos}
Então sistema exibe informações de menu Documentos
    Wait Until Page Contains    text=Informações referentes aos historicos dos documentos gerados no sistema.

# -10.02.01
E seleciono filtro "Tipo de documento"
    Sleep    2s
    Click Element            (//button[@role='combobox'])[1]
    Click Element            //span[normalize-space(text())='P']

Então sistema exibe informações de filtro selecionado
    Sleep    1s
    Wait Until Page Contains    text=Registros carregados com sucesso!

# -10.02.02
E seleciono filtro "Departamento"
    Sleep    1s
    Wait Until Element Is Visible    (//button[@role='combobox'])[2]
    Click Element                    (//button[@role='combobox'])[2]
    Click Element                    (//div[contains(.,'TI')])[5]

# -10.02.03
E clico no botão Ver template
    Sleep    2s
    Wait Until Element Is Visible    ${Botao_VerTemplate_Configuracoes}
    Click Element                    ${Botao_VerTemplate_Configuracoes}

Então sistema exibe informações de template selecionado
    Wait Until Page Contains    text=Baixar Template editável

# -10.02.04
E clico no botão Ver histórico
    Sleep    2s
    Wait Until Element Is Visible    ${Botao_Historico_Configuracoes}
    Click Element                    ${Botao_Historico_Configuracoes}

Então sistema exibe histórico de template selecionado
    Wait Until Page Contains    text=Histórico das ações do template - 1

# -10.02.05
E clico no botão Atualizar template
    Wait Until Element Is Visible    ${Botao_AtualizarTemplate}
    Click Element                    ${Botao_AtualizarTemplate}
    Wait Until Page Contains         text=Selecione ou arraste o novo template

E faço upload de arquivo teste de template
    Sleep    1s
    # Wait Until Element Is Visible    //input[@type='file']
    # Choose File                      //input[@type='file']    C:\Users\silva\Downloads\teste-2020-07.docx
    # Sleep    3s
Então sistema atualiza template selecionado
    Wait Until Page Contains    text=Atualizado

# -10.02.06
E clico no botão Editar template e campos
    Wait Until Element Is Visible    ${Botao_EditarTemplate}
    Click Element                    ${Botao_EditarTemplate}

Então sistema exibe confirmação de edição
    Wait Until Page Contains    text=Edição feita com sucesso!

# -10.02.07
Quando clico no botão Criar em Configurações > Documentos
    Wait Until Element Is Visible    ${Botao_Criar_ConfiguracoesDoc}
    Click Element                    ${Botao_Criar_ConfiguracoesDoc}

E clico em Anexar Template
    Wait Until Element Is Visible    //button[contains(.,'(0)Anexar template')]
    Click Element                    //button[contains(.,'(0)Anexar template')]

E faço upload de arquivo teste em Configurações > Documentos
    Sleep    1s

Então sistema cria novo template de documentos
    Wait Until Page Contains    text=Templade adicionado com sucesso    

# -10.04.01
Dado que clico no menu "Configurações > Proposta"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Wait Until Element Is Visible    ${Menu_ConfigProposta}
    Click Element                    ${Menu_ConfigProposta}

Então sistema exibe informações de menu Estimativa
    Wait Until Page Contains    text=Preencha os campos abaixo e clique em atualizar para atualizar as informações.

# -10.04.02
Quando clico em Constantes ambientais
    Sleep    3s
    Wait Until Element Is Visible    ${Botao_ConstantesAmbientais}    timeout=20s
    Click Element                    ${Botao_ConstantesAmbientais}

E altero informações de Constantes ambientais
    Wait Until Element Is Visible    ${input_TotalArvores}
    Input Text                       ${input_TotalArvores}    ${valorteste}

E clico em Atualizar valores das contanstes
    Wait Until Element Is Visible    ${botao_AtualizarConfig}
    Click Element                    ${botao_AtualizarConfig}

E restauro informações originais de Constantes ambientais
    Sleep    7s
    Wait Until Element Is Visible    ${Botao_ConstantesAmbientais}    timeout=20s
    Click Element                    ${Botao_ConstantesAmbientais}
    Input Text                       ${input_TotalArvores}        ${Original_TotalArvores}
    Sleep    1.5s
    Input Text                       ${input_TotalCO2}            ${Original_TotalCO2}
    Input Text                       ${input_TotalResidencias}    ${Original_TotalResidencias}
    Sleep    1s
    Click Element                    ${botao_AtualizarConfig}

Então sistema exibe atualiza valores das constantes
    Wait Until Page Contains    text=Configurações atualizadas com sucesso!
    Sleep    5s

E restauro Constantes ambientais para valores originais
    Wait Until Element Is Visible    ${input_TotalArvores}
    Input Text                       ${input_TotalArvores}    ${Original_TotalArvores}
    Log To Console    Original: ${Original_TotalArvores}

# -10.04.03
Quando clico em Constantes Impostos
    Sleep    3s
    Wait Until Element Is Visible    ${Botao_ConstantesImpostos}
    Click Element                    ${Botao_ConstantesImpostos}

E altero informações de Constantes Impostos
    Wait Until Element Is Visible    ${input_FatorSimultaniedade}
    Input Text                       ${input_FatorSimultaniedade}    ${valorteste}
    Sleep    0.5
    Input Text                       ${input_TaxaImposto1MW}         ${valorteste}
    Sleep    0.5
    Input Text                       ${input_DemandaGeracao}         ${valorteste}
    Sleep    0.5
    Input Text                       ${input_DemandaGeracao}         ${valorteste}
    Sleep    0.5
    Input Text                       ${input_Porcentagem1MW}         ${valorteste}
    Sleep    0.5
    
E restauro informações originais de Constantes Impostos
    Sleep    7s
    Wait Until Element Is Visible    ${Botao_ConstantesImpostos}    timeout=20s
    Click Element                    ${Botao_ConstantesImpostos}
    Input Text                       ${input_FatorSimultaniedade}    ${Original_FatorSimultaniedade}
    Sleep    0.5
    Input Text                       ${input_TaxaImposto1MW}         ${Original_TaxaImposto1MW}
    Sleep    0.5
    Input Text                       ${input_DemandaGeracao}         ${Original_DemandaGeracao}
    Sleep    0.5
    Input Text                       ${input_DemandaGeracao}         ${Original_DemandaGeracao}
    Sleep    0.5
    Input Text                       ${input_Porcentagem1MW}         ${Original_Porcentagem1MW}
    Sleep    0.5
    Click Element                    ${botao_AtualizarConfig}

# -10.04.04
Quando clico em Constantes técnicas
    Sleep    7s
    Wait Until Element Is Visible    ${Botao_ConstantesTécnicas}    timeout=20s
    Click Element                    ${Botao_ConstantesTécnicas}

E altero informações de Constantes técnicas
    Wait Until Element Is Visible    ${input_ModuloW}
    Input Text                       ${input_ModuloW}           ${valorteste}
    Sleep    0.5
    Input Text                        ${input_PesoPorModulo}    ${valorteste}
    Sleep    0.5
    Input Text                        ${input_AreaMediaSolo}    ${valorteste}
    Sleep    0.5
    Input Text                        ${input_FatorPotencia}    ${valorteste}

E restauro informações originais de Constantes técnicas
    Sleep    8s
    Wait Until Element Is Visible    ${Botao_ConstantesTécnicas}    timeout=20s
    Click Element                    ${Botao_ConstantesTécnicas}
    Wait Until Element Is Visible    ${input_ModuloW}
    Input Text                       ${input_ModuloW}           ${Original_ModuloW}
    Sleep    0.5
    Input Text                        ${input_PesoPorModulo}    ${Original_PesoPorModulo}
    Sleep    0.5
    Input Text                        ${input_AreaMediaSolo}    ${Original_AreaMediaSolo}
    Sleep    0.5
    Input Text                        ${input_FatorPotencia}    ${Original_FatorPotencia}
    Sleep    0.5
    Click Element                    ${botao_AtualizarConfig}

# -10.04.05
Quando clico em Preço para Investimento > Solo
    Wait Until Element Is Visible    ${Botao_PrecoInvestimento}
    Click Element                    ${Botao_PrecoInvestimento}
    Click Element                    ${Botao_InvestimentoSolo}

E adiciono novo Registro de Preço para Investimento > Solo
    Wait Until Element Is Visible    ${Botao_AdicionarRegistroConfig}
    Click Element                    ${Botao_AdicionarRegistroConfig}
    Sleep    1s
    
E altero informações de Preço para Investimento > Solo
    Wait Until Element Is Visible    ${input_FaixaInicial}
    Input Text                       ${input_FaixaInicial}    ${valorteste}
    Input Text                       ${input_FaixaFinal}      ${valorteste}
    

E restauro informações originais de Preço para Investimento > Solo
    Wait Until Page Contains         text=Registro atualizado com sucesso!
    Sleep    5s
    Wait Until Element Is Visible        ${Botao_PrecoInvestimento}
    Click Element                        ${Botao_PrecoInvestimento}
    Click Element                        ${Botao_InvestimentoSolo}
    Execute Javascript                   window.scrollTo(0, document.body.scrollHeight)
    Click Element                        (//button[normalize-space()='Remover'])[20]


    Wait Until Element Is Not Visible    ${input_FaixaInicial}
    Click Element                        ${botao_AtualizarConfig}

# -10.05.01
Dado que clico no menu "Configurações > Sistema"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Sleep    1s
    Click Element                    ${Menu_ConfigSistema}

E clico em Logo
    Wait Until Element Is Visible    //button[normalize-space(text())='Logo']
    Click Element                    //button[normalize-space(text())='Logo']

Então sistema exibe informações de menu Sistema > Logo
    Wait Until Page Contains    text=Gerenciar informações cadastradas no sistema.

# -10.05.02
Quando faço upload no campo de Logo
    Wait Until Element Is Visible    //input[@id='logo']
    Choose File                      //input[@id='logo']    C:\\Users\\silva\\Documents\\logoIsolar.png

E clico em "Salvar" Logo
    Wait Until Element Is Visible    ${Botao_SalvarConfig}
    Click Element                    ${Botao_SalvarConfig}

Então sistema atualiza logo do sistema
    Wait Until Page Contains    text=Logo atualizado com sucesso!
    Wait Until Element Is Not Visible    (//img[@class='my-8 w-60 object-cover'])[1]

# -10.05.03
Dado que clico no menu "Configurações > Sistema > Mensagens padrão"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Click Element                    ${Menu_ConfigSistema}

E clico em Mensagens padrão
    Wait Until Element Is Visible    //button[normalize-space()='Mensagens padrão']
    Click Element                    //button[normalize-space()='Mensagens padrão']

Quando faço edição do campo de Mensagens padrão
    Sleep    1s
    Wait Until Element Is Visible     //textarea[@id='whatsapp']
    Input Text                        //textarea[@id='whatsapp']    ${valorteste}
    Input Text                        //textarea[@id='email']       ${valorteste}
    Sleep    1s

E clico em "Salvar" Mensagens padrão
    Wait Until Element Is Visible    ${Botao_SalvarMensagensConfig}
    Click Element                    ${Botao_SalvarMensagensConfig}
    
Então sistema atualiza Mensagens padrão do sistema
    Wait Until Page Contains    text=Registro atualizado com sucesso!

# -10.05.04
Quando restauro Mensagens padrão original
    Sleep    1s
    Wait Until Element Is Visible     //textarea[@id='whatsapp']
    Input Text                        //textarea[@id='whatsapp']    ${Original_MensagemWhatsapp}
    Input Text                        //textarea[@id='email']       ${Original_MensagemEmail}
    Sleep    1s

# -10.05.05
E clico em Histórico das requisições
    Wait Until Element Is Visible    (//button[normalize-space()='Histórico'])[1]
    Click Element                    (//button[normalize-space()='Histórico'])[1]
    # Sleep    20s
    Wait Until Element Is Visible    ${Botao_Proximo_Requisicoes}    timeout=30s

Então sistema exibe informações de menu Sistema > Histórico das requisições
    Wait Until Page Contains    text=Informações referentes aos registros de histórico das requisições.

# -10.05.06
E preencho filtro responsável
    Wait Until Element Is Visible    //input[@id='responsavel']
    Input Text                       //input[@id='responsavel']    teste
    Sleep    0.5s

Então sistema exibe informações de filtro Responsável em Histórico das requisições
    Wait Until Element Is Visible    (//td[@class='p-4 align-middle [&:has([role=checkbox])]:pr-0 font-medium'])[1]

# -10.05.07
E preencho filtro Requisição
    Wait Until Element Is Visible    //input[@id='requisicaoId']
    Input Text                       //input[@id='requisicaoId']    1732
    Sleep    0.5s


Então sistema exibe informações de filtro Requisição em Histórico das requisições
    Wait Until Element Is Visible    (//td[@class='p-4 align-middle [&:has([role=checkbox])]:pr-0 font-medium'])[1]

# -10.05.07
E seleciono filtro Tipo de registro
    Wait Until Element Is Visible    //button[@role='combobox']
    Click Element                    //button[@role='combobox']
    Wait Until Element Is Visible    (//div[@role='option'])[4]
    Click Element                    (//div[@role='option'])[4]
    Sleep    0.5s

Então sistema exibe informações de filtro Tipo de registro em Histórico das requisições
    Wait Until Page Contains    text=renovada

# -10.05.08
E seleciono filtro Data do registro
    Wait Until Element Is Visible    ${filtro_DataRegistroRequisicoes}
    Click Element                    ${filtro_DataRegistroRequisicoes}
    FOR     ${i}    IN RANGE     3
        Click Element                (//button[@name='previous-month'])[1]
        Sleep    0.5s
    END
    Sleep        1s
    Click Element                    (//button[@name='day'][normalize-space()='8'])[1]
    Sleep        0.5s
    # Click Element                    ${filtro_DataRegistroRequisicoes}
    # Sleep        0.5s

Então sistema exibe informações de filtro Data do registro em Histórico das requisições
    Wait Until Element Is Visible    (//td[normalize-space()='08/05/2025'])[1]

# -10.05.10
E clico no botão visualizar
    Wait Until Element Is Visible    ${Botao_VisualizarConfig}
    Click Element                    ${Botao_VisualizarConfig}

Então sistema visualiza informações de requisições
    Wait Until Page Contains    text=Histórico da requisição de Nº 1732

# -10.05.11
E clico no botão Próximo
    Wait Until Element Is Visible    ${Botao_Proximo_Requisicoes}
    Click Element                    ${Botao_Proximo_Requisicoes}

Então sistema exibe informações de próxima tela
    Wait Until Element Is Visible    ${Botao_Anterior}    timeout=20s

# -10.05.12
E clico no botão Anterior    
    Sleep    30s
    Wait Until Element Is Visible    ${Botao_Anterior}
    Click Element                    ${Botao_Anterior}

Então sistema exibe informações de tela anterior
    Wait Until Element Is Not Visible    ${Botao_Anterior}    timeout=20s
    
    
# -10.06.01
Dado que clico no menu "Configurações > Monitoramento"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Sleep    1s
    Click Element                    ${Menu_ConfigMonitoramento}
    Sleep    3s
Então sistema exibe informações de menu Configurações > Monitoramento
    Wait Until Page Contains    text=Gerenciar informações de monitoramento referente aos clientes

# -10.06.02
Quando clico no filtro busca
    FOR    ${i}    IN RANGE    20
        ${status}=        Run Keyword And Return Status    Element Should Be Visible    ${filtro_buscarConfig}
        Sleep    20s
        Exit For Loop If    ${status}
    END
    Wait Until Element Is Visible   ${filtro_buscarConfig}    
    Click Element                   ${filtro_buscarConfig}    

E preencho filtro busca
    Wait Until Element Is Visible    ${input_buscar}
    Input Text                       ${input_buscar}    teste123

Então sistema exibe informações de filtro de busca
    Wait Until Element Is Visible    //p[@class="status ? hover:untruncate : ''] min-h-8 max-w-[70%] truncate hover:animate-marquee"]

# -10.06.03
Então sistema exibe informações de quantidade preenchida
    Click Element    (//div[contains(.,'Quantidade')])[10]
    Sleep    5s
    ${resultados}    Get WebElements    xpath=//tr[contains(@class, 'border-b transition-colors')]
    ${quantidade}    Get Length    ${resultados}
    Should Be Equal As Numbers    ${quantidade - 1}    ${EXPECTED_RESULTS}

E seleciono opção Cards ou Lista "Lista"
    Wait Until Element Is Visible    ${filtro_CardsLista_Documentos}
    Click Element                    ${filtro_CardsLista_Documentos}
    Click Element                    (//div[contains(.,'Lista')])[5]
    
# -10.06.05
E preencho informações de dados
# 1
    Wait Until Element Is Visible    //input[@id='nome_cliente']
    Input Text                       //input[@id='nome_cliente']      ${nome_pesquisa_GruposConsumidores}
    Input Text                       //input[@id='marca']             ${nome_pesquisa_GruposConsumidores}
    Input Text                       //input[@id='modelo']            ${nome_pesquisa_GruposConsumidores}
    Input Text                       //input[@id='ip']                ${ValorPadrao_IP}
    Input Text                       //input[@id='porta']             80
    Input Text                       //input[@id='usuario']           ${emailteste}
    Input Text                       //input[@id='senha']             ${SenhaLocal}
    Click Element                    //button[@role='combobox']
    Click Element                    (//div[@role='option'])[1]
# 2
    Wait Until Element Is Visible    //input[@id='nome_dispositivo']
    Input Text                       //input[@id='nome_dispositivo']  ${nome_pesquisa_GruposConsumidores}
    Input Text                       //input[@id='ip_dispositivo']    ${ValorPadrao_IP}
    Input Text                       //input[@id='tempo_execucao']    15
    
Então sistema realiza inserção de novo cliente em Configurações > Monitoramento
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -10.06.06
E preencho filtro busca em configurações
    Wait Until Element Is Visible    ${input_buscar}
    Input Text                       ${input_buscar}    ${nome_pesquisa_GruposConsumidores}
    Sleep    1s
    Wait Until Element Is Visible    (//h3[normalize-space()='B3 (teste)'])[1]

E preencho filtro de busca em configurações
    Wait Until Element Is Visible    ${input_buscar}
    Input Text                       ${input_buscar}    teste123

E edito dados de cliente
    Sleep    1s
    Execute Javascript                   window.scrollTo(0, document.body.scrollHeight)
    Sleep    1s
    Wait Until Element Is Visible        (//input[@id='tempo_execucao-46'])[1]
    Input Text                           (//input[@id='tempo_execucao-46'])[1]    20


Então sistema realiza edição de novo cliente em Configurações > Monitoramento
    Wait Until Page Contains    text=Informações atualizadas com sucesso!
    Sleep    5s
#   E atualizo informação para teste posterior
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Sleep    1s
    Click Element                    ${Menu_ConfigMonitoramento}
    Sleep    4s
    Wait Until Element Is Visible   ${filtro_buscarConfig}
    Click Element                   ${filtro_buscarConfig}
    Wait Until Element Is Visible    ${input_buscar}
    Input Text                       ${input_buscar}    teste123
    Wait Until Element Is Visible    ${Btn_Buscar}
    Click Element                    ${Btn_Buscar} 
    Wait Until Element Is Visible    ${botao_Editar_Configuracoes}
    Click Element                    ${botao_Editar_Configuracoes}
    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='tempo_execucao-46'])[1]
    Input Text                       (//input[@id='tempo_execucao-46'])[1]    10
    Wait Until Element Is Visible    ${botao_AtualizarConfig}
    Click Element                    ${botao_AtualizarConfig}
# -10.06.07
Então sistema realiza exclusão de novo cliente em Configurações > Monitoramento
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -10.07.01
Dado que clico no menu "Configurações > Obras"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Sleep    1s
    Click Element                    ${Menu_ConfigObras}

Então sistema exibe informações de menu Configurações > Obras
    Wait Until Page Contains    text=Preencha os campos abaixo e clique em confirmar para cadastrar as informações.

# -10.07.02
E preencho informações de Novo tipo de Requisições
    Wait Until Element Is Visible    //input[@id='nomeRequisicao']
    Sleep    2s
    Input Text                       //input[@id='nomeRequisicao']    ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${botao_ExcluirSecao}
    Sleep    1s

Então sistema exibe informações de menu botao Novo tipo
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -10.07.03
E preencho informações de pesquisa em Configurações > Obras
    Input Text    //input[@placeholder='Buscar...']    padrão
    Sleep    1s
    Wait Until Page Contains    text=padrão

E edito informações de tipo de requisição em Configurações > Obras
    Sleep    2s
    Wait Until Element Is Visible    //input[@id='nomeRequisicao']
    Sleep    1s
    Input Text                       //input[@id='nomeRequisicao']    ${nome_pesquisa_GruposConsumidores}
    Sleep    2s
    Click Element                    ${botao_ExcluirSecao}
    Sleep    1s

# -10.07.04
E preencho filtro busca em Configurações > Obras
    Wait Until Element Is Visible    ${input_buscar}
    Input Text                       ${input_buscar}    VISITA INSTALAÇĀO

Então sistema exibe informações de filtro de busca em Configurações > Obras
    Wait Until Element Is Visible    //h3[normalize-space()='VISITA INSTALAÇĀO']

# -10.07.05
Então sistema exibe informações de tela de Perguntas
    Wait Until Page Contains    text=Preencha os campos abaixo e clique em confirmar para cadastrar as informações.

# -10.08.01
Dado que clico no menu "Configurações > Contratos"
    Wait Until Element Is Visible    ${MENU_CONFIGURACOES}
    Click Element                    ${MENU_CONFIGURACOES}
    Sleep    1s
    Click Element                    ${Menu_ConfigContratos}

Então sistema exibe informações de menu Configurações > Contratos
    Wait Until Page Contains    text=Preencha os campos abaixo e clique em atualizar para atualizar as informações.


# -10.08.01
