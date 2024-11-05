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

${COMBOBOX_DEPARTAMENTO}   //button[contains(@id,'departament')]
@{COMBOBOX_OPCOES}     (//div[contains(.,'Comercial')])[14]  (//div[contains(.,'Compras')])[5]      (//div[contains(.,'Técnico')])[5]    
...    (//div[contains(.,'Administrativo')])[5]              (//div[contains(.,'TI')])[19]          (//div[contains(.,'Logística')])[5]    (//div[contains(.,'Jurídico')])[5]
...    (//div[contains(.,'Departamento pessoal')])[5]        (//div[contains(.,'ENG.CIVIL')])[5]    (//div[contains(.,'OBRAS')])[5]        (//div[contains(.,'SERVIÇOS')])[5]
...    (//div[contains(.,'CS-Customer Success')])[5]


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
E seleciono departamento "Técnico"
    Wait Until Element Is Visible    ${COMBOBOX_DEPARTAMENTO}    timeout=10s
    Click Element    ${COMBOBOX_DEPARTAMENTO}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_DEPARTAMENTO}

    FOR    ${departamento}    IN    @{COMBOBOX_OPCOES}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible    //button[contains(.,'Inserir')]    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
        Wait Until Element Is Visible    ${COMBOBOX_DEPARTAMENTO}    timeout=10s
            
            # Reabre a combobox para a próxima iteração
            Click Element    ${COMBOBOX_DEPARTAMENTO}
        END

    # Wait Until Element Is Visible    //button[@id='departament']      10s
    # Execute JavaScript               ${Campo_Departamento}
    # Click Element                    ${Botao_Buscar}

Então sistema exibe requisições do filtro Departamento
    Wait Until Element Is Visible        xpath=//td[contains(normalize-space(),'Técnico')]       timeout=10s
    ${statuses}=    Get Webelements      xpath=//td[contains(normalize-space(),'Técnico')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Contain    ${text}    ${Departamento_Fila}
    END

# --2.4
E seleciono status "Parado"
    Wait Until Element Is Visible    //button[contains(@id,'status')]      10s
    Click Element                    //button[contains(@id,'status')]
    Click Element                    ${Status_option}
    Click Element                    ${Botao_Buscar}
    Sleep    2s

Então sistema exibe requisições do filtro Status
    # Aguarda a atualização dos elementos filtrados.
    Wait Until Element Is Visible    (//div[contains(.,'Parado')])[19]    timeout=10s

    # Obtém todos os elementos que correspondem ao status filtrado "Parado".
    ${statuses}=    Get Webelements    (//div[contains(.,'Parado')])[19]

    # Conta quantos elementos foram encontrados.
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados com status 'Parado': ${count}

    # Verifica se todos os elementos retornados têm o status "Parado".
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Contain    ${text}    Parado
    END





# --2.5
E seleciono tipo "Técnico"
    Wait Until Element Is Visible    //button[contains(@id,'tipo')]      10s
    Click Element                    //button[contains(@id,'tipo')]
    Click Element                    ${Campo_Tipo}
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições do filtro Tipo
    Wait Until Element Is Visible        xpath=//td[contains(normalize-space(),'Técnico')]       timeout=10s
    ${statuses}=    Get Webelements      xpath=//td[contains(normalize-space(),'Técnico')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Contain    ${text}    ${Tipo_Fila}
    END

# --2.6
E seleciono urgente "Sim"
    Wait Until Element Is Visible    //button[contains(@id,'urgente')]      10s
    Click Element                    //button[contains(@id,'urgente')]
    Click Element                    ${Campo_Urgente}
    Click Element                    ${Botao_Buscar}

Então sistema exibe requisições do filtro Urgente
    Wait Until Element Is Visible    (//th[contains(@class,'h-12 px-4 align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0 text-center')])[1]

# --2.7
E seleciono Nível de urgência "Alto"
    Wait Until Element Is Visible    //button[contains(@id,'nivel_urgencia')]
    Click Element                    //button[contains(@id,'nivel_urgencia')]
    Click Element                    ${Campo_Nivel_Urgencia}
    Click Element                    ${Botao_Buscar}