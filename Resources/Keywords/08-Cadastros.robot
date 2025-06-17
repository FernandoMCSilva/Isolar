*** Settings ***
Documentation      Modúlo que Gerencie informações cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_Pessoas}                   //a[contains(.,'Pessoas')]
${Menu_Clientes}                  //a[contains(.,'Clientes')]
${Menu_Grupos_Consumidores}       //a[contains(.,'Grupos Consumidores')]
${Menu_Tipo_de_Gerador}           //a[contains(.,'Tipo de Gerador')]
${Menu_Tipo_de_Financiamento}     //a[contains(.,'Tipo de Financiamento')]
${Menu_Classificacoes}            //a[contains(.,'Classificações')]
${Menu_Motivos_de_Urgencia}       //a[contains(.,'Motivos de Urgência')]
${Menu_Concessionarias}           //a[contains(.,'Concessionárias')]
${Menu_Departamentos}             //a[contains(.,'Departamentos')]
${Menu_Origem_da_Indicacao}       //a[contains(.,'Origem da indicação')]
${Menu_Empresas}                  //a[contains(.,'Empresas')]
${Menu_UsuarioZapSign}            //p[contains(.,'Usuários ZapSign')]
${Menu_CargosFuncoes}             //a[contains(.,'Cargos e Funções')]
${Menu_LinksExternos}             //a[contains(.,'Links Externos')]

${nome_pesquisa_GruposConsumidores}             B3 (teste)
${nome_pesquisa_Padrao}                         B1 (Padrão)
${nome_pesquisa_PadraoObras}                    B3 (Padrão)
${nome_pesquisa_pessoas}                        Fernando
${nome_BuscaNaoEncontrada}                      1234
${botao_buscar_CadastrosPessoas}                //button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10')]
${botao_Editar_Pessoas}                         (//a[contains(.,'Editar')])[1]
${botao_Excluir_CadastrosPessoas}               //button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-destructive text-destructive-foreground hover:bg-destructive/90 h-10 px-4 py-2')]
${botao_continuar_Excluir}                      //button[contains(.,'Continuar')]
${botao_Cancelar}                               //button[contains(.,'Cancelar')]
${botao_salvar_CadastrosPessoas}                //button[contains(.,'Salvar')]
${botao_Excluir_CadastrosGruposConsumidores}    //button[contains(.,'Excluir')]
${botao_atualizar_CadastrosPessoas}             //button[contains(.,'Atualizar')]
${botao_acoes_Clientes}                         //button[contains(.,'Ações')]
${botao_Editar_Clientes}                        //button[contains(.,'Editar')]
${botao_SalvarCadastro_Clientes}                //button[contains(.,'Salvar')]
${botao_acoes_Pessoas}                          //button[contains(.,'Ações')]
${botao_acoes1LinksExternos}                    (//button[contains(.,'Ações')])[5]
${botao_acoes2LinksExternos}                    (//button[contains(.,'Ações')])[2]
${botao_ExportarExcelLinksExternos}             //button[contains(.,'Exportar para Excel')]
${botao_buscarPerguntas}                        //button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10']


${input_buscar_CadastrosPessoas}                //input[contains(@placeholder,'Buscar...')]
${input_descricao_GruposConsumidores}           //input[@id='descricao']
${input_buscar_GruposConsumidores}              xpath=//input[contains(@class, 'flex h-10')]
${input_NomeCompleto_Clientes}                  //input[@id='nome']
${input_CPF_Clientes}                           //input[@id='cpfCnpj']
${input_CEP_Clientes}                           //input[@id='cep']
${input_Telefone_Clientes}                      //input[@id='telefone']
${input_AtividadeEconomica_Clientes}            //input[@id='atividadeEconomica']
${input_AtividadeEconomica_EditarClientes}      //input[contains(@name,'atividade_economica')]
${input_NomeInserirEmpresas}                    //input[@placeholder='Insira o nome']
${input_DescricaoEmpresas}                      //input[@placeholder='Insira a descrição']
${input_NomeUsuarioZapSign}                     //input[@placeholder='Nome completo']
${input_TokenUsuarioZapSign}                    //input[@placeholder='Ex: 66587esas-4388-3ba7428db54c']
${input_NomeCargosFuncoes}                      //input[@id='nome']
${input_DescricaoCargosFuncoes}                 //textarea[@id='descricao']
${input_BuscarLinksExternos}                    //input[@placeholder='Buscar...']
${input_Telefone_Cadastros}                     (//input[@id='telefone'])[1]
${input_Email_Cadastros}                        (//input[@id='email'])[1]


${filtro_cards/Lista}                           (//button[contains(@type,'button')])[9]
${filtro_botaoLista}                            xpath=//div[@role='option'][contains(.,'Lista')]

*** Keywords ***
# -08.01.01
Dado que clico no menu "Cadastros > Pessoas"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Sleep    2s
    Click Element                    ${Menu_Pessoas}
Então sistema exibe informações de cadastro de "Pessoas"
    Wait Until Page Contains     text=Pessoas

# -08.01.02
Quando clico no botão "Inserir"
    Sleep    2s
    Wait Until Element Is Visible    //button[contains(.,'Inserir')]
    Click Element    //button[contains(.,'Inserir')]

# -08.01.03
Quando clico em "Excluir"
    Sleep    2s
    Click Element                    ${botao_acoes_Clientes}
    Sleep    0.5s
    Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}
    Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}

E clico no botão "Cancelar" em "Excluir"
    Sleep    2s
    Click Element                    ${botao_Cancelar}

# -08.01.04
E clico no botao buscar
    Sleep    7s
    Click Element    ${botao_buscarPerguntas}

E clico no botão "Continuar" em "Excluir"
    Sleep    1s
    Wait Until Element Is Visible    ${botao_continuar_Excluir}
    Click Element                    ${botao_continuar_Excluir}

E preencho informações de pesquisa em Cadastros > Pessoas
    Input Text                  //input[@placeholder='Buscar...']    B1 (Padrão)
    Sleep    1s
    Wait Until Page Contains    text=B1 (Padrão)

E preencho informações de filtro buscar em cadastros
    Input Text                  //input[@placeholder='Buscar...']    teste
    Sleep    1s
    Wait Until Page Contains    text=teste

Então sistema exclui item do menu Cadastro > Pessoas
    Wait Until Page Contains    text=Registro excluído com sucesso!

Então sistema exibe informações de pesquisa em Cadastros > Pessoas
    Wait Until Page Contains    text=B1 (Padrão)
# -08.01.05
Quando clico no filtro "Cards"
    Sleep    2s
    Click Element    ${filtro_cards/Lista}

E clico em "Lista"
    Click Element    ${filtro_botaoLista}

Então sistema exibe informações com filtro "Lista" em Motivos de urgência
    Sleep    2s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Motivo')]
    Run Keyword If    ${titulo_nome}    Log    "O Título Nome está visível. Funcionou."
    ...    ELSE    Fail    "O Título Nome não está visível. Falhou."

Então sistema exibe informações com filtro "Lista"
    Sleep    2s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Nome')]


# -08.01.06
E preencho informações de pesquisa
    Input Text    //input[@placeholder='Buscar...']    ${nome_pesquisa_GruposConsumidores}
    Sleep    1s
    Wait Until Page Contains    text=B3 (teste)
    
Então sistema exibe informações de pesquisa
     ${nome_resultado}=    Get Text    //td[contains(.,'B3 (teste)')]

Então sistema exibe informações de pesquisa padrão
    Wait Until Page Contains    text=B1 (Padrão)

Então sistema exibe informações de pesquisa em cadastros
     ${nome_resultado}=    Get Text    //td[normalize-space()='teste']

# -08.01.           
E preencho informações de busca não encontrada
    Input Text    ${input_buscar_CadastrosPessoas}    ${nome_BuscaNaoEncontrada}

Então sistema exibe mensagem de erro
    Wait Until Page Contains    text=Nenhuma pessoa encontrada.

# -08.01.08
E clico em "Fechar"
    Click Element    ${botao_buscar_CadastrosPessoas}
Então sistema verifica se filtro buscar fechou
    ${filtro_buscar}=    Run Keyword And Return Status    Element Should Not Be Visible    //input[@placeholder='Buscar...']
    Run Keyword If    ${filtro_buscar}    Log    "Filtro buscar não está visível. Funcionou."
    ...    ELSE    Fail    "Filtro buscar ainda está visível. Falhou."

Então sistema exibe informações de cadastro de "Grupo Consumidores"
    Wait Until Page Contains     text=Grupos Consumidores

# -08.01.09

E clico no botao "acoes"
    Sleep    1s
    Wait Until Element Is Visible    ${botao_acoes_Clientes}
    Click Element                    ${botao_acoes_Clientes}
    
Quando clico em "Editar"
    Sleep    5s
    Wait Until Element Is Visible    ${botao_Editar_Configuracoes}    timeout=10s
    Click Element                    ${botao_Editar_Configuracoes}

E preencho informações de cadastro editado
    Wait Until Page Contains    text=Editar Informações
    Input Text        //input[@placeholder='Nome completo']    ${nome_pesquisa_GruposConsumidores}
    Input Text        //input[@placeholder='000.000.000-00']    19895982771
    Input Text        //input[@placeholder='(99) 99999-9999']    21981905892
    Input Text        //input[@placeholder='00000-000']    289901541
    Sleep    0.5s
    Click Element     xpath=//div[@role='button' and contains(@class, 'select__multi-value__remove')]
    Click Element     xpath=//div[@class='select__input-container css-o3kr9i']
    Click Element     (//div[contains(.,'Vendedor técnico')])[13]
    Click Element     (//div[contains(.,'Representante comercial')])[13]
    Click Element     xpath=//div[contains(@class, 'select__multi-value__remove')]
    Click Element     ${botao_atualizar_CadastrosPessoas}

Então sistema exibe mensagem de informações editadas
    Wait Until Page Contains    text=Informações atualizadas com sucesso!

Então sistema exibe mensagem de informações editadas em Empresas
    Wait Until Page Contains    text=Registro atualizado com sucesso!

# -08.01.09

E preencho informações de inserir novo cadastro de pessoas
    Wait Until Element Is Visible    //input[@name='Nome']    timeout=10s
    Input Text       //input[@name='Nome']   ${nome_pesquisa_GruposConsumidores}
    Input Text       //input[@name='CPF']    19895982771
    Input Text       //input[@name='Telefone']    21981905892
    Input Text       //input[@name='CEP']    28990154
    Click Element    xpath=//div[@class='select__value-container select__value-container--is-multi css-hlgwow'][contains(.,'Selecione a função')]
    Click Element    (//div[contains(.,'Vendedor técnico')])[13]
 

E clico em "Salvar"
    Sleep    2s
    Wait Until Element Is Visible    ${botao_salvar_CadastrosPessoas}
    Click Element                    ${botao_salvar_CadastrosPessoas}
    
Então sistema salva novo cadastro de pessoas
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -08.02.01
Dado que clico no menu "Cadastros > Clientes"
    Sleep    2s
    Run Keyword        Aguardo carregamento da página
    Click Element      ${MENU_CADASTROS} 
    Click Element      ${Menu_Clientes}
    
Então sistema exibe informações de cadastro de "Clientes"
    Wait Until Page Contains    text=Gerenciar informações cadastradas no sistema
    
# -08.02.02
E preencho informações de inserir novo cadastro de Clientes
    Sleep    2s
    Input Text        ${input_NomeCompleto_Clientes}          ${nome_pesquisa}
    Input Text        ${input_CPF_Clientes}                   19895982771
    Input Text        ${input_Telefone_Clientes}              99999999999
    Input Text        ${input_AtividadeEconomica_Clientes}    teste
    Input Text        ${input_CEP_Clientes}                   28990154
    Sleep    3s
Então sistema salva novo cadastro de Clientes
    # Sleep    10s
    Wait Until Page Contains    text=Cliente cadastrado com sucesso!

# -08.02.03
E preencho informações de cadastro editado no menu Cadastros > Clientes
    Sleep    2s
    Input Text        ${input_NomeCompleto_Clientes}          ${nome_pesquisa}
    Input Text        ${input_CPF_Clientes}                   19895982771
    Input Text        ${input_CEP_Clientes}                   28990154
    Input Text        ${input_Telefone_Clientes}              99999999999
    Input Text        ${input_AtividadeEconomica_EditarClientes}    teste
    Click Element     ${botao_atualizar}

# -08.02.04
Então sistema exibe informações de pesquisa de Clientes
    Sleep    1s
    ${nome_resultado}=    Get Text    //td[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_GruposConsumidores}'    No Operation

# -08.02.06
Então sistema exclui item do menu Cadastro > Clientes
    Wait Until Page Contains    text= Cliente excluído com sucesso!

# -08.02.08
E preencho informações de busca não escontrada em Clientes
    Input Text    ${input_buscar_GruposConsumidores}    ${nome_BuscaNaoEncontrada}

Então sistema exibe mensagem de erro em Clientes
    Wait Until Page Contains    text=Nenhum cliente encontrado.

# -08.02.01
# -08.03.01
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
    Click Element    //button[contains(@id,'grupo')]
    Click Element    (//div[contains(@role,'option')])[3]
    Input Text    //input[contains(@type,'text')]    1234

Então sistema exclui item do menu Cadastro > Grupos Consumidores
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -08.03.02
E preencho informações de busca não escontrada em Grupos Consumidores
    Input Text    ${input_buscar_GruposConsumidores}    ${nome_BuscaNaoEncontrada}

Então sistema exibe mensagem de erro em Grupos Consumidores
    Wait Until Page Contains    text=Nenhum grupo consumidor encontrado.

# -08.03.04
Então sistema exibe informações de pesquisa de Grupos Consumidores
    ${nome_resultado}=    Get Text    //td[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_GruposConsumidores}'    No Operation

# -08.04.01
Dado que clico no menu "Cadastros > Tipo de Gerador"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Sleep    2s
    Click Element                    ${Menu_Tipo_de_Gerador}
Então sistema exibe informações de cadastro de "Tipo de Gerador"
    Wait Until Page Contains     text=Tipos de Gerador
    
# -08.04.02

E preencho informações de inserir novo cadastro de Tipo de Gerador
    Sleep    2s
    Input Text    ${input_descricao_GruposConsumidores}    ${nome_pesquisa_GruposConsumidores}
    
# -08.04.03
E preencho informações de cadastro editado em Tipo de Gerador
    Sleep    2s
    Input Text    //input[@id='descricao']    ${nome_pesquisa_GruposConsumidores}
    Click Element    ${botao_atualizar_CadastrosPessoas}

# -08.04.04
Então sistema exclui item do menu Cadastro > Tipo de Gerador
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -08.04.06
Então sistema exibe informações de pesquisa de Tipo de Gerador
    ${nome_resultado}=    Get Text    //td[contains(.,'B3 (teste)')]
    Run Keyword If    '${nome_resultado}' == '${nome_pesquisa_GruposConsumidores}'    No Operation

# -08.04.07
Então sistema exibe mensagem de erro em Tipo de Gerador
    Wait Until Page Contains    text=Nenhum tipo de gerador encontrado.

# -08.05.01
Dado que clico no menu "Cadastros > Tipo de Financiamento"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Sleep    2s
    Click Element                    ${Menu_Tipo_de_Financiamento}
Então sistema exibe informações de cadastro de "Tipo de Financiamento"
    Wait Until Page Contains     text=Tipos de Financiamento

# -08.05.08
Então sistema exibe mensagem de erro de Tipo de Financiamento
    Wait Until Page Contains    text=Nenhum tipo de financiamento encontrado

# -08.06.01
Dado que clico no menu "Cadastros > Classificações"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Classificacoes}
Então sistema exibe informações de cadastro de "Classificações"
    Wait Until Page Contains     text=Classificações

# -08.06.08
Então sistema exibe mensagem de erro de Classificações
    Wait Until Page Contains    text=Nenhum classificação encontrada.

# -08.07.01
Dado que clico no menu "Cadastros > Motivos de Urgência"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Motivos_de_Urgencia}
Então sistema exibe informações de cadastro de "Motivos de Urgência"
    Wait Until Page Contains     text=Motivos de Urgência
 
# -08.07.02
E preencho informações de inserir novo cadastro de Motivos de Urgência
    Sleep    2s
    Input Text    //input[@id='descricao']    ${nome_pesquisa_GruposConsumidores}
    Click Element    //button[@id='nivel']
    Click Element    (//div[@role='option'])[2]

# -08.07.08
E preencho informações de busca não encontrada em Motivo de Urgência
    Input Text    //input[@type='text']    ${nome_BuscaNaoEncontrada}
Então sistema exibe mensagem de erro de Motivos de Urgência
    Wait Until Page Contains    text=Nenhum motivo de urgência encontrada.

# -08.08.01
Dado que clico no menu "Cadastros > Concessionárias"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Concessionarias}
Então sistema exibe informações de cadastro de "Concessionárias"
    Wait Until Page Contains     text=Concessionárias

# -08.08.02
E preencho informações de inserir novo cadastro de Concessionárias
    Sleep    2s
    Input Text    //input[@id='descricao']    ${nome_pesquisa_GruposConsumidores}
    Input Text    //input[@id='icms']   ${nome_BuscaNaoEncontrada}
    Input Text    //input[@id='pis']    ${nome_BuscaNaoEncontrada}
    Input Text    //input[@id='taxa_min']    ${nome_BuscaNaoEncontrada}
    Input Text    //input[@id='cofins']    ${nome_BuscaNaoEncontrada}
    Input Text    (//input[@type='text'])[2]    ${nome_BuscaNaoEncontrada}

# -08.08.03
E preencho informações de cadastro editado em Concessionárias
    Sleep    2s
    Input Text    //input[@id='descricao']    ${nome_pesquisa_GruposConsumidores}
    Input Text    //input[@id='icms']   4321
    Input Text    //input[@id='pis']    4321
    Input Text    //input[@id='taxa_min']    4321
    Input Text    //input[@id='cofins']    4321
    Click Element    ${botao_atualizar_CadastrosPessoas}

# -08.08.08
Então sistema exibe mensagem de erro de Concessionárias
    Wait Until Page Contains    text=Nenhuma concessionaria encontrada.

# -08.09.01
Dado que clico no menu "Cadastros > Departamentos"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Departamentos}

Então sistema exibe informações de cadastro de "Departamentos"
    Wait Until Page Contains     text=Departamentos

# -08.09.02
E preencho informações de inserir novo cadastro de Departamentos
    Sleep    4s
    Input Text        //input[@id='nome']         ${nome_pesquisa_GruposConsumidores}
    Input Text        //input[@id='descricao']    ${nome_pesquisa_GruposConsumidores}
    Click Element    (//div[contains(.,'Selecione as requisições')])[13]
    Click Element    (//div[contains(.,'Técnico')])[14]
    Sleep            0.3s
    Click Element    (//input[@value='B3 (teste)'])[2]
    Click Element    (//div[contains(.,'Selecione as empresas')])[13]
    Sleep            0.3s
    Click Element    (//div[contains(.,'Isolar Energy')])[14]
    Sleep            3s
    Click Element    //button[contains(.,'Próximo')]

# -08.09.03
E preencho informações de cadastro editado em Departamentos
    Sleep    2.5s
    Input Text        //input[@id='nome']    ${nome_pesquisa_GruposConsumidores}
    Input Text        //input[@id='descricao']    ${nome_pesquisa_GruposConsumidores}
    Click Element    (//div[contains(.,'Técnico')])[13]
    Click Element    (//div[contains(.,'Pós Venda')])[14]
    Click Element    (//input[@value='B3 (teste)'])[2]
    Sleep    0.3s
    Click Element    //button[contains(.,'Próximo')]
    Sleep    1s
    # Execute JavaScript    window.scrollBy(0, 500);
    Click Element    ${botao_Salvar}

# -08.09.08
Então sistema exibe mensagem de erro de Departamentos
    Wait Until Page Contains    text=Nenhum departamento encontrado.

# -08.10.01
Dado que clico no menu "Cadastros > Origem da Indicação"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Origem_da_Indicacao}
Então sistema exibe informações de cadastro de "Origem de indicação"
    Wait Until Page Contains     text=Origem de indicação

# -08.10.02
E preencho informações de inserir novo cadastro de Origem da indicação
    Sleep    2s
    Input Text    //input[@id='nome']    ${nome_pesquisa_GruposConsumidores}

# -08.10.03
E preencho informações de cadastro editado em Origem da indicação
    Sleep    5s
    Input Text    //input[@id='nome']    ${nome_pesquisa_GruposConsumidores}
    Click Element    //button[contains(.,'Atualizar')]
    
# -08.10.08
Então sistema exibe mensagem de erro de Origem da indicação
    Wait Until Page Contains    text=Nenhuma fonte de origem encontrado.

# -08.11.01
Dado que clico no menu "Cadastros > Empresas"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_Empresas}
Então sistema exibe informações de cadastro de "Empresas"
    Wait Until Page Contains    text=Empresas

Então sistema exibe mensagem de erro de Empresas
    Wait Until Page Contains    text=Nenhum segmento encontrado.

# -08.11.02
E preencho informações de inserir novo cadastro de Empresas
    Sleep    2s
    Wait Until Element Is Visible    ${input_NomeInserirEmpresas}
    Input Text                       ${input_NomeInserirEmpresas}    ${nome_pesquisa_GruposConsumidores}

    Input Text                       ${input_DescricaoEmpresas}      ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${Botao_Proximo_Requisicoes}
    Sleep    1s
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    3s
Então sistema salva novo cadastro de Empresas
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -08.11.03
E preencho informações de cadastro editado em Empresas
    Sleep    3s
    Input Text                       ${input_NomeInserirEmpresas}    ${nome_pesquisa_GruposConsumidores}
    Input Text                       ${input_DescricaoEmpresas}      ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${Botao_Proximo_Requisicoes}
    Execute Javascript               window.scrollTo(0,0)
    Click Element                    ${botao_Salvar}

# -08.12.01
Dado que clico no menu "Cadastros > Usuários ZapSign"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_UsuarioZapSign}

Então sistema exibe informações de cadastro de "Usuários ZapSign"
    Wait Until Page Contains    text=Usuários ZapSign

# -08.12.01
E preencho informações de inserir novo cadastro de Usuários ZapSign
    Wait Until Element Is Visible    ${input_NomeUsuarioZapSign}
    Input Text                       ${input_NomeUsuarioZapSign}    ${nome_pesquisa_GruposConsumidores}
    Input Text                       ${input_Telefone_Cadastros}    21981905892
    Input Text                       ${input_Email_Cadastros}       teste123@gmail.com
    Input Text                       ${input_TokenUsuarioZapSign}   ${nome_pesquisa_GruposConsumidores}

Então sistema salva novo cadastro de Usuários ZapSign
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -08.12.03
E preencho informações de cadastro editado em Usuários ZapSign
    Wait Until Element Is Visible    ${input_NomeUsuarioZapSign}
    Input Text                       ${input_NomeUsuarioZapSign}    ${nome_pesquisa_GruposConsumidores}
    Input Text                       ${input_TokenUsuarioZapSign}   ${nome_pesquisa_GruposConsumidores}
    Sleep    1s
    Click Element                    ${botao_atualizar_CadastrosPessoas}
    Sleep    1s

# -08.12.05
Quando clico em "Excluir" Usuário ZapSign
    Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}
    Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}
# -08.12.06
Então sistema exclui item do menu Cadastro > Usuários ZapSign
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -08.12.08
Então sistema exibe mensagem de erro de Usuários ZapSign
    Wait Until Page Contains    text=Nenhum usuário zapsing encontrado.

# -08.13.01
Dado que clico no menu "Cadastros > Cargos e Funções"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_CargosFuncoes}

Então sistema exibe informações de cadastro de "Cargos e Funções"
    Wait Until Page Contains    text=Cargos e funções

# -08.13.02
E preencho informações de inserir novo cadastro de Cargos e Funções
    Sleep    2s
    Input Text                       ${input_NomeCargosFuncoes}         ${nome_pesquisa_GruposConsumidores}
    Click Element                    //button[contains(.,'Selecione')]
    Click Element                    (//div[contains(.,'Técnico')])[15]
    Sleep    1s
    Input Text                       ${input_DescricaoCargosFuncoes}    ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${Botao_Proximo_Requisicoes}
Então sistema salva novo cadastro de Cargos e Funções
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -08.13.03
E preencho informações de cadastro editado em Cargos e Funções
    Sleep    2s
    Input Text                       ${input_NomeCargosFuncoes}    ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${Botao_Proximo_Requisicoes}

# -08.13.06
Então sistema exclui item do menu Cadastro > Cargos e Funções
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -08.13.07
Então sistema exibe informações com filtro "Lista" em Cargos e Funções
    Sleep    2s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Cargo/Função')]
    Run Keyword If    ${titulo_nome}    Log    "O Título Nome está visível. Funcionou."
    ...    ELSE    Fail    "O Título Nome não está visível. Falhou."

# -08.13.08
Então sistema exibe mensagem de erro de Cargos e Funções
    Wait Until Page Contains    text=Nenhum departamento encontrado.

# -08.14.01
Dado que clico no menu "Cadastros > Links externos"
    Wait Until Element Is Visible    ${MENU_CADASTROS}
    Click Element                    ${MENU_CADASTROS}
    Click Element                    ${Menu_LinksExternos}

Então sistema exibe informações de cadastro de "Links externos"
    Wait Until Page Contains    text=Links externos

# -08.14.02
E preencho informações de busca em links externos
    Wait Until Element Is Visible    ${input_BuscarLinksExternos}
    Input Text                       ${input_BuscarLinksExternos}    123

E clico em ações 2 
    Wait Until Element Is Visible    ${botao_acoes2LinksExternos}
    Click Element                    ${botao_acoes2LinksExternos}

E preencho informações de cadastro editado em links externos
    Wait Until Element Is Visible    //input[@id='uc']
    Input Text                       //input[@id='uc']    123
    Click Element                    ${Botao_Proximo_Requisicoes}
    Sleep    1s
    Click Element                    ${Botao_Proximo_Requisicoes}
    Sleep    1s
    Click Element                    ${botao_Salvar}

# -08.14.03
E preencho informações de pesquisa em links externos
    Wait Until Element Is Visible    //input[@placeholder='Buscar...']
    Input Text                       //input[@placeholder='Buscar...']    222

Então sistema exibe informações de pesquisa em links externos
     ${nome_resultado}=    Get Text    //td[normalize-space(text())='222']

# -08.14.04
Quando clico em "Excluir" em Links externos
    Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}   
    Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}

# -08.14.06
Então sistema exibe informações com filtro "Lista" em Links externos
    Sleep    2s
    ${titulo_nome}=    Run Keyword And Return Status    Element Should Be Visible    //th[contains(.,'Unidade consumidora')]
    Run Keyword If    ${titulo_nome}    Log    "O Título Nome está visível. Funcionou."
    ...    ELSE    Fail    "O Título Nome não está visível. Falhou."

# -08.14.07
Então sistema exibe mensagem de erro de Links externos
    Wait Until Page Contains    text=Nenhum segmento encontrado.

# -08.14.09
Quando clico no botão Exportar para Excel em Links externos 
    Wait Until Element Is Visible    ${botao_ExportarExcelLinksExternos}
    Click Element                    ${botao_ExportarExcelLinksExternos}
    
# -08.14.03