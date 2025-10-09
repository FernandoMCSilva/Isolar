*** Settings ***
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_ObrasDashboard}                 //a[contains(.,'Dashboard')]
${Menu_ObrasRequisicoes}               (//a[@class='inline-flex items-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground px-4 py-2 w-full justify-center h-10 mb-1'])[2]

${filtro_Departamento_Obras}           (//div[contains(.,'OBRAS')])[5]
${filtro_NivelUrgencia}                //button[@id='nivel_urgencia']

${Input_Trello}                        //input[@placeholder='Cole o link do trello']

${STATUS_CONCLUIDO}                    (//div[@class='inline-flex items-center border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent text-primary-foreground rounded-md bg-green-400 hover:bg-green-300 text-center'])[1]
${STATUS_FILA}                         (//div[@class='inline-flex items-center border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80 rounded-md text-center'])[1]
${Botao_EditarObras}                   (//button)[22]

${opcao_departamentoObras}             (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full my-2'])[1]

*** Keywords ***                
# -3.1.1
Dado que clico no menu Obras > Dashboard
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_OBRAS}    timeout=20s
    Click Element                    ${MENU_OBRAS}
    Wait Until Element Is Visible    ${Menu_ObrasDashboard}
    Click Element                    ${Menu_ObrasDashboard}

Então sistema exibe tela de Obras > Dashboard
    Wait Until Page Contains    text=Obras
    Wait Until Page Contains    text=Gerencie um resumo das informações cadastradas no sistema.

# -3.1.6
E preencho data inicial em Obras > Dashboard
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[1]    timeout=10s
    Input Text    (//input[@placeholder='DD/MM/YYYY'])[1]    01/10/2025
    Sleep   2s

E preencho data final em Obras > Dashboard
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[2]    timeout=10s
    Input Text    (//input[contains(@placeholder,'DD/MM/YYYY')])[2]    30/10/2025

Então sistema exibe informações de filtros de data
    Wait Until Page Contains    text=2025-10

# -3.1.7
E valido filtros de departamento em Obras
    Wait Until Element Is Visible    ${Btn_Departamentos}    timeout=20s
    Click Element                    ${Btn_Departamentos}
    Wait Until Element Is Visible    ${filtro_Departamento_Obras}
    Click Element                    ${filtro_Departamento_Obras}

Então sistema exibe requisições do departamento em Obras
    Sleep    1s
    Wait Until Page Contains    text=2025-05

# -3.2.1
E volto pra tela inicial
#   E clico no menu inicio
    Sleep    4s
    Wait Until Element Is Visible    ${MENU_INICIO}    timeout=20s
    Click Element                    ${MENU_INICIO}
#   Fecho menu Obras
    Sleep    1s
    Wait Until Element Is Visible    ${MENU_OBRAS}    timeout=20s
    Click Element                    ${MENU_OBRAS}
    Sleep    1s
Dado que clico no menu Obras > Requisições
    Sleep    5s
    Wait Until Element Is Visible    ${MENU_OBRAS}    timeout=20s
    Click Element                    ${MENU_OBRAS}
    Sleep    4s
    Wait Until Element Is Visible    ${Menu_ObrasRequisicoes}    timeout=20s
    Click Element                    ${Menu_ObrasRequisicoes}
    Sleep    2s

Então sistema exibe tela de Obras > Requisições
    Wait Until Page Contains    text=Gerencie informações cadastradas no sistema.

# -3.2.2
E preencho informações no campo Cliente em Obras
    Wait Until Element Is Visible    ${Campo_Cliente}    timeout=20s
    Input Text                       ${Campo_Cliente}    B3 (Padrão)

E preencho informações de cadastro de requisição padrão
    Sleep    2s
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    
    Press Keys                       //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    B3 (Padrão)
    ${botao_novocliente}=    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Novo Cliente')]

    IF    ${botao_novocliente}
        Log    Botão 'Novo Cliente' visível. Seguir com cadastro de cliente temporário.
        Execute JavaScript    document.body.style.zoom="70%"
        Sleep    3s
        Click Element    //button[contains(.,'Novo Cliente')]
        Input Text       //input[@id='cpfCnpj']    19895982771
        Input Text       //input[@id='telefone']   21981905892
        Input Text       //input[@id='atvEco']     Residencial
        Input Text       //input[@id='cep']        28990154
        FOR    ${i}    IN RANGE    10
            ${status}=    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Salvar')]
            Exit For Loop If    ${status}
            Click Element       ${Botao_Proximo_Requisicoes}    
            Sleep    1s
        END
        Click Element    //button[contains(.,'Salvar')]

    ELSE
        Log      Cliente já cadastrado. Seguir com uso do cliente existente.
        Sleep    2s
        Press Keys    NONE    ENTER

        FOR    ${i}    IN RANGE    10
            ${status}=    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Salvar')]
            Exit For Loop If    ${status}
            Click Element       ${Botao_Proximo_Requisicoes}    
            Sleep    1s
        END
        Click Element    //button[contains(.,'Salvar')]

    END

Então sistema verifica se há requisição B3 (Padrão)
    Sleep    2s
    ${nenhuma_requisicao}=    Run Keyword And Return Status    Page Should Contain    Nenhuma requisição encontrada.
    IF    ${nenhuma_requisicao}
        Sleep    2s
        Quanto clico no botão "Inserir/Obras"
        E preencho informações de cadastro de requisição padrão
        Então sistema exibe mensagem de cadastro realizado
    ELSE
        Log    continuar...
    END

Então sistema exibe resultado do filtro em Obras
    Wait Until Page Contains    text=B3 (Padrão)

# -3.2.3
E valido filtros dentro de Departamento em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_DEPARTAMENTO}    timeout=20s
    Click Element                    ${COMBOBOX_DEPARTAMENTO}
    Wait Until Element Is Visible    (//div[contains(.,'OBRAS')])[19]
    Click Element                    (//div[contains(.,'OBRAS')])[19]
    Click Element                    ${Botao_Buscar}

Então sistema exibe resultado de Departamento
    Wait Until Element Is Visible    (//td[contains(text(),'OSEAS')])[1]

# -3.2.4
E valido todos os filtros dentro de Tipo em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_TIPO}    timeout=20s
    Click Element                    ${COMBOBOX_TIPO}
    Click Element                    (//div[contains(.,'Todos')])[21]
    Click Element                    ${Botao_Buscar}

Então sistema exibe informações do filtro Tipo
    Wait Until Element Is Visible    (//td[contains(.,'VISITA INSTALAÇĀO')])[1]


# -3.2.5
E seleciono filtro urgente "sim" em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_URGENTE}    timeout=20s
    Click Element                    ${COMBOBOX_URGENTE}
    Click Element                    (//div[contains(.,'Sim')])[5]

Então sistema exibe resultado do filtro Urgente
    Wait Until Element Is Visible    ${filtro_NivelUrgencia}
    
# -3.2.6
E valido filtro Nível Urgencia em Obras > Requisições
    Sleep    2s
    Wait Until Element Is Visible    (//button[@type='button'])[11]    timeout=20s
    Click Element                    (//button[@type='button'])[11]
    Click Element                    (//div[contains(.,'Baixo')])[5]
    Click Element                    ${Btn_Buscar}


Então sistema exibe resultado de nível de urgência    
    Sleep    1s
    Wait Until Element Is Visible    //td[contains(.,'3062')]    timeout=20s

# -3.2.7
E preencho informações de Data de entrega em Obras > Requisições
    Wait Until Element Is Visible    (//button[@id='data_entrega'])[1]    timeout=20s
    Click Element                    (//button[@id='data_entrega'])[1]
    Wait Until Element Is Visible    (//button[@name='previous-month'])[1]
    FOR    ${i}    IN RANGE    8
    Click Element       (//button[@name='previous-month'])[1]
    Sleep    0.5s
    END
    Sleep    2s
    Click Element       (//button[@name='day'][normalize-space()='1'])[1]
    Click Element       //button[contains(.,'31')]
    Sleep    1s
    Execute JavaScript    document.body.style.zoom="70%"
    Sleep    1s
    Click Element       ${Botao_Buscar} 

# -3.2.8
E preencho informações de Data de criação em Obras > Requisições
    Wait Until Element Is Visible      //button[@id='data_criacao']    timeout=20s
    Click Element                      //button[@id='data_criacao']
    Wait Until Element Is Visible    (//button[@type='button'])[16]
    FOR     ${i}    IN RANGE    8
    Click Element    (//button[@type='button'])[16]
    Sleep    0.5s
    END
    Sleep    2s
    Click Element                      (//button[@name='day'][normalize-space()='1'])[1]
    Click Element                      //button[contains(.,'31')]

    Click Element                      //button[@id='data_criacao']
    Click Element                      ${Botao_Buscar}

# -3.2.9
E valido todos os filtros dentro de "Responsável" em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_RESPONSAVEL}    timeout=20s
    Click Element                    ${COMBOBOX_RESPONSAVEL}
    Click Element                    (//div[contains(.,'OSEAS')])[14]

Então sistema exibe resultado de filtro Responsável
    Wait Until Element Is Visible    (//td[contains(text(),'OSEAS')])[1]

# -3.2.10
Quanto clico no botão "Inserir/Obras"
    Sleep    5s
    Wait Until Element Is Visible    ${Botao_Inserir_Requisicoes}    timeout=20s
    Click Element                    ${Botao_Inserir_Requisicoes}
    Sleep    1s
    Wait Until Element Is Visible    ${opcao_departamento_Obras}    timeout=20s
    Click Element                    ${opcao_departamento_Obras}
    Wait Until Element Is Visible    //button[contains(.,'VISITA INSTALAÇĀO')]    timeout=20s
    Click Element                    //button[contains(.,'VISITA INSTALAÇĀO')]

E preencho informações de cadastro de requisição em Obras
# 1
    Sleep    1s
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    timeout=10s
    Press Keys    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    ${nome_pesquisa_GruposConsumidores}
    Wait Until Element Is Visible    //button[contains(.,'Novo Cliente')]
    Click Element    //button[contains(.,'Novo Cliente')]
    Input Text    //input[@id='telefone']    12345678910
    Input Text    //input[@id='cep']    28990154
    Sleep    1s
    Click Element    ${Botao_Proximo_Requisicoes}
# 2
    Click Element    (//button[contains(.,'Selecione')])[1]
    Click Element    (//div[contains(.,'RHIVAYLTON')])[5]

    Click Element    (//button[@type='button'])[10]
    Click Element    (//div[contains(.,'Solo')])[5]

    Input Text       ${Input_Trello}    https://trello.com/u/teste123/boards
    Click Element    ${Botao_Proximo_Requisicoes}
# 3
    Input Text       //input[@placeholder='DD/MM/YYYY']    07062025
    Click Element    (//button[@type='button'])[10]
    Click Element    (//div[contains(.,'OSEAS')])[5]

    Click Element    (//button[@type='button'])[11]
    Click Element    (//div[contains(.,'Sim')])[5]

    Click Element    (//button[@type='button'])[12]
    Click Element    (//div[contains(.,'Tem Proposta de Concorrente')])[5]
    Click Element    ${botao_Salvar}

Então sistema exibe requisição inserida
    Wait Until Page Contains    text=B3 (teste)	

# -3.2.11
E preencho informações de editar requisição em Obras
    Sleep    7s
    Wait Until Element Is Visible    (//button[@id='status'])[1]    timeout=40s
    Click Element                    (//button[@id='status'])[1]
    Sleep    1s
    Click Element                    (//div[contains(.,'Concluído')])[5]
    Click Element                    //button[contains(.,'Salvar alterações')]

Então sistema conlcui edição de requisição em Obras
    Wait Until Page Contains    text=Preencha os campos abaixo e clique em atualizar para editar as informações.

# -3.2.12
E preencho filtro Cliente em Obras
    Wait Until Element Is Visible    //input[@placeholder='Nome do cliente ...']
    Input Text                       //input[@placeholder='Nome do cliente ...']    ${nome_pesquisa_PadraoObras}
    Click Element                    ${Botao_Buscar}
    Sleep    2s
    Wait Until Page Contains         text=B3 (Padrão)

# -3.2.13
Então sistema verifica se requisição está "fila" inicialmente
    Sleep    2s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    ${concluido_visivel}=    Run Keyword And Return Status    Element Should Be Visible    ${STATUS_CONCLUIDO}
    Run Keyword If    '${concluido_visivel}'=='True'    Trocar Status Para Fila

Trocar Status Para Fila
#   Clico em editar
    Sleep    2s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    ${Botao_Editar}    timeout=20s
    Sleep    1s
    Click Element                    ${Botao_Editar}

#   E troco status para fila
    Sleep    5s
    Wait Until Element Is Visible    (//button[@id='status'])[1]    timeout=20s
    Click Element                    (//button[@id='status'])[1]
    Sleep    1s
    Click Element                    (//div[contains(.,'Fila')])[5]
    Click Element                    //button[contains(.,'Salvar alterações')]

E seleciono opção "Concluído" em editar status em Obras
    Sleep    5s
    Wait Until Element Is Visible    (//button[@id='status'])[1]    timeout=20s
    Click Element                    (//button[@id='status'])[1]
    Sleep    1s
    Click Element                    (//div[contains(.,'Concluído')])[5]
    Click Element                    //button[contains(.,'Salvar alterações')]

E seleciono opção "Fila" em editar status em Obras
    Sleep    5s
    Wait Until Element Is Visible    (//button[@id='status'])[1]    timeout=20s
    Click Element                    (//button[@id='status'])[1]
    Sleep    1s
    Click Element                    (//div[contains(.,'Fila')])[5]
    Click Element                    //button[contains(.,'Salvar alterações')]

Então sitema verifica se status é Fila
    Wait Until Element Is Visible    //div[@class='inline-flex items-center border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80 rounded-md text-center']

Então sistema verifica status de Requisição em Obras
    Sleep    1.5s
    Wait Until Element Is Visible    //button[contains(.,'Concluído')]


Então sitema verifica se status é concluído
    Sleep                            1s
    Execute JavaScript               window.scrollTo(0, 0)
    Wait Until Element Is Visible    //div[@class='inline-flex items-center border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent text-primary-foreground rounded-md bg-green-400 hover:bg-green-300 text-center']

# -3.2.14
E preencho informações de comentário de requisição em Obras
    Wait Until Element Is Visible    (//button[@type='button'])[16]
    Click Element    (//button[@type='button'])[16]
    Click Element    (//button[@type='button'])[17]
    Click Element    (//button[@type='button'])[18]
    Click Element    (//button[@type='button'])[19]
    Sleep    3s
    Press Keys       NONE    B3 (teste)
    Click Element    (//button[@type='button'])[33]

# -3.2.15
E clico no botão "Excluir requisição" em Obras
    Sleep    1s
    Wait Until Page Contains    text=Editar requisição
    Execute JavaScript          window.scrollTo(0, 0)
    Sleep    5s
    Click Element               //button[contains(.,'Excluir requisição')]
    Click Element               //button[contains(.,'Continuar')]

Então sistema exclui e retorna para menu Obras > requisições 
    Wait Until Element Is Visible    (//div[@class='text-left mb-4']//div)[1]


# -3.2.16
Então sistema exibe mensagem de campos obrigatórios não preenchido em Obrasq
    Wait Until Page Contains    text=Por favor digite um CPF ou CNPJ válido.
    
# -3.2.17
Então sistema exibe mensagem de CEP não preenchido em Obras 
    Wait Until Page Contains    text=Preencha os campos obrigatórios: CEP, Estado, Cidade, Endereço




# -3.2.10