*** Settings ***
Documentation      Modúlo que Gerencie requisições cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Link_Filtros}                         //button[contains(.,'Filtros')]
${Campo_Cliente}                        //input[@id='cliente']
${Campo_Departamento}                   //div[@role='option' and contains(.,'Técnico')]
${Campo_Status}                         //div[@role='option' and contains(.,'Produção')]
${Campo_Tipo}                           //div[@role='option' and contains(.,'Técnico')]
${Campo_Urgente}                        //div[@role='option' and contains(.,'Sim')]
${Campo_Nivel_Urgencia}                 //div[@role='option' and contains(.,'Alto')]

${Botao_Buscar}                         //button[contains(.,'Buscar')]
${Botao_Editar}                         (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10')])[1]
${Botao_Visualizar}                     (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10'])[2]
${Botao_Acoes}                          (//button[@data-state='closed'])[19]
${Botao_Historico}                      (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-secondary text-secondary-foreground hover:bg-secondary/80 h-10 w-10'])[3]
${Botao_Comentarios}                    (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10'])[2]
${Botao_Acoes_Requisicoes}              (//button[@data-state='closed'])[21]
${Botao_Renovar}                        //button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-primary-foreground h-10 w-10 bg-green-500 hover:bg-green-400']
${Botao_Inserir_Requisicoes}            //button[contains(.,'Inserir')]
${Botao_Proximo_Requisicoes}            //button[contains(.,'Próximo')]
${Botao_Excluir_Requisicoes}            //button[contains(.,'Excluir requisição')]
${Botao_MudarStatusRequisicao}          (//button[@data-state='closed'])[20]

${elemento_fila}                        (//div[@class='inline-flex items-center border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80 rounded-md text-center'])[1]
${elemento_concluido}                   (//div[@class='inline-flex items-center border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent text-primary-foreground rounded-md bg-green-400 hover:bg-green-300 text-center'])[1]

${input_CPF_Requisicoes}                (//input[@id='cpfCnpj'])[1]

${Filtro_Urgente}                       (//button[contains(@type,'button')])[10]

${input_nomecompleto_Requisicoes}       //div[@class='select__value-container css-hlgwow']
${input_telefone_Requisicoes}           //input[@id='telefone']
${input_CEP_Requisicoes}                //input[@id='cep']

${Cliente_Fila}            Fernando
${Departamento_Fila}       Técnico
${Status_option}           (//div[contains(.,'Parado')])[5]
${Tipo_Fila}               Técnico

${COMBOBOX_DEPARTAMENTO}       (//button[@id='departament'])[1]
${COMBOBOX_STATUS}             //button[contains(@id,'status')]
${COMBOBOX_TIPO}               //button[@id='tipo']
${COMBOBOX_URGENTE}            //button[contains(@id,'urgente')]
${COMBOBOX_NIVEL_DE_URGENCIA}  //button[contains(@id,'nivel_urgencia')]
${COMBOBOX_RESPONSAVEL_1}      xpath=(//button[@role='combobox'])[3]
${COMBOBOX_RESPONSAVEL_2}      xpath=(//button[@role='combobox'])[2]
${COMBOBOX_RENOVADAS}          //button[contains(@id,'renovada')]
${COMBOBOX_RESPONSAVEL}         xpath=(//button[@role='combobox'])[2]


@{OPCOES_COMBOBOX_DEPARTAMENTO}     (//div[contains(.,'Comercial')])[14]    (//div[contains(.,'TI')])[5]
@{OPCOES_COMBOBOX_STATUS}           (//div[contains(.,'Fila')])[22]    (//div[contains(.,'Produção')])[5]    (//div[contains(.,'Concluído')])[22]    (//div[contains(.,'Parado')])[5]
@{OPCOES_COMBOBOX_TIPO}
# @{OPCOES_COMBOBOX_TIPO}             (//div[contains(.,'Técnico')])[14]    (//div[contains(.,'Pós Venda')])[5]    (//div[contains(.,'Compra')])[5]    (//div[contains(.,'Defeito com computador/notebook')])[5]    (//div[contains(.,'Defeito com impressora')])[5]    
# ...     (//div[contains(.,'Problemas com internet')])[5]    (//div[contains(.,'Novo Colaborador')])[5]    (//div[contains(.,'Bloqueio de Acesso a Plataforma')])[5]    (//div[contains(.,'Problema com Sistema')])[5]    
# ...    (//div[contains(.,'SERVIÇO MANUTENÇAO')])[5]    (//div[contains(.,'CERTIDAO AMBIENTAL')])[5]
@{OPCOES_COMBOBOX_URGENTE}          (//div[contains(.,'Sim')])[5]    (//div[contains(.,'Não')])[5]
@{OPCOES_COMBOBOX_NIVELDEURGENCIA}  (//div[contains(.,'Baixo')])[5]    (//div[contains(.,'Médio')])[5]    (//div[contains(.,'Alto')])[5]
@{OPCOES_COMBOBOX_RESPONSAVEL}      (//div[contains(.,'LUANA GUARNIERI')])[5]    (//div[contains(.,'Leandro Coser')])[5]    (//div[contains(.,'Lucas Cenci')])[5]    
@{OPCOES_COMBOBOX_RENOVADAS}        (//div[contains(.,'Originais')])[5]    

# ${actions}=    Get Webdriver Manager
*** Keywords ***
# --2.1
Dado que clico no menu "Requisições"
    Sleep    5s
    Wait Until Element Is Visible    ${MENU_REQUISICOES}    timeout=10s
    Click Element                    ${MENU_REQUISICOES}
    Sleep    3s

# --2.2
Quando clico em "Filtros"
    Sleep    5s
    Wait Until Element Is Visible    ${Link_Filtros}    timeout=20s
    Click Element                    ${Link_Filtros}

E preencho informações no campo Cliente
    Wait Until Element Is Visible    ${Campo_Cliente}
    Input Text                       ${Campo_Cliente}        Fernando

Então sistema exibe requisições do filtro Cliente
    Wait Until Page Contains    text=Fernando

# --2.3
E valido filtros dentro de Departamento em Requisições
    Wait Until Element Is Visible    ${COMBOBOX_DEPARTAMENTO}    timeout=12s
    Click Element    ${COMBOBOX_DEPARTAMENTO}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_DEPARTAMENTO}

    FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_DEPARTAMENTO}
            Sleep    1s
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            Sleep    1s
            # Clica no botão de buscar
            # Click Element    ${Btn_Buscar}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Sleep    1s
            Execute JavaScript    window.scrollTo(0, 0)
            Sleep    1s
            # Reabre a combobox para a próxima iteração
            Wait Until Element Is Visible    ${COMBOBOX_DEPARTAMENTO}
            Click Element                    ${COMBOBOX_DEPARTAMENTO}
        END

    # Wait Until Element Is Visible    //button[@id='departament']      10s
    # Execute JavaScript               ${Campo_Departamento}
    # Click Element                    ${Botao_Buscar}

Então sistema exibe requisições do filtro Departamento
    Wait Until Page Contains    text=Requisições

# --2.4
E valido todos os filtros dentro de Status em Requisições
    Wait Until Element Is Visible    //button[contains(@id,'status')]      10s
    Click Element                    //button[contains(@id,'status')]
    Click Element                    ${Status_option}
    Click Element                    ${Botao_Buscar}
    Sleep    2s

Então sistema exibe requisições do filtro Status
    
    Wait Until Element Is Visible    (//div[contains(.,'Parado')])[19]    timeout=10s

# --2.5
E valido todos os filtros dentro de Tipo em Requisições
    Wait Until Element Is Visible    ${COMBOBOX_TIPO}    timeout=10s
    Click Element    ${COMBOBOX_TIPO}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_TIPO}

    FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_TIPO}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Wait Until Element Is Visible    ${COMBOBOX_TIPO}
            Execute JavaScript    window.scrollTo(0, 0)
            # Reabre a combobox para a próxima iteração
            Click Element    ${COMBOBOX_TIPO}
        END

Então sistema exibe requisições do filtro Tipo
    Wait Until Page Contains    text=Requisições

# --2.6
E valido todos os filtros dentro de Urgente em Requisições
    Wait Until Element Is Visible    ${COMBOBOX_URGENTE}    timeout=10s
    Click Element    ${COMBOBOX_URGENTE}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_URGENTE}

    FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_URGENTE}
            Sleep    0.5
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            Sleep    0.5
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            Sleep    0.5
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Wait Until Element Is Visible    ${COMBOBOX_URGENTE}
            Execute JavaScript    window.scrollTo(0, 0)
            # Reabre a combobox para a próxima iteração
            Click Element    ${COMBOBOX_URGENTE}
        END


Então sistema exibe requisições do filtro Urgente
    Wait Until Page Contains    text=Requisições

# --2.7
E seleciono urgente "Sim"
    Wait Until Element Is Visible    //button[contains(@id,'urgente')]      10s
    Click Element                    //button[contains(@id,'urgente')]
    Click Element                    ${Campo_Urgente}
    Click Element                    ${Botao_Buscar}

E valido todos os filtros de Nivel de urgencia em Requisições
    Wait Until Element Is Visible    ${COMBOBOX_NIVEL_DE_URGENCIA}    timeout=10s
    Sleep    1s
    Click Element    ${COMBOBOX_NIVEL_DE_URGENCIA}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_NIVEL_DE_URGENCIA}

    FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_NIVELDEURGENCIA}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Wait Until Element Is Visible    ${COMBOBOX_NIVEL_DE_URGENCIA}
            Execute JavaScript    window.scrollTo(0, 0)
            # Reabre a combobox para a próxima iteração
            Click Element    ${COMBOBOX_NIVEL_DE_URGENCIA}
        END
# --2.8
E preencho informações de Data de entrega
    Wait Until Element Is Visible    //button[@id='data_entrega']
    Click Element                    //button[@id='data_entrega']
    Wait Until Element Is Visible    (//button[@type='button'])[44]
    FOR    ${i}    IN RANGE    3
        Click Element       (//button[@type='button'])[44]
        Sleep    1s
    END
    Sleep    2s
    Click Element                    (//button[contains(.,'1')])[1]
    Click Element                    //button[contains(.,'31')]
    Click Element                    ${Botao_Buscar} 

Então sistema exibe requisições do filtro Data de entrega
    Sleep    1s
    Wait Until Element Is Visible    (//td[normalize-space()='28/05/2025'])[1]
# --2.9
E preencho informações de Data de criação
    Wait Until Element Is Visible      //button[@id='data_criacao']
    Click Element                      //button[@id='data_criacao']

    FOR     ${i}    IN RANGE    3
    Click Element    (//button[@type='button'])[44]
    Sleep    1s
    END

    Click Element                      (//button[contains(.,'1')])[1]
    Click Element                      //button[contains(.,'31')]

    Click Element                      //button[@id='data_criacao']
    Click Element                      ${Botao_Buscar}
Então sistema exibe requisições do filtro Data de Criação
    Sleep    1s
    Wait Until Element Is Visible    (//td[normalize-space()='28/05/2025'])[1]

# --2.10
E valido todos os filtros dentro de "Responsável"
    Sleep    1s
    # Tenta encontrar o primeiro caminho
    ${combobox_existe}    Run Keyword And Return Status    Element Should Be Visible    ${COMBOBOX_RESPONSAVEL_1}    timeout=5s
    IF    ${combobox_existe}
        ${COMBOBOX_RESPONSAVEL}    Set Variable    ${COMBOBOX_RESPONSAVEL_1}
    ELSE
        ${COMBOBOX_RESPONSAVEL}    Set Variable    ${COMBOBOX_RESPONSAVEL_2}
    END

    Wait Until Element Is Visible    ${COMBOBOX_RESPONSAVEL}    timeout=10s
    Click Element    ${COMBOBOX_RESPONSAVEL}

    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    //ul[contains(@class,'dropdown')]//li

    FOR    ${departamento}    IN    @{departamentos}
        Click Element    ${departamento}
        Click Element    ${Btn_Buscar}
        Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
        ${departamento_text}    Get Text    ${departamento}
        Log    Departamento ${departamento_text} validado com sucesso

        # Reabre o combobox para próxima iteração
        Wait Until Element Is Visible    ${COMBOBOX_RESPONSAVEL}
        Click Element    ${COMBOBOX_RESPONSAVEL}
    END


Então sistema exibe requisições de filtro Responsável
    Wait Until Page Contains    text=Requisições

# --2.11
E valido filtro dentro de "Representante comercial"
    Wait Until Element Is Visible    (//button[contains(@type,'button')])[18]
    Click Element                    (//button[contains(@type,'button')])[18]
    Click Element                    (//div[contains(.,'Todos')])[23]
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições de filtro Representante comercial
    Wait Until Page Contains    text=91

# --2.12
E seleciono filtro vendedor "Todos"
    Wait Until Element Is Visible    (//button[@type='button'])[12]
    Click Element                    (//button[@type='button'])[12]
    Click Element                    (//div[contains(.,'Todos')])[23]
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições de filtro vendedor "Todos"
    Wait Until Page Contains    text=91
# --2.13
E valido todos os filtros dentro de "Renovadas"
    Wait Until Element Is Visible    ${COMBOBOX_RENOVADAS}    timeout=10s
    Click Element    ${COMBOBOX_RENOVADAS}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_RENOVADAS}

    FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_RENOVADAS}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Wait Until Element Is Visible    ${COMBOBOX_RENOVADAS}
            # Reabre a combobox para a próxima iteração
            Click Element    ${COMBOBOX_RENOVADAS}
        END

Então sistema exibe requisições de filtro Renovadas
    Wait Until Page Contains    text=Requisições

# --2.14
Quando clico no botão "Inserir/Técnico"
    Wait Until Element Is Visible    ${Botao_Inserir_Requisicoes}
    Sleep    1s
    Click Element                    ${Botao_Inserir_Requisicoes}
    Wait Until Element Is Visible    //button[contains(.,'Técnico')]
    Click Element                    //button[contains(.,'Técnico')]
    Wait Until Element Is Visible    //button[contains(.,'Técnico')]
    Click Element                    //button[contains(.,'Técnico')]

E preencho informações de cadastro de requisição
# 1
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    timeout=10s
    Press Keys                       //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    ${nome_pesquisa_GruposConsumidores}
    Sleep    1s
    Wait Until Element Is Visible    //button[contains(.,'Novo Cliente')]
    Click Element                    //button[contains(.,'Novo Cliente')]
    Input Text                       //input[@id='cpfCnpj']    19895982771
    Input Text                       //input[@id='telefone']    21981905892
    Input Text                       //input[@id='atvEco']    Residencial
    Input Text                       //input[@id='cep']    28990154
    Sleep    1s
    Click Element                    ${Botao_Proximo_Requisicoes}
# 2
    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'RHIVAYLTON')])[5]

    # Click Element                    (//button[@role='combobox'])[2]
    # Wait Until Element Is Visible    (//div[@class='flex flex-wrap w-full p-2 gap-8 ml-4'])[1]
    # Click Element                    (//div[@class='flex flex-wrap w-full p-2 gap-8 ml-4'])[1]

    Click Element                    (//button[@role='combobox'])[3]
    Wait Until Element Is Visible    (//div[contains(.,'RHIVAYLTON')])[15]
    Click Element                    (//div[contains(.,'RHIVAYLTON')])[15]

    Click Element                    (//button[@role='combobox'])[4]
    Click Element                    (//div[contains(.,'Não')])[5]
    Click Element                    ${Botao_Proximo_Requisicoes}
# 3
    Input Text                       //input[contains(@placeholder,'10')]    1

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'Trifásico 220/127V')])[5]

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    //span[normalize-space(text())='B1']

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'Light')])[5]

    Click Element                    //button[contains(.,'Selecione')]
    Click Element                    (//div[contains(.,'Telhado')])[5]

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Click Element                    (//div[contains(.,'Aluzinco')])[5]

    Click Element                    //button[contains(.,'Selecione')]
    Click Element                    (//div[contains(.,'Concreto')])[5]

    Input Text                        //input[@placeholder='Descreva']        teste
    Input Text                        //input[@id='uniConsumi']               teste
    Input Text                        (//input[contains(@type,'text')])[4]    teste
    Input Text                        (//input[@type='text'])[5]              teste
    Input Text                        (//input[@type='number'])[2]            teste
    Input Text                         //input[contains(@id,'uniConsumi')]   123456
    Click Element                      ${Botao_Proximo_Requisicoes}
# 4
    Input Text                        //input[@placeholder='DD/MM/YYYY']    11112026

    Click Element                     (//button[contains(.,'Selecione')])[1]
    Click Element                     (//div[contains(.,'Nacional')])[5]

    Click Element                     //button[contains(.,'Selecione')]
    Click Element                     (//div[contains(.,'Financiamento Importado')])[5]

    Click Element                     //button[contains(.,'Salvar')]

Então sistema exibe mensagem de cadastro realizado
    Wait Until Page Contains    text=Requisições

Aguardo carregamento da página 
    Sleep    3s

E preencho filtro com cliente "B3 (teste)" para verificação
    Wait Until Element Is Visible    //input[@placeholder='Nome do cliente ...']
    Input Text                       //input[@placeholder='Nome do cliente ...']    ${nome_pesquisa_GruposConsumidores}
    Sleep    1s
    Click Element                    ${Botao_Buscar}
    Sleep    2s

Então sistema verifica se há requisição B3 (teste)
    ${temporario_encontrado}=    Run Keyword And Return Status    Element Should Be Visible    //td[contains(.,'B3 (teste)')]

    WHILE    ${temporario_encontrado}
        Log    Requisição temporária encontrada. Irá excluir...
        Sleep    2s
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
        Wait Until Element Is Visible    ${Botao_Editar}
        Sleep    1s
        Click Element                    ${Botao_Editar}

        Wait Until Page Contains         text=Editar requisição
        Wait Until Element Is Visible    ${Botao_Excluir_Requisicoes}    timeout=10s

        Execute JavaScript               window.scrollTo(0, 0)
        Sleep    1s
        Wait Until Element Is Visible    ${Botao_Excluir_Requisicoes}
        Click Element                    ${Botao_Excluir_Requisicoes}

        Wait Until Element Is Visible    //button[contains(.,'Continuar')]     timeout=10s
        Click Element                    //button[contains(.,'Continuar')] 

        Sleep    2s
        Wait Until Element Is Visible    //button[contains(.,'Filtros')]
        Click Element                    //button[contains(.,'Filtros')]
        Sleep    3s
        Input Text                       //input[@id='cliente']    temporario
        Press Keys                       //input[@id='cliente']    ENTER
        Sleep    1s

        # Atualiza a variável usada no WHILE
        ${temporario_encontrado}=    Run Keyword And Return Status    Element Should Be Visible    //td[contains(.,'temporario')]
    END

    Sleep    1s
    Wait Until Element Is Visible    ${MENU_INICIO}
    Click Element                    ${MENU_INICIO}
    Wait Until Element Is Visible    ${MENU_REQUISICOES}
    Click Element                    ${MENU_REQUISICOES}

E preencho informações de pesquisa para verificação
    Input Text    //input[@placeholder='Buscar...']    ${nome_pesquisa_GruposConsumidores}
    Sleep    1s

Então sistema verifica se há cadastro B3 (teste)
    ${temporario_encontrado}=    Run Keyword And Return Status    Element Should Be Visible    (//td[normalize-space()='B3 (teste)'])[1]

    WHILE    ${temporario_encontrado}
        Log    Requisição temporária encontrada. Irá excluir...
        Sleep    2s
        Wait Until Element Is Visible    ${botao_acoes_Clientes}
        Sleep    2s
        Click Element                    ${botao_acoes_Clientes}
        Sleep    0.5s
        Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}
        Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}
        Sleep    1s
        Wait Until Element Is Visible    ${botao_continuar_Excluir}
        Click Element                    ${botao_continuar_Excluir}
        Sleep    2s
        Wait Until Page Contains    text=Gerenciar informações cadastradas no sistema

        Sleep    3s
        Click Element    ${botao_buscarPerguntas}
        Input Text    //input[@placeholder='Buscar...']    ${nome_pesquisa_GruposConsumidores}
        Sleep    1s

        # Atualiza a variável usada no WHILE
        ${temporario_encontrado}=    Run Keyword And Return Status    Element Should Be Visible    (//td[normalize-space()='B3 (teste)'])[1]
    END

    Sleep    1s
    Wait Until Element Is Visible    ${MENU_INICIO}
    Click Element                    ${MENU_INICIO}
    Wait Until Element Is Visible    ${MENU_REQUISICOES}
    Click Element                    ${MENU_REQUISICOES}



# --2.15
E preencho filtro Cliente
    Wait Until Element Is Visible    //input[@placeholder='Nome do cliente ...']
    Input Text                       //input[@placeholder='Nome do cliente ...']    ${nome_pesquisa_Padrao}
    Click Element                    ${Botao_Buscar}
    Sleep    2s
    Wait Until Page Contains         text=B1 (Padrão)
    
E clico no botão "Editar"
    Sleep    2s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    ${Botao_Editar}
    Sleep    1s
    Click Element                    ${Botao_Editar}

E preencho informações de requisição editada
    Wait Until Element Is Visible    (//button[@role='combobox'])[1]    timeout=10s
    Sleep    3s
    Click Element                    (//button[@role='combobox'])[1]
    Click Element                    (//div[contains(.,'Juarez Codeiro')])[5]
    Sleep    1s
    Click Element                    //button[contains(.,'Salvar alterações')]

Então sistema conlcui edição de requisição
    Wait Until Page Contains    text=Editar requisição

Então sistema verifica se há cadastro temporario
    Sleep    3s
    ${temporario_encontrado}=    Run Keyword And Return Status    Element Should Be Visible    //td[contains(.,'temporario')]

    WHILE    ${temporario_encontrado}
        Log    Requisição temporária encontrada. Irá excluir...
        Sleep    2s
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
        Wait Until Element Is Visible    ${Botao_Editar}
        Sleep    1s
        Click Element                    ${Botao_Editar}

        Wait Until Page Contains         text=Editar requisição
        Sleep    2s
        Wait Until Element Is Visible    ${Botao_Excluir_Requisicoes}    timeout=10s

        Sleep    2s
        Execute JavaScript               window.scrollTo(0, 0)
        Sleep    2s
        Wait Until Element Is Visible    ${Botao_Excluir_Requisicoes}
        Click Element                    ${Botao_Excluir_Requisicoes}

        Wait Until Element Is Visible    //button[contains(.,'Continuar')]     timeout=10s
        Click Element                    //button[contains(.,'Continuar')] 

        Sleep    4s
        Wait Until Element Is Visible    //button[contains(.,'Filtros')]
        Click Element                    //button[contains(.,'Filtros')]
        Sleep    3s
        Input Text                       //input[@id='cliente']    temporario
        Press Keys                       //input[@id='cliente']    ENTER
        Sleep    1s

        # Atualiza a variável usada no WHILE
        ${temporario_encontrado}=    Run Keyword And Return Status    Element Should Be Visible    //td[contains(.,'temporario')]
    END

    Sleep    1s
    Wait Until Element Is Visible    ${MENU_INICIO}
    Click Element                    ${MENU_INICIO}
    Wait Until Element Is Visible    ${MENU_REQUISICOES}
    Click Element                    ${MENU_REQUISICOES}

E preencho informações de cadastro de requisição com cliente "temporario"
    Sleep    1s
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    
    Press Keys                       //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    temporario
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

E preencho filtro com cliente "temporario"
    Wait Until Element Is Visible    //input[@placeholder='Nome do cliente ...']
    Input Text                       //input[@placeholder='Nome do cliente ...']    temporario
    Click Element                    ${Botao_Buscar}
    Sleep    2s
    Wait Until Page Contains         text=temporario

E preencho filtro com cliente "temporario" para verificação
    Wait Until Element Is Visible    //input[@placeholder='Nome do cliente ...']
    Input Text                       //input[@placeholder='Nome do cliente ...']    temporario
    Sleep    1s
    Click Element                    ${Botao_Buscar}
    Sleep    2s


E preencho filtro com cliente
    Wait Until Element Is Visible    //input[@placeholder='Nome do cliente ...']
    Input Text                       //input[@placeholder='Nome do cliente ...']    ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${Botao_Buscar}
    Sleep    2s
    Wait Until Page Contains         text=B3 (teste)

E preencho informações de pesquisa com cliente "temporario"
    Input Text    //input[@placeholder='Buscar...']    temporario
    Wait Until Page Contains    text=temporario

# --2.16

E clico no botão "Visualizar"
    Sleep    1s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    ${Botao_Visualizar}   
    Click Element                    ${Botao_Visualizar}

Então sistema exibe informações de Visualizar em requisições
    Wait Until Page Contains    text=Visualizar informações

# --2.17
E volto pra tela inicio
    #   E clico no menu inicio
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_INICIO}    timeout=50s
    Click Element                    ${MENU_INICIO}
    Sleep    1s

Então sistema verifica se Requisição padrão está em "Fila"
    Sleep    1s
    ${esta_em_fila}=    Run Keyword And Return Status    Element Should Be Visible    ${elemento_fila}

    Run Keyword If    ${esta_em_fila}    
    ...    Log    Requisição está em Fila. Teste segue normalmente.

    Run Keyword Unless    ${esta_em_fila}    
    ...    Verifica e edita se estiver concluído

Verifica e edita se estiver concluído
    ${esta_concluido}=    Run Keyword And Return Status    Element Should Be Visible    ${elemento_concluido}

    Run Keyword If    ${esta_concluido}
    ...    Log    Requisição está Concluída. Irá editar para Fila.
    ...    ELSE    
    ...    Fail    Nenhuma requisição com status "Fila" ou "Concluído" foi encontrada.

    # Editar requisição
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2s
    Wait Until Element Is Visible    ${Botao_MudarStatusRequisicao}    
    Click Element                    ${Botao_MudarStatusRequisicao}
    Click Element                    //button[contains(.,'Fila')]
    Sleep    2s

E seleciono opção "Concluído" no botão Mudar Status Requisição em requisicoes
    Execute Javascript    document.body.style.zoom="70%"
    Sleep    2s
    Wait Until Element Is Visible    ${Botao_MudarStatusRequisicao}    
    Click Element                    ${Botao_MudarStatusRequisicao}
    Click Element                    //button[contains(.,'Concluído')]

E seleciono opção "Fila" no botão Mudar Status Requisição em requisicoes
    Wait Until Element Is Visible    ${Botao_MudarStatusRequisicao}
    Click Element                    ${Botao_MudarStatusRequisicao}
    Click Element                    (//button[normalize-space()='Fila'])[1]

Então sistema verifica status de requisição alterado
    Sleep    5s
    Click Element                    ${Link_Filtros}
    Sleep                            1s
    Input Text                       //input[@placeholder='Nome do cliente ...']    ${nome_pesquisa_Padrao}
    Click Element                    ${Botao_Buscar}
    Wait Until Page Contains         text=Concluído

Então sistema verifica status de requisição renovada alterado
    Sleep    7s
    Click Element                    ${Link_Filtros}
    Sleep                            1s
    Input Text                       //input[@placeholder='Nome do cliente ...']    temporario
    Click Element                    ${Botao_Buscar}
    Wait Until Page Contains         text=Concluído

Então sistema verifica status de requisição alterado para fila
    Sleep    5s
    Click Element                    ${Link_Filtros}
    Sleep                            1s
    Input Text                       //input[@placeholder='Nome do cliente ...']    ${nome_pesquisa_Padrao}
    Click Element                    ${Botao_Buscar}
    Wait Until Page Contains         text=Fila

# --2.18
E clico no botão "Histórico"
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    1s
    Wait Until Element Is Visible    ${Botao_Acoes_Requisicoes}    timeout=10s
    Click Element                    ${Botao_Acoes_Requisicoes}
    Sleep    1s
    Wait Until Element Is Visible    ${Botao_Historico}
    Click Element                    ${Botao_Historico}

Então sistema exibe histórico em requisições
    Sleep    1s
    Wait Until Page Contains    text=Histórico da requisição
    
# --2.19
Então sistema verifica se existe cadastro temporario
    ${elemento_visivel}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(), 'Temporario')]

    Run Keyword If    ${elemento_visivel}    Executa Exclusao De Cliente Temporario
    ...               ELSE                    Voltar Para Menu Inicio

Executa Exclusao De Cliente Temporario
    Sleep    2s
    Click Element                    ${botao_acoes_Clientes}
    Sleep    0.5s
    Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}
    Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}
    Sleep    1s
    Wait Until Element Is Visible    ${botao_continuar_Excluir}
    Click Element                    ${botao_continuar_Excluir}

Voltar Para Menu Inicio
#   E clico no menu inicio
    Sleep    1s
    Wait Until Element Is Visible    ${MENU_INICIO}
    Click Element                    ${MENU_INICIO}

E preencho informações de pesquisa para verificação de temporario
    Input Text    //input[@placeholder='Buscar...']    temporario
    Sleep    1s


E clico no botão "Renovar"
    Sleep    3s
    Wait Until Element Is Visible    ${Botao_Acoes_Requisicoes}
    Click Element                    ${Botao_Acoes_Requisicoes}
    Sleep    2s
    Wait Until Element Is Visible    ${Botao_Renovar}
    Click Element                    ${Botao_Renovar}
    Sleep    2s
    Wait Until Element Is Visible    //button[contains(.,'Sim')]
    Click Element                    //button[contains(.,'Sim')]
    Sleep    2s
    Wait Until Element Is Visible    //button[contains(.,'Atualização de preço')]
    Click Element                    //button[contains(.,'Atualização de preço')]
    Wait Until Element Is Visible    (//button[@type='button'][normalize-space()='Sim'])[2]
    Click Element                    (//button[@type='button'][normalize-space()='Sim'])[2]
    Sleep    2s

Então sistema exibe mensagem após renovação  
    Execute Javascript    window.scrollTo(0,0)  
    Wait Until Page Contains    text=Gerencie informações cadastradas no sistema.

E preencho filtro Cliente renovado
    Wait Until Element Is Visible    //input[@placeholder='Nome do cliente ...']
    Input Text                       //input[@placeholder='Nome do cliente ...']    temporario - Renovação
    Click Element                    ${Botao_Buscar}
    Sleep    2s
    Wait Until Page Contains         text=temporario - Renovação

E clico no botão "Excluir requisição" temporario em Obras
    Sleep    8s
    Wait Until Page Contains         text=Dados do Cliente
    Execute JavaScript               window.scrollTo(0, 0)
    Wait Until Element Is Visible    ${Botao_Excluir_Requisicoes}    timeout=20s
    Click Element                    ${Botao_Excluir_Requisicoes}
    Wait Until Element Is Visible    //button[contains(.,'Continuar')]
    Click Element                    //button[contains(.,'Continuar')]

# --2.20
E clico no botão "Comentários"
    # Sleep    2s
    # Click Element         //td[contains(.,'Estimativa')]
    Sleep    1s
    Execute JavaScript    window.scrollTo(document.body.scrollWidth, 0);
    Wait Until Element Is Visible    ${Botao_Comentarios}
    Click Element                    ${Botao_Comentarios}

E preencho informações de comentário
    Wait Until Element Is Visible    (//button[@data-state='closed'])[23]
    Click Element    (//button[@data-state='closed'])[23]
    Click Element    (//button[@data-state='closed'])[24]
    Click Element    (//button[@data-state='closed'])[25]
    Click Element    (//button[@data-state='closed'])[26]
    Input Text       //div[contains(@contenteditable,'true')]    ${nome_pesquisa_GruposConsumidores}
    Click Element    (//button[@data-state='closed'])[40]

Então sistema exibe mensagem de confirmação
    Wait Until Page Contains    text=Mensagem enviada com sucesso!

# --2.21
Quanto clico no botão "Inserir/TI"
    Wait Until Element Is Visible    ${Botao_Inserir_Requisicoes}
    Click Element                    ${Botao_Inserir_Requisicoes}
    Wait Until Element Is Visible    //button[contains(.,'TI')]
    Click Element                    //button[contains(.,'TI')]

Então sistema exibe mensagem de cadastro TI realizado
    Wait Until Page Contains    text=Escolha o tipo de requisição que deseja cadastrar.

# --2.22
Quanto clico no botão "Inserir/Compras"
    Wait Until Element Is Visible     ${Botao_Inserir_Requisicoes}
    Click Element                     ${Botao_Inserir_Requisicoes}
    Wait Until Element Is Visible     //button[contains(.,'Compras')]
    Click Element                     //button[contains(.,'Compras')]     

Então sistema exibe mensagem de cadastro Compras realizado
    Wait Until Page Contains    text=Escolha o tipo de requisição que deseja cadastrar.

Quanto clico no botão "Inserir/DP"
    Wait Until Element Is Visible    ${Botao_Inserir_Requisicoes}
    Click Element                    ${Botao_Inserir_Requisicoes}
    Sleep    1s
    Click Element                    //button[contains(.,'Departamento pessoal')]
    Click Element                    //button[contains(.,'CERTIDAO AMBIENTAL')]

E preencho informações de cadastro de requisição "Departamento Pessoal"
# 1
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]
    Press Keys                       //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    ${nome_pesquisa_GruposConsumidores}
    Click Element                    (//div[contains(.,'B3 (teste)')])[14]
    Click Element                    ${Botao_Proximo_Requisicoes}
# 2
   Click Element    //button[contains(.,'Selecione')] 
   Click Element    (//div[contains(.,'Fernando Morais da Costa Silva')])[5]
   Click Element    //button[contains(.,'Salvar')]

# --2.22
E clico no botão "Excluir requisição"
    Sleep    2s
    Wait Until Page Contains         text=Editar requisição
    Wait Until Page Contains         text=B3 (teste)
    Execute JavaScript               window.scrollTo(0, 0)
    Sleep    2s
    Wait Until Element Is Visible    ${Botao_Excluir_Requisicoes}
    Click Element                    ${Botao_Excluir_Requisicoes}
    Wait Until Element Is Visible    //button[contains(.,'Continuar')]
    Click Element                    //button[contains(.,'Continuar')]

E clico no botão "Excluir requisição" temporario
    Sleep    2s
    Wait Until Page Contains         text=Editar requisição
    Sleep    2s
    Wait Until Page Contains         text=temporario
    Execute JavaScript               window.scrollTo(0, 0)
    Wait Until Element Is Visible    ${Botao_Excluir_Requisicoes}
    Click Element                    ${Botao_Excluir_Requisicoes}
    Wait Until Element Is Visible    //button[contains(.,'Continuar')]
    Click Element                    //button[contains(.,'Continuar')]

Então sistema exclui e retorna para menu requisições
    Wait Until Page Contains    text=Requisições

# --2.25
Então sistema exibe mensagem de cadastro excluido
    Wait Until Element Is Visible    //p[contains(.,'Gerenciar informações cadastradas no sistema')]

# --2.26
E clico em próximo sem preencher campos
    Sleep    2s
    Wait Until Element Is Visible    ${Botao_Proximo_Requisicoes}
    Click Element                    ${Botao_Proximo_Requisicoes}
    Sleep    1s

Então sistema exibe mensagem de campos obrigatórios não preenchido
    Wait Until Page Contains    text=Por favor digite um CPF ou CNPJ válido.

# --2.27
Preencho o campo CPF
    Sleep    2.5s
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]
    Press Keys                       //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    1teste
    Wait Until Element Is Visible    //button[contains(.,'Novo Cliente')]
    Click Element                    //button[contains(.,'Novo Cliente')]
    Wait Until Element Is Visible    ${input_CPF_Requisicoes}
    Input Text                       ${input_CPF_Requisicoes}    19895982771


Preencho somente campo telefone
    Wait Until Element Is Visible         ${input_telefone_Requisicoes}
    Input Text                            ${input_telefone_Requisicoes}    21981905892
    Click Element                         ${Botao_Proximo_Requisicoes}

Então sistema exibe mensagem de CEP não preenchido
    Wait Until Page Contains    text=Preencha os campos obrigatórios: CEP, Estado, Cidade, Endereço
    
# --2.28
Preencho somente campo CEP
    Wait Until Element Is Visible    ${input_CEP_Requisicoes}
    Input Text                       ${input_CEP_Requisicoes}    1111111
    Click Element                    ${Botao_Proximo_Requisicoes}

Então sistema exibe mensagem de telefone não preenchido
    Wait Until Page Contains    text=Preencha os campos obrigatórios: Telefone
# --2.27