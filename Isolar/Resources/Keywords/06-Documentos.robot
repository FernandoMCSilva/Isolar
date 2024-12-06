*** Settings ***
Documentation      Modúlo que Gerencie informações cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${menu_DocumentosGerados}                //a[contains(.,'Documentos gerados')]
${menu_Assinaturas}                      //a[contains(.,'Assinaturas')]
${menu_Criardocumentos}                  (//div[contains(.,'Criar documento')])[9]
${menu_CriarDocumento_Jurídico}          //button[contains(.,'Jurídico')]

${combobox_Departamento_Documentos}      (//button[contains(@type,'button')])[9]

${input_Criador}                 //input[@placeholder='Nome do criador ...']
${filtro_TipoDocumento}          (//button[contains(.,'Selecione')])[1]
${filtro_DataRegistro}           //span[contains(.,'Selecione a data')]
${filtro_OrigemAssinatura}       //button[@id='origem']
${filtro_Status_Documentos}      //button[@id='status']
${filtro_Assinante}              //input[@id='assinante']
${filtro_Observador}             //input[@id='observador']
${filtro_CardsLista_Documentos}  //button[contains(.,'Cards')]
${filtro_Buscar}                 //input[@placeholder='Buscar...']

@{opcoes_Departamento}        (//div[contains(.,'Compras')])[5]    (//div[contains(.,'Administrativo')])[5]              (//div[contains(.,'TI')])[5]          (//div[contains(.,'Logística')])[5]    (//div[contains(.,'Jurídico')])[5]
...    (//div[contains(.,'Departamento pessoal')])[5]        (//div[contains(.,'ENG.CIVIL')])[5]    (//div[contains(.,'CS-Customer Success')])[5]
@{opcoes_OrigemAssinatura}    (//div[contains(.,'Documentos')])[14]    (//div[contains(.,'Externos')])[5]    (//div[contains(.,'Minerando Sol')])[5]    (//div[contains(.,'Estimativa')])[11]    

${botao_VerDocumento}            (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[4]
${botao_StatusAssinatura}        (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[5]
${botao_Rubrica}                 (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[17]
${botao_GerarAssinatura}         (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10'])[9]
${botao_VerdocumentoERROR}       (//button[@data-state='closed'])[15] 
${botao_StatusAssinaturaError}   (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-destructive text-destructive-foreground hover:bg-destructive/90 h-10 w-10')])[3]
${botao_StatusAssinaturaError2}  (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 w-10')])[1]
${botao_Criar}                   //button[contains(.,'Criar')]
${botao_DocumentoOriginal}       //button[contains(.,'Documento original')]
${botao_EditarCampos}            //button[contains(.,'Editar campos')]
${botao_GerarDocumento}          //button[contains(.,'Gerar Documento')]
${botao_VerTemplate_Documentos}  //button[contains(.,'Ver template')]
${botao_PreencherDocumento}      //button[contains(.,'Preencher documento')]
${botao_BaixarTemplateEditável}  //button[contains(.,'Baixar Template editável')]

${CAMINHO_ARQUIVO}               "C:\Users\silva\Downloads\teste.pdf"
${nome_teste}                    teste
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
    Wait Until Page Contains    text=Status da assinatura - 7

# -06.01.09
E clico no botão Rubrica
    Wait Until Element Is Visible    ${botao_Rubrica}
    Click Element                    ${botao_Rubrica}

Então sistema exibe informações de botão Rubrica
    Wait Until Page Contains    text=Adicionar rubrica - 20

# -06.01.10
Quando clico no botão Próximo
    Wait Until Element Is Visible   ${Botao_Proximo_Requisicoes} 
    Click Element                   ${Botao_Proximo_Requisicoes}

Então sistema exibe informações de botão Próximo
    Wait Until Element Is Visible    //td[contains(.,'13')]

# -06.01.11
Então sistema exibe informações de botão Anterior
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Not Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior não está visível. Funcionou.
    ...    ELSE    Log    "Botão Anterior ainda está visível. Falhou."    WARN
    
# -06.01.12
E preencho filtro criador
    Wait Until Element Is Visible    ${input_Criador}
    Input Text                       ${input_Criador}    Fernando Morais da Costa Silva
    Sleep    1s
E clico no botão Ver Documento (ERROR)
    Wait Until Element Is Visible    ${botao_VerdocumentoERROR}
    Click Element                    ${botao_VerdocumentoERROR}

Então sistema exibe informações de botão Ver Documento (ERROR)
    Wait Until Page Contains    text=Documento não encontrado.

# -06.01.13
E clico no botão Status da assinatura (ERROR)
    Wait Until Element Is Visible    ${botao_StatusAssinaturaError}
    Click Element                    ${botao_StatusAssinaturaError}

Então sistema exibe informações de botão Status da assinatura (ERROR)
    Wait Until Page Contains    text=Sem assinatura.
    
# -06.01.14
E clico no botão Gerar link de assinatura (ERROR)
    Wait Until Element Is Visible    ${botao_StatusAssinaturaError2}
    Click Element                    ${botao_StatusAssinaturaError2}

Então sistema exibe informações de botão Gerar link de assinatura (ERROR)
    Wait Until Page Contains    text=Link já foi gerado.

# -06.01.15
E clico no botão Gerar link de assinatura
    Wait Until Element Is Visible    ${botao_GerarAssinatura}
    Click Element                    ${botao_GerarAssinatura}

Então sistema exibe informações de botão Gerar link de assinatura
    Wait Until Page Contains    text=ZapSign - 3

# -06.02.01
Clico no menu "Assinaturas"
    Wait Until Element Is Visible    ${menu_Assinaturas}
    Click Element                    ${menu_Assinaturas}
    Sleep    5s

Então sistema exibe informações de menu Assinaturas
    Wait Until Page Contains    text=Informações referentes as assinaturas gerados no sistema.

# -06.02.02
E preencho informações de filtro Origem da assinatura
    Wait Until Element Is Visible    ${filtro_OrigemAssinatura}
    Click Element                    ${filtro_OrigemAssinatura}
    Click Element                    (//div[contains(.,'Minerando Sol')])[5]

Então sistema exibe informações de filtro Origem da assinatura
    Wait Until Element Is Visible    //span[contains(.,'Doc')]

# -06.02.03
E preencho informações de filtro Status
    Wait Until Element Is Visible    ${filtro_Status_Documentos}
    Click Element                    ${filtro_Status_Documentos}
    Click Element                    (//div[contains(.,'Assinado')])[5]

Então sistema exibe informações de filtro Status
    Wait Until Element Is Visible    (//span[contains(.,'Contrato ativo')])[1]

# -06.02.04
E preencho informações de filtro Assinante
    Wait Until Element Is Visible    ${filtro_Assinante}
    Input Text                       ${filtro_Assinante}    Teste

Então sistema exibe informações de filtro Assinante
    Wait Until Element Is Visible    (//span[contains(.,'Teste')])[1]

# -06.02.05
E preencho informações de filtro Observador
    Wait Until Element Is Visible    ${filtro_Observador}
    Input Text                       ${filtro_Observador}    a

Então sistema exibe informações de filtro Observador
    Wait Until Page Contains    text=Registros carregados com sucesso!

# -06.02.06
Quando seleciono opção Cards ou Lista "Lista"
    Wait Until Element Is Visible    ${filtro_CardsLista_Documentos}
    Click Element                    ${filtro_CardsLista_Documentos}
    Click Element                    (//div[contains(.,'Lista')])[5]

# -06.02.08
Então sistema exibe próximas Assinaturas
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior está visível. Funcionou."
    ...    ELSE    Log    "Botão Anterior não está visível. Falhou."    WARN

# -06.02.09
Então sistema exibe Assinaturas anteriores
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Not Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    Log    "Botão Anterior não está visível. Funcionou.
    ...    ELSE    Log    "Botão Anterior ainda está visível. Falhou."    WARN

# -06.02.10
Quando clico no botão Criar
    Wait Until Element Is Visible    ${botao_Criar}
    Click Element                    ${botao_Criar}

# E ralizo o upload do arquivo
#     Wait Until Element Is Visible        timeout=10
#     Choose File        ${CAMINHO_ARQUIVO}
#     Sleep    5s
    
# -06.02.10

E seleciono opção "link"
    Wait Until Element Is Visible    //button[contains(.,'Arquivo')]
    Click Element                    //button[contains(.,'Arquivo')]
    Click Element                    (//div[contains(.,'Link')])[5]

Então sistema abre input de link
    Wait Until Element Is Visible    //input[@placeholder='https://gruposiso.com.br/documentos/arquivopdf.pdf']
E preencho informação de filtro Buscar
    Wait Until Element Is Visible    (//button[@type='button'])[10]
    Click Element                    (//button[@type='button'])[10]
    Wait Until Element Is Visible    ${filtro_Buscar}
    Input Text                       ${filtro_Buscar}    teste
    
Então sistema exibe informações de filtro Buscar
    Sleep    2s
    Wait Until Element Is Visible    //span[contains(.,'Teste de Morais')]

# -06.02.11
Então sistema exibe tela de edição
    Wait Until Page Contains    text=Editar contrato

# -06.02.14
E clico em Documento original
    Wait Until Element Is Visible    ${botao_DocumentoOriginal}
    Click Element                    ${botao_DocumentoOriginal}

Então sistema exibe tela de Documento original
    Wait Until Element Is Not Visible    //h1[contains(.,'Documento')]

# -06.02.15
E clico em Editar campos
    Wait Until Element Is Visible    ${botao_EditarCampos}
    Click Element                    ${botao_EditarCampos}

Então sistema exibe tela de Editar campos
    Wait Until Element Is Visible    //h1[contains(.,'Documento')]

# -06.03.01
Clico no menu "Criar documento"
    Wait Until Element Is Visible    ${menu_Criardocumentos}
    Click Element                    ${menu_Criardocumentos}

E clico em "Compras"
    Wait Until Element Is Visible    //button[contains(.,'Compras')]
    Click Element                    //button[contains(.,'Compras')]
    Click Element                    //button[contains(.,'cadastro_2')]

Então sistema exibe informações de menu Criar documento
    Wait Until Page Contains    text=Preencha os campos abaixo e clique em preencher para baixar seu documento

# -06.03.02
E preencho informações de novo documento
    Wait Until Element Is Visible    (//input[@placeholder='Insira o valor do campo'])[1]
    Input Text                       (//input[@placeholder='Insira o valor do campo'])[1]    Teste
    Input Text                       (//input[@placeholder='Insira o valor do campo'])[2]    Teste

E clico em Gerar Documento
    Sleep    2s
    Wait Until Element Is Visible    ${botao_GerarDocumento}
    Click Element                    ${botao_GerarDocumento}

Então sistema exibe mensagem de documento gerado
    Wait Until Page Contains    text=Documentos não foram recebidos.

# -06.03.03
E clico em Ver template
    Wait Until Element Is Visible    ${botao_VerTemplate_Documentos}
    Click Element                    ${botao_VerTemplate_Documentos}

Então sistema exibe tela de Ver template
    Wait Until Element Is Visible    ${botao_VerTemplate_Documentos}

# -06.03.04
E clico em Preencher documento
    Wait Until Element Is Visible    ${botao_PreencherDocumento}
    Click Element                    ${botao_PreencherDocumento}

Então sistema exibe tela de Preencher documento
    Wait Until Page Contains    text=Você está preenchendo o seguinte documento:

# -06.03.05
E clico em "TI"
    Wait Until Element Is Visible    //button[contains(.,'TI')]
    Click Element                    //button[contains(.,'TI')]
    Click Element                    //button[contains(.,'rhivateste 4')]

Então sistema entra na tela de Criar Documento > TI
    Wait Until Page Contains    text=Preencha os campos abaixo e clique em preencher para baixar seu documento


    
E preencho informações de novo documento > TI
    Wait Until Element Is Visible    (//input[@placeholder='Insira o valor do campo'])[1]
    Input Text        //input[@id='CLIENTE']                     ${nome_teste} 
    Input Text        //input[contains(@id,'a')]                 1234
    Choose File       xpath=//input[@type='file' and @id='b']    C:\\Users\\silva\\Downloads\\teste.pdf   
    Input Text        //input[@id='RAZAO_SOCIAL']                ${nome_teste}
    Input Text        //input[@id='CNPJ_CLIENTE']                12123123000112
    Input Text        //input[@id='RUA_CLIENTE']                 ${nome_teste}
    Input Text        //input[@id='BAIRRO_CLIENTE']              ${nome_teste}
    Input Text        //input[@id='CIDADE_CLIENTE']              ${nome_teste}
    Input Text        //input[@id='ESTADO_CLIENTE']              ${nome_teste}
    Input Text        //input[@id='CEP_CLIENTE']                 28990204
    Input Text        //input[@id='REPRESENTANTE_LEGAL']         ${nome_teste}
    Input Text        //input[@id='CPF_REPRESENTANTE']           19895982771
    Input Text        //input[@id='TESTEMUNHA_CLIENTE']          ${nome_teste}
    Input Text        //input[@id='CPF_TESTEMUNHA']              19895982771
    
Então sistema Gera documento
    Wait Until Page Contains    text=Documentos não foram recebidos.
# -06.03.06
Então sistema exibe erro de campos obrigatórios não preenchidos
    Wait Until Page Contains    text=Por favor, preencha todos os campos obrigatórios.

# -06.03.03.01
E clico em "Jurídico"
    Wait Until Element Is Visible    ${menu_CriarDocumento_Jurídico}
    Click Element                    ${menu_CriarDocumento_Jurídico}
    Click Element                    //button[contains(.,'66b28755d0543')]

Então sistema entra na tela de Criar documento > Jurídico
    Wait Until Page Contains    text=Preencha os campos abaixo e clique em preencher para baixar seu documento

# -06.03.03.02
E preencho informações de novo documento > Jurídico
    Wait Until Element Is Visible    //input[@id='CLIENTE']
    Input Text                       //input[@id='CLIENTE']              ${nome_teste}
    Input Text                       //input[@id='RAZAO_SOCIAL']         ${nome_teste}
    Input Text                       //input[@id='CNPJ_CLIENTE']         12123123000112
    Input Text                       //input[@id='CPF_REPRESENTANTE']    12312312312


# -06.03.03.01