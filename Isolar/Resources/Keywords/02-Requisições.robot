*** Settings ***
Documentation      Modúlo que Gerencie requisições cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Link_Filtros}            //button[contains(.,'Filtros')]
${Campo_Cliente}           //input[@id='cliente']
${Campo_Departamento}      //div[@role='option' and contains(.,'Técnico')]
${Campo_Status}            //div[@role='option' and contains(.,'Produção')]
${Campo_Tipo}              //div[@role='option' and contains(.,'Técnico')]
${Campo_Urgente}           //div[@role='option' and contains(.,'Sim')]
${Campo_Nivel_Urgencia}    //div[@role='option' and contains(.,'Alto')]

${Botao_Buscar}            //button[contains(.,'Buscar')]

${Cliente_Fila}            Fernando
${Departamento_Fila}       Técnico
${Status_option}             (//div[contains(.,'Parado')])[5]
${Tipo_Fila}               Técnico

${COMBOBOX_DEPARTAMENTO}       //button[contains(@id,'departament')]
${COMBOBOX_STATUS}             //button[contains(@id,'status')]
${COMBOBOX_TIPO}               //button[contains(@id,'tipo')]
${COMBOBOX_URGENTE}            //button[contains(@id,'urgente')]
${COMBOBOX_NIVEL_DE_URGENCIA}  //button[contains(@id,'nivel_urgencia')]
${COMBOBOX_RESPONSAVEL}        (//button[contains(@dir,'ltr')])[3]
${COMBOBOX_RENOVADAS}          //button[contains(@id,'renovada')]


@{OPCOES_COMBOBOX_DEPARTAMENTO}     (//div[contains(.,'Comercial')])[14]  (//div[contains(.,'Compras')])[5]      (//div[contains(.,'Técnico')])[14]    
...    (//div[contains(.,'Administrativo')])[5]              (//div[contains(.,'TI')])[5]          (//div[contains(.,'Logística')])[5]    (//div[contains(.,'Jurídico')])[5]
...    (//div[contains(.,'Departamento pessoal')])[5]        (//div[contains(.,'ENG.CIVIL')])[5]    (//div[contains(.,'OBRAS')])[5]        (//div[contains(.,'SERVIÇOS')])[5]
...    (//div[contains(.,'CS-Customer Success')])[5]
@{OPCOES_COMBOBOX_STATUS}           (//div[contains(.,'Fila')])[22]    (//div[contains(.,'Produção')])[5]    (//div[contains(.,'Concluído')])[22]    (//div[contains(.,'Parado')])[5]
@{OPCOES_COMBOBOX_TIPO}             (//div[contains(.,'Estimativa')])[19]    (//div[contains(.,'Pós Venda')])[5]    (//div[contains(.,'Compra')])[5]    (//div[contains(.,'Defeito com computador/notebook')])[5]    (//div[contains(.,'Defeito com impressora')])[5]    
...     (//div[contains(.,'Problemas com internet')])[5]    (//div[contains(.,'Novo Colaborador')])[5]    (//div[contains(.,'Bloqueio de Acesso a Plataforma')])[5]    (//div[contains(.,'Problema com Sistema')])[5]    
...    (//div[contains(.,'SERVIÇO MANUTENÇAO')])[5]    (//div[contains(.,'CERTIDAO AMBIENTAL')])[5]
@{OPCOES_COMBOBOX_URGENTE}          (//div[contains(.,'Sim')])[5]    (//div[contains(.,'Não')])[14]
@{OPCOES_COMBOBOX_NIVELDEURGENCIA}  (//div[contains(.,'Baixo')])[5]    (//div[contains(.,'Médio')])[5]    (//div[contains(.,'Alto')])[5]
@{OPCOES_COMBOBOX_RESPONSAVEL}      (//div[contains(.,'Joice')])[5]    (//div[contains(.,'Larissa SDR')])[5]    (//div[contains(.,'Leandro Coser')])[5]    (//div[contains(.,'Fabrício TI')])[5]    (//div[contains(.,'Yoseph - Aprediz de dev')])[5]    
@{OPCOES_COMBOBOX_RENOVADAS}        (//div[contains(.,'Originais')])[5]    



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
    # Sleep    15s
    Click Element                    ${Link_Filtros}
    Sleep    1s

E preencho informações no campo Cliente
    Wait Until Element Is Visible    ${Campo_Cliente}
    Input Text                       ${Campo_Cliente}        Fernando
    Click Element                    ${Botao_Buscar}

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
E valido todos os filtros dentro de Departamento em Requisições
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
    Click Element                    (//button[@type='button'])[31]
    Click Element                    (//button[@type='button'])[31]
    Click Element                    (//button[contains(.,'1')])[1]
    Click Element                    //button[contains(.,'31')]
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições do filtro Data de entrega
    Wait Until Page Contains         text=1927    timeout=10s

# --2.9
E preencho informações de Data de criação
    Wait Until Element Is Visible    //button[@id='data_criacao']
    Click Element                    //button[@id='data_criacao']
    Click Element                    (//button[@type='button'])[31]
    Click Element                    (//button[@type='button'])[31]
    Click Element                    (//button[contains(.,'1')])[1]
    Click Element                    //button[contains(.,'31')]
    Click Element                    //button[@id='data_criacao']
    Click Element                    ${Botao_Buscar}          

Então sistema exibe requisições do filtro Data de Criação
    Wait Until Page Contains         text=1927    timeout=10s

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
    Wait Until Element Is Visible    (//button[contains(.,'Selecione')])[5]
    Click Element                    (//button[contains(.,'Selecione')])[5]
    Click Element                    (//div[contains(.,'Todos')])[24]
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições de filtro Representante comercial
    Wait Until Page Contains    text=1937

# --2.12
E seleciono filtro vendedor "Todos"
    Wait Until Element Is Visible    (//button[contains(.,'Selecione')])[2]
    Click Element                    (//button[contains(.,'Selecione')])[2]
    Click Element                    (//div[contains(.,'Todos')])[24]
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições de filtro vendedor "Todos"
    Wait Until Page Contains    text=1937

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

# --2.7
