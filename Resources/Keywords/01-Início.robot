*** Settings ***
Documentation      Modúlo que Gerencie um resumo das informações cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
# botões
${Botao_Fila}          (//div[contains(.,'Fila')])[9] 
${Botao_Producao}      (//div[contains(.,'Produção')])[9]
${Botao_Concluidas}    (//div[contains(.,'Concluídas')])[9]
${Botao_Paradas}       (//div[contains(.,'Paradas')])[9]
${botao_Tema}          //button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10']//*[name()='svg']
${botao_SAC}           (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10 relative'])[1]
${botao_Notificacoes}  (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10 relative'])[2]
${Btn_Buscar}          //button[contains(.,'Buscar')]
${Btn_Departamentos}   //button[@id='departament']

# resultados esperados
${Tela_Inicio}         (//div[contains(.,'Gerencie um resumo das informações cadastradas no sistema.')])[7]
${Status_Fila}         Fila
${Status_Producao}     Produção
${Status_Concluidas}   Concluído
${Status_Paradas}      Parado


# arrays
${DEPARTAMENTOS_TOTAL}    1
@{DEPARTAMENTOS_OPTIONS}    //span[normalize-space(text())='Comercial ']    //span[normalize-space(text())='CS-Customer Success']

*** Keywords ***
# --1.1
Dado que clico no menu "Início"
    Wait Until Element Is Visible    ${MENU_INICIO}
    Click Element                    ${MENU_INICIO}
    
Então sistema exibe informações de requisições gerais
    Wait Until Element Is Visible    ${Tela_Inicio}

# --1.2
Quando clico em "Fila"
    Wait Until Element Is Visible    ${Botao_Fila}
    Click Element                    ${Botao_Fila}

Então sistema exibe requisições com status "Fila"
    Wait Until Element Is Visible    (//div[normalize-space()='Fila'])[1]

# --1.3
Quando clico em "Produção"
    Wait Until Element Is Visible    ${Botao_Producao}
    Click Element                    ${Botao_Producao}

Então sistema exibe requisições com status "Produção"
    Sleep    3s
    Wait Until Element Is Visible      xpath=//td[contains(normalize-space(),'Produção')]       timeout=10s
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
    Wait Until Element Is Visible    (//div[normalize-space()='Concluído'])[1]    timeout=20s
    
# --1.5
Quando clico em "Paradas"
    Wait Until Element Is Visible    ${Botao_Paradas}
    Click Element                    ${Botao_Paradas}

Então sistema exibe requisições com status "Paradas"
    Sleep    2s
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

E valido filtros de departamento
    Wait Until Element Is Visible    ${Btn_Departamentos}    timeout=10s
    FOR    ${index}    IN RANGE    ${DEPARTAMENTOS_TOTAL}
        # Abre a combobox
        Click Element    ${Btn_Departamentos}
        Sleep    0.5s

        # Pressiona setas para baixo conforme o índice
        FOR    ${i}    IN RANGE    ${index + 1}
            Press Key    ${Btn_Departamentos}    ARROW_DOWN
            Sleep    0.2s
        END

        # Pressiona ENTER para selecionar a opção
        Press Key    ${Btn_Departamentos}    ENTER

        # Espera a página atualizar
        Wait Until Element Is Visible    //h2[contains(.,'Requisições por Status')]    timeout=10s

        # (Opcional) Log da iteração
        Log    Departamento na posição ${index + 1} validado com sucesso
    END

E clico em Buscar
    Sleep    2s
    Wait Until Element Is Visible    ${Btn_Buscar}
    Click Element                    ${Btn_Buscar} 

Então sistema exibe requisições do departamento
    Wait Until Page Contains    text=Gerencie um resumo das informações cadastradas no sistema.

# --1.7
E preencho data inicial
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[1]    timeout=10s
    Input Text    (//input[@placeholder='DD/MM/YYYY'])[1]    01/06/2025
    Sleep   2s

E preencho data final
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[2]    timeout=10s
    Input Text    (//input[contains(@placeholder,'DD/MM/YYYY')])[2]    30/06/2025

Então sistema exibe requisições filtradas
    Wait Until Page Contains    text=2025-06
    Capture Page Screenshot

# --1.8
E clico no botão tema "Escuro"
    Wait Until Element Is Visible    ${botao_Tema}
    Click Element                    ${botao_Tema}

Então sistema exibe tela em tema "Escuro"
    Sleep    1s
    Wait Until Element Is Visible    ${botao_Tema}

# --1.9
E clico no botão SAC
    Sleep    1s
    Wait Until Element Is Visible    ${botao_SAC}
    Click Element                    ${botao_SAC}

Então sistema exibe tela de SAC
    Wait Until Page Contains    text=Envie-nos problemas ou sugestões para o sistema.

# --1.10
E clico no botão Notificações
    Wait Until Element Is Visible    ${botao_Notificacoes}
    Click Element                    ${botao_Notificacoes}

Então sistema exibe tela de Notificações
    ${tem_notificacoes}=    Run Keyword And Return Status    Page Should Contain    Notificações
    ${sem_notificacoes}=    Run Keyword And Return Status    Page Should Contain    Não há nenhuma notificação no momento

    Run Keyword If    '${tem_notificacoes}' == 'True'    Log    Notificações encontradas.
...    ELSE IF        '${sem_notificacoes}' == 'True'    Log    Nenhuma notificação cadastrada.
...    ELSE    Fail    Nenhum dos textos esperados foi encontrado!


    