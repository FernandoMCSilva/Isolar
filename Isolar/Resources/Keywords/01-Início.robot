*** Settings ***
Documentation      Modúlo que Gerencie um resumo das informações cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Botao_Fila}        (//div[contains(.,'37')])[9]
${Botao_Producao}    (//div[contains(.,'Produção')])[9]
${Botao_Concluidas}  (//div[contains(.,'1495Concluídas')])[7]
${Botao_Paradas}     (//div[contains(.,'Paradas')])[9]
${Status_Fila}        Fila
${Status_Producao}    Produção
${Status_Concluidas}  Concluído
${Status_Paradas}     Parado
${Btn_Buscar}         //button[contains(.,'Buscar')]
@{DEPARTAMENTOS}    Todos    Comercial    Compras    Técnico    Administrativo    TI    Logística    Jurídico    

*** Keywords ***
# --1.1
Dado que clico no menu "Início"
    Wait Until Element Is Visible    ${MENU_INICIO}
    Click Element                    ${MENU_INICIO}

# --1.2
Quando clico em "Fila"
    Wait Until Element Is Visible    ${Botao_Fila}
    Click Element                    ${Botao_Fila}

Então sistema exibe requisições com status "Fila"
    Wait Until Element Is Visible    xpath=//td[contains(normalize-space(),'Fila')]       timeout=10s
    ${statuses}=    Get Webelements    xpath=//td[contains(normalize-space(),'Fila')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Be Equal As Strings    ${text}    ${Status_Fila}
    END

# --1.3
Quando clico em "Produção"
    Wait Until Element Is Visible    ${Botao_Producao}
    Click Element                    ${Botao_Producao}

Então sistema exibe requisições com status "Produção"
    Wait Until Element Is Visible    xpath=//td[contains(normalize-space(),'Produção')]       timeout=10s
    ${statuses}=    Get Webelements    xpath=//td[contains(normalize-space(),'Produção')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Be Equal As Strings    ${text}    ${Status_Producao}
    END

# --1.4
Quando clico em "Concluídas"
    Wait Until Element Is Visible    ${Botao_Concluidas}
    Click Element                    ${Botao_Concluidas}

Então sistema exibe requisições com status "Concluídas"
    Wait Until Element Is Visible    xpath=//td[contains(normalize-space(),'Concluído')]       timeout=10s
    ${statuses}=    Get Webelements    xpath=//td[contains(normalize-space(),'Concluído')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Be Equal As Strings    ${text}    ${Status_Concluidas}
    END

# --1.5
Quando clico em "Paradas"
    Wait Until Element Is Visible    ${Botao_Paradas}
    Click Element                    ${Botao_Paradas}

Então sistema exibe requisições com status "Paradas"
    Wait Until Element Is Visible    xpath=//td[contains(normalize-space(),'Parado')]       timeout=10s
    ${statuses}=    Get Webelements    xpath=//td[contains(normalize-space(),'Parado')]                                
    ${count}=    Get Length    ${statuses}
    Log    Número de elementos encontrados: ${count}
    FOR    ${status}    IN    @{statuses}
        ${text}=    Get Text    ${status}
        Log    Status encontrado: ${text}
        Should Be Equal As Strings    ${text}    ${Status_Paradas}
    END

# --1.6
Quando clico em "Departamento"
    Click Element               //button[@type='button'][contains(.,'Todos')]

E seleciono "Todos"
    Click Element                     //div[@role='option'][contains(.,'Todos')]

E valido todos os filtros de departamento
    FOR    ${departamento}    IN    @{DEPARTAMENTOS}
        Wait Until Element Is Visible    xpath=//button[@id='departament']    timeout=10s
        Execute JavaScript               document.getElementById('departament').click();
        Wait Until Element Is Visible    xpath=//div[@role='option'][contains(.,'${departamento}')]    timeout=10s
        Execute JavaScript               //div[@role='option'][contains(.,'${departamento}')].click();
        Sleep    2s
        Execute JavaScript               ${Btn_Buscar}.click();
        Wait Until Element Is Visible    xpath=//h2[contains(.,'Requisições por Status')]
        Log    Departamento ${departamento} validado com sucesso
    END

E clico em Buscar
    Execute JavaScript               ${Btn_Buscar}.click(); 

Então sistema exibe requisições do departamento
    Wait Until Element Is Visible     //h2[contains(.,'Requisições por Status')]

# --1.7
E preencho data inicial
    Sleep   2s
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[1]    timeout=10s
    Execute JavaScript    document.evaluate("(//input[@placeholder='DD/MM/YYYY'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value = '17/08/2024';
    Sleep   2s

E preencho data final
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[2]    timeout=10s
    Execute JavaScript    document.evaluate("(//input[@placeholder='DD/MM/YYYY'])[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value = '17/08/2024';
    Sleep   2s

Então sistema exibe requisições filtradas
    Mouse Over    xpath=(//canvas[contains(@width,'442')])[1]
    Wait Until Element Is Visible    xpath=//div[@class='tooltip-class']    timeout=5s
    Element Text Should Be    xpath=//div[@class='tooltip-class']    Requisições por Status: 2

    # Wait Until Element Is Visible     (//canvas[@height='383'])[1]
    Capture Element Screenshot        (//canvas[@height='383'])[1]