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
    Wait Until Element Is Visible    //button[@id='departament']      10s
    Execute JavaScript               ${Campo_Departamento}
    Click Element                    ${Botao_Buscar}

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