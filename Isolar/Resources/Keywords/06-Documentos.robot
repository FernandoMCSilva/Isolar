*** Settings ***
Documentation      Modúlo que Gerencie informações cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${menu_DocumentosGerados}                //a[contains(.,'Documentos gerados')]
${menu_Assinaturas}                      //a[contains(.,'Assinaturas')]
${menu_Criardocumentos}                  (//div[contains(.,'Criar documento')])[9]
${combobox_Departamento_Documentos}      (//button[contains(@type,'button')])[9]

${input_Criador}                 //input[@placeholder='Nome do criador ...']
${filtro_TipoDocumento}          (//button[contains(.,'Selecione')])[1]
${filtro_DataRegistro}           //span[contains(.,'Selecione a data')]

@{opcoes_Departamento}    (//div[contains(.,'Compras')])[5]    (//div[contains(.,'Administrativo')])[5]              (//div[contains(.,'TI')])[5]          (//div[contains(.,'Logística')])[5]    (//div[contains(.,'Jurídico')])[5]
...    (//div[contains(.,'Departamento pessoal')])[5]        (//div[contains(.,'ENG.CIVIL')])[5]    (//div[contains(.,'CS-Customer Success')])[5]

${botao_VerDocumento}            (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[4]
${botao_StatusAssinatura}        (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[17]
${botao_Rubrica}                 (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[6]

*** Keywords ***

# -06.01.01
Dado que clico no menu "Documentos"
    Wait Until Element Is Visible    ${MENU_DOCUMENTOS}
    Click Element                    ${MENU_DOCUMENTOS}

Clico no menu "Documentos geradados"
    Wait Until Element Is Visible    ${menu_DocumentosGerados}
    Click Element                    ${menu_DocumentosGerados}
 
Então sistema exibe informações de documentos gerados
    Wait Until Page Contains    text=Histórico dos documentos

# -06.01.02
E preencho informações de filtro criador
    Wait Until Element Is Visible    ${input_Criador}
    Input Text                       ${input_Criador}    ${nome_pesquisa_GruposConsumidores}

Então sistema exibe informações de filtro criador
    Wait Until Page Contains    text=Registros carregados com sucesso!

# -06.01.03
E seleciono opção de filtro Tipo de documento
    Wait Until Element Is Visible    ${filtro_TipoDocumento}
    Click Element                    ${filtro_TipoDocumento}
    Click Element                    (//div[contains(.,'teste')])[14]
    
Então sistema exibe informações de filtro Tipo de documento
    Wait Until Element Is Visible    (//p[contains(.,'teste')])[1]

# -06.01.04
E seleciono opção de filtro Departamento
    Wait Until Element Is Visible    ${combobox_Departamento_Documentos}    timeout=10s
    Click Element    ${combobox_Departamento_Documentos}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${combobox_Departamento_Documentos}

    FOR    ${departamento}    IN    @{opcoes_Departamento}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Page Contains    text=Histórico dos documentos    timeout=10s
            
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Wait Until Element Is Visible    ${combobox_Departamento_Documentos}
            Execute JavaScript    window.scrollTo(0, 0)
            # Reabre a combobox para a próxima iteração
            Click Element    ${combobox_Departamento_Documentos}
        END

Então sistema exibe informações de filtro Departamento
    Wait Until Page Contains    text=Histórico dos documentos

# -06.01.05
E seleciono opção de filtro Data de registro
    Click Element                     //button[contains(.,'Selecione a data')]
    Wait Until Element Is Visible     xpath=(//button[@type='button'])[11]
    Click Element                     xpath=(//button[@type='button'])[11]    # Clica na seta para voltar
    Click Element                     xpath=(//button[@type='button'])[11]    # Clica na seta para voltar
    Click Element                     xpath=(//button[@type='button'])[11]    # Clica na seta para voltar
    Sleep    1s    # Aguarda um segundo antes de verificar novamente
        
    # Sai do loop e clica no dia 1 de setembro e 31 de outubro
    Click Element    (//button[contains(.,'1')])[1]
    Click Element    (//button[@type='button'])[80]
    Wait Until Element Is Visible    (//li[contains(.,'Registros carregados com sucesso!')])[1]
    Click Element                    (//li[contains(.,'Registros carregados com sucesso!')])[1]
    Sleep    2s

Então sistema exibe informações de filtro Data de registro
    Wait Until Element Is Visible    (//td[contains(.,'20')])[1]
    Sleep    1s 

# -06.01.06
E clico no botão Ver Documento
    Wait Until Element Is Visible    ${botao_VerDocumento}
    Click Element                    ${botao_VerDocumento}

Então sistema exibe informações de botão Ver Documento
    Wait Until Page Contains    text=Documento

# -06.01.07


# -06.01.08
E preencho informações do filtro criador
    Wait Until Element Is Visible    ${input_Criador}
    Input Text                       ${input_Criador}    Rhiva Cordeiro

E clico no botão Status da assinatura
    Execute Javascript     scrollTo(0,0)
    Wait Until Element Is Visible    ${botao_StatusAssinatura}
    Click Element                    ${botao_StatusAssinatura}

Então sistema exibe informações de botão Status da assinatura
    Wait Until Page Contains    text=Status da assinatura - 20

# -06.01.01