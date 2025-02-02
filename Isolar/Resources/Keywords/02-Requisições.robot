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
${Botao_Visualizar}                     (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10')])[2]
${Botao_Acoes}                          (//button[@data-state='closed'])[19]
${Botao_Historico}                      (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-secondary text-secondary-foreground hover:bg-secondary/80 h-10 w-10')])[3]
${Botao_Comentarios}                    (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10'])[2]
${Botao_Acoes_Requisicoes}              (//button[@data-state='closed'])[20]
${Botao_Renovar}                        //button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-primary-foreground h-10 w-10 bg-green-500 hover:bg-green-400']
${Botao_Inserir_Requisicoes}            //button[contains(.,'Inserir')]
${Botao_Proximo_Requisicoes}            //button[contains(.,'Próximo')]
${Botao_Excluir_Requisicoes}            //button[contains(.,'Excluir requisição')]
${Botao_MudarStatusRequisicao}          (//button[@data-state='closed'])[19]

${input_nomecompleto_Requisicoes}       //div[@class='select__value-container css-hlgwow']
${input_telefone_Requisicoes}           //input[@id='telefone']
${input_CEP_Requisicoes}                //input[@id='cep']

${Cliente_Fila}            Fernando
${Departamento_Fila}       Técnico
${Status_option}           (//div[contains(.,'Parado')])[5]
${Tipo_Fila}               Técnico

${COMBOBOX_DEPARTAMENTO}       //button[contains(@id,'departament')]
${COMBOBOX_STATUS}             //button[contains(@id,'status')]
${COMBOBOX_TIPO}               //button[@id='tipo']
${COMBOBOX_URGENTE}            //button[contains(@id,'urgente')]
${COMBOBOX_NIVEL_DE_URGENCIA}  //button[contains(@id,'nivel_urgencia')]
${COMBOBOX_RESPONSAVEL}        (//button[contains(@dir,'ltr')])[3]
${COMBOBOX_RENOVADAS}          //button[contains(@id,'renovada')]


@{OPCOES_COMBOBOX_DEPARTAMENTO}    (//div[contains(.,'Técnico')])[14]    (//div[contains(.,'Administrativo')])[5]
@{OPCOES_COMBOBOX_STATUS}           (//div[contains(.,'Fila')])[22]    (//div[contains(.,'Produção')])[5]    (//div[contains(.,'Concluído')])[22]    (//div[contains(.,'Parado')])[5]
@{OPCOES_COMBOBOX_TIPO}
# @{OPCOES_COMBOBOX_TIPO}             (//div[contains(.,'Técnico')])[14]    (//div[contains(.,'Pós Venda')])[5]    (//div[contains(.,'Compra')])[5]    (//div[contains(.,'Defeito com computador/notebook')])[5]    (//div[contains(.,'Defeito com impressora')])[5]    
# ...     (//div[contains(.,'Problemas com internet')])[5]    (//div[contains(.,'Novo Colaborador')])[5]    (//div[contains(.,'Bloqueio de Acesso a Plataforma')])[5]    (//div[contains(.,'Problema com Sistema')])[5]    
# ...    (//div[contains(.,'SERVIÇO MANUTENÇAO')])[5]    (//div[contains(.,'CERTIDAO AMBIENTAL')])[5]
@{OPCOES_COMBOBOX_URGENTE}          (//div[contains(.,'Sim')])[5]    (//div[contains(.,'Não')])[14]
@{OPCOES_COMBOBOX_NIVELDEURGENCIA}  (//div[contains(.,'Baixo')])[5]    (//div[contains(.,'Médio')])[5]    (//div[contains(.,'Alto')])[5]
@{OPCOES_COMBOBOX_RESPONSAVEL}      (//div[contains(.,'LUANA GUARNIERI')])[5]    (//div[contains(.,'Leandro Coser')])[5]    (//div[contains(.,'Lucas Cenci')])[5]    
@{OPCOES_COMBOBOX_RENOVADAS}        (//div[contains(.,'Originais')])[5]    

${actions}=    Get Webdriver Manager
*** Keywords ***
# --2.1
Dado que clico no menu "Requisições"
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_REQUISICOES}
    Click Element                    ${MENU_REQUISICOES}
    Sleep    5s

# --2.2
Quando clico em "Filtros"
    Wait Until Element Is Visible    ${Link_Filtros}
    Click Element                    ${Link_Filtros}

E preencho informações no campo Cliente
    Wait Until Element Is Visible    ${Campo_Cliente}
    Input Text                       ${Campo_Cliente}        Fernando

Então sistema exibe requisições do filtro Cliente
    Wait Until Element Is Visible        xpath=//td[contains(normalize-space(),'Fernando')]       timeout=10s
    ${statuses}=    Get Webelements      xpath=//td[contains(normalize-space(),'Fernando')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Contain    ${text}    ${Cliente_Fila}
    END

# --2.3
E valido filtros dentro de Departamento em Requisições
    Wait Until Element Is Visible    ${COMBOBOX_DEPARTAMENTO}    timeout=10s
    Click Element    ${COMBOBOX_DEPARTAMENTO}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_DEPARTAMENTO}

    FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_DEPARTAMENTO}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Wait Until Element Is Visible    ${COMBOBOX_DEPARTAMENTO}
            Execute JavaScript    window.scrollTo(0, 0)
            # Reabre a combobox para a próxima iteração
            Click Element    ${COMBOBOX_DEPARTAMENTO}
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

    # Wait Until Element Is Visible    ${COMBOBOX_STATUS}
    # Click Element    ${COMBOBOX_STATUS}
    # # Pega todas as opções dentro do dropdown
    # ${departamentos}    Get WebElements    ${COMBOBOX_STATUS}

    # FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_STATUS}
    #         # Clica na opção de departamento atual
    #         Click Element    ${departamento}
            
    #         # Clica no botão de buscar
    #         Click Element    ${Btn_Buscar}
            
    #         # Espera pela atualização e valida que a página foi atualizada
    #         Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
    #         # Log do departamento testado
    #         ${departamento_text}    Get Text    ${departamento}
    #         Log    Departamento ${departamento_text} validado com sucesso
    #         Wait Until Element Is Visible    ${COMBOBOX_STATUS}
    #         Execute JavaScript    window.scrollTo(0, 0)
    #         # Reabre a combobox para a próxima iteração
    #         Click Element    ${COMBOBOX_STATUS}
    #     END
    
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
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            
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
    Wait Until Element Is Visible    (//button[@type='button'])[43]
    Click Element                    (//button[@type='button'])[43]
    Click Element                    (//button[@type='button'])[43]
    Click Element                    (//button[@type='button'])[43]
    Click Element                    (//button[@type='button'])[43]
    Click Element                    (//button[contains(.,'1')])[1]
    Click Element                    //button[contains(.,'31')]
    Click Element                    ${Botao_Buscar} 

Então sistema exibe requisições do filtro Data de entrega
    Sleep    1s
    Wait Until Element Is Visible    //td[contains(.,'1827')]
# --2.9
E preencho informações de Data de criação
    Wait Until Element Is Visible      //button[@id='data_criacao']
    Click Element                      //button[@id='data_criacao']

    Click Element                    (//button[@type='button'])[43]
    Click Element                    (//button[@type='button'])[43]
    Click Element                    (//button[@type='button'])[43]
    Click Element                    (//button[@type='button'])[43]

    Click Element                      (//button[contains(.,'1')])[1]
    Click Element                      //button[contains(.,'31')]

    Click Element                      //button[@id='data_criacao']
    Click Element                      ${Botao_Buscar}
Então sistema exibe requisições do filtro Data de Criação
    Sleep    1s
    Wait Until Element Is Visible    //td[contains(.,'1793')]

# --2.10
E valido todos os filtros dentro de "Responsável"
    Wait Until Element Is Visible    ${COMBOBOX_RESPONSAVEL}    timeout=10s
    Click Element    ${COMBOBOX_RESPONSAVEL}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_RESPONSAVEL}

    FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_RESPONSAVEL}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Wait Until Element Is Visible    ${COMBOBOX_RESPONSAVEL}
            # Reabre a combobox para a próxima iteração
            Click Element    ${COMBOBOX_RESPONSAVEL}
        END


Então sistema exibe requisições de filtro Responsável
    Wait Until Page Contains    text=Requisições

# --2.11
E valido filtro dentro de "Representante comercial"
    Wait Until Element Is Visible    (//button[@type='button'])[17]
    Click Element                    (//button[@type='button'])[17]
    Click Element                    (//div[contains(.,'Todos')])[24]
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições de filtro Representante comercial
    Wait Until Page Contains    text=1778

# --2.12
E seleciono filtro vendedor "Todos"
    Wait Until Element Is Visible    (//button[@type='button'])[12]
    Click Element                    (//button[@type='button'])[12]
    Click Element                    (//div[contains(.,'Todos')])[23]
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições de filtro vendedor "Todos"
    Wait Until Element Is Visible    (//div[contains(.,'Produção')])[10]
# --2.13
E valido todos os filtros dentro de "Renovadas"
    # Wait Until Element Is Visible    //button[@id='renovada']
    # Click Element                    //button[@id='renovada']
    # Click Element                    (//div[contains(.,'Renovadas')])[19]
    # Click Element                    ${Botao_Buscar}

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
Quanto clico no botão "Inserir/Técnico"
    Wait Until Element Is Visible    ${Botao_Inserir_Requisicoes}
    Sleep    1s
    Click Element                    ${Botao_Inserir_Requisicoes}
    Wait Until Element Is Visible    //button[contains(.,'Técnico')]
    Click Element                    //button[contains(.,'Técnico')]
    Click Element                    //button[contains(.,'Técnico')]

E preencho informações de cadastro de requisição
# 1
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    timeout=10s
    Press Keys    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    ${nome_pesquisa_GruposConsumidores}
    Wait Until Element Is Visible    //button[contains(.,'Novo Cliente')]
    Click Element    //button[contains(.,'Novo Cliente')]
    Input Text    //input[@id='telefone']    12345678910
    Input Text    //input[@id='cep']    28990154
    Input Text    //input[@id='cpfCnpj']    12345678910
    Input Text    //input[@id='atvEco']    Residencial
    Click Element    ${Botao_Proximo_Requisicoes}
# 2
    Click Element    (//button[contains(.,'Selecione')])[1]
    Click Element    (//div[contains(.,'Fernando Morais da Costa Silva')])[5]

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Wait Until Element Is Visible    (//div[contains(.,'teste')])[5]
    Click Element                    (//div[contains(.,'teste')])[5]

    Click Element                    (//button[contains(.,'Selecione')])[1]
    Wait Until Element Is Visible    (//div[contains(.,'teste')])[16]
    Click Element                    (//div[contains(.,'teste')])[16]

    Click Element    //button[contains(.,'Selecione')]
    Click Element    (//div[contains(.,'Não')])[5]
    Click Element    ${Botao_Proximo_Requisicoes}
# 3
    Input Text       //input[contains(@placeholder,'10')]    1

    Click Element    (//button[contains(.,'Selecione')])[1]
    Click Element    (//div[contains(.,'Trifásico 220/127V')])[5]

    Click Element    (//button[contains(.,'Selecione')])[1]
    Click Element    (//div[contains(.,'B1 (RESIDENCIAL)')])[5]

    Click Element    (//button[contains(.,'Selecione')])[1]
    Click Element    (//div[contains(.,'Light')])[5]

    Click Element    //button[contains(.,'Selecione')]
    Click Element    (//div[contains(.,'Telhado')])[5]

    Click Element    (//button[contains(.,'Selecione')])[1]
    Click Element    (//div[contains(.,'Aluzinco')])[5]

    Click Element    //button[contains(.,'Selecione')]
    Click Element    (//div[contains(.,'Concreto')])[5]

    Input Text        //input[@placeholder='Descreva']        teste
    Input Text        //input[@id='uniConsumi']               teste
    Input Text        (//input[contains(@type,'text')])[4]    teste
    Input Text        (//input[@type='text'])[5]              teste
    Input Text        (//input[@type='number'])[2]            teste
    Input Text         //input[contains(@id,'uniConsumi')]   123456
    Click Element      ${Botao_Proximo_Requisicoes}
# 4
    Input Text        //input[@placeholder='DD/MM/YYYY']    11112026

    Click Element      (//button[contains(.,'Selecione')])[1]
    Click Element      (//div[contains(.,'Nacional')])[5]

    Click Element      //button[contains(.,'Selecione')]
    Click Element      (//div[contains(.,'Financiamento Importado')])[5]

    Click Element     //button[contains(.,'Salvar')]

Então sistema exibe mensagem de cadastro realizado
    Wait Until Page Contains    text=Requisições

# --2.15

E preencho filtro Cliente
    Wait Until Element Is Visible    //input[@placeholder='Nome do cliente ...']
    Input Text                       //input[@placeholder='Nome do cliente ...']    ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${Botao_Buscar}
    Sleep    1s
E clico no botão "Editar"
    Sleep    2s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    ${Botao_Editar}
    Sleep    1s
    Click Element                    ${Botao_Editar}

E preencho informações de requisição editada
    Sleep    4s
    Click Element    //button[contains(.,'Fernando Morais da Costa Silva')]
    Click Element    (//div[contains(.,'teste123')])[5]
    Sleep    1s
    Click Element    //button[contains(.,'Salvar alterações')]

Então sistema conlcui edição de requisição
    Wait Until Page Contains    text=Editar requisição

# --2.16

E clico no botão "Visualizar"
    Sleep    1s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    ${Botao_Visualizar}   
    Click Element                    ${Botao_Visualizar}

Então sistema exibe informações de Visualizar em requisições
    Wait Until Page Contains    text=Visualizar informações


# --2.17

E seleciono opção "Concluído" no botão Mudar Status Requisição em requisicoes
    Wait Until Element Is Visible    ${Botao_MudarStatusRequisicao}
    Click Element                    ${Botao_MudarStatusRequisicao}
    Click Element                    //button[contains(.,'Concluído')]

Então sistema verifica funcionalidade do botão Mudar Status Requisição em Requisições
    Sleep    5s
    Click Element                    ${Link_Filtros}
    Sleep                            1s
    Input Text                       //input[@placeholder='Nome do cliente ...']    ${nome_pesquisa_GruposConsumidores}
    Click Element                    ${Botao_Buscar}
    Wait Until Element Is Visible    (//div[contains(.,'Concluído')])[10]


# --2.18

E clico no botão "Histórico"
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    ${Botao_Acoes_Requisicoes}
    Click Element                    ${Botao_Acoes_Requisicoes}
    Wait Until Element Is Visible    ${Botao_Historico}
    Click Element                    ${Botao_Historico}
Então sistema exibe histórico em requisições
    Wait Until Page Contains    text=Histórico da requisição

# --2.19

E clico no botão "Renovar"
    Wait Until Element Is Visible    ${Botao_Acoes_Requisicoes}
    Click Element                    ${Botao_Acoes_Requisicoes}
    Wait Until Element Is Visible    ${Botao_Renovar}
    Click Element                    ${Botao_Renovar}
Então sistema exibe mensagem de renovação    
    Wait Until Page Contains    text=Ações

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
    Click Element    (//button[@data-state='closed'])[39]

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
    Execute JavaScript               window.scrollTo(0, 0)
    Wait Until Element Is Visible    ${Botao_Excluir_Requisicoes}
    Click Element                    ${Botao_Excluir_Requisicoes}
    Click Element                    //button[contains(.,'Continuar')]

Então sistema exclui e retorna para menu requisições
    Wait Until Page Contains    text=Requisições

# --2.25
Então sistema exibe mensagem de cadastro excluido
    Wait Until Element Is Visible    //p[contains(.,'Gerenciar informações cadastradas no sistema')]

# --2.26
E clico em próximo sem preencher campos
    Wait Until Element Is Visible    ${Botao_Proximo_Requisicoes}
    Click Element                    ${Botao_Proximo_Requisicoes}

Então sistema exibe mensagem de campos obrigatórios não preenchido
    Wait Until Page Contains    text=Preencha os campos obrigatórios: Nome completo, Telefone, CEP

# --2.27
Preencho somente campo telefone
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]
    Press Keys                       //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    ${nome_pesquisa_GruposConsumidores}
    Wait Until Element Is Visible    //button[contains(.,'Novo Cliente')]
    Click Element                    //button[contains(.,'Novo Cliente')]
    Wait Until Element Is Visible         ${input_telefone_Requisicoes}
    Input Text                            ${input_telefone_Requisicoes}    1111111111
    Click Element                         ${Botao_Proximo_Requisicoes}

Então sistema exibe mensagem de CEP não preenchido
    Wait Until Page Contains    text=Preencha os campos obrigatórios: CEP
# --2.28
Preencho somente campo CEP
    Wait Until Element Is Visible    //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]
    Press Keys                       //div[contains(@class,'select__indicator select__dropdown-indicator css-1xc3v61-indicatorContainer')]    ${nome_pesquisa_GruposConsumidores}
    Wait Until Element Is Visible    //button[contains(.,'Novo Cliente')]
    Click Element                    //button[contains(.,'Novo Cliente')]
    Wait Until Element Is Visible    ${input_CEP_Requisicoes}
    Input Text                       ${input_CEP_Requisicoes}    1111111
    Click Element                    ${Botao_Proximo_Requisicoes}

Então sistema exibe mensagem de telefone não preenchido
    Wait Until Page Contains    text=Preencha os campos obrigatórios: Telefone
# --2.27
