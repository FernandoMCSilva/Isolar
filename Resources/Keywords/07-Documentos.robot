*** Settings ***
Documentation      Modúlo que Gerencie informações cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${menu_DocumentosGerados}                //a[contains(.,'Documentos gerados')]
${menu_Assinaturas}                      //a[contains(.,'Assinaturas')]
${menu_Criardocumentos}                  //button[contains(.,'Criar Documento')]
${menu_CriarDocumento_Jurídico}          //button[contains(.,'Jurídico')]

${combobox_Departamento_Documentos}      (//button[@type='button'])[11]

${input_Criador}                     //input[@placeholder='Nome do criador ...']
${filtro_TipoDocumento}              (//button[contains(.,'Selecione')])[1]
${filtro_DataRegistro_Documentos}    (//button[@type='button'])[12]
${filtro_OrigemAssinatura}           //button[@id='origem']
${filtro_Status_Documentos}          //button[@id='status']
${filtro_Assinante}                  //input[@id='assinante']
${filtro_Observador}                 //input[@id='observador']
${filtro_CardsLista_Documentos}      //button[contains(.,'Cards')]
${filtro_Buscar}                     //input[@placeholder='Buscar...']

@{opcoes_Departamento}              (//div[contains(.,'Comercial')])[5]    (//div[contains(.,'Administrativo')])[5]    (//div[contains(.,'TI')])[5]          (//div[contains(.,'Logística')])[5]    (//div[contains(.,'Jurídico')])[5]
@{opcoes_OrigemAssinatura}          (//div[contains(.,'Documentos')])[14]    (//div[contains(.,'Externos')])[5]    (//div[contains(.,'Minerando Sol')])[5]    (//div[contains(.,'Estimativa')])[11]    

${botao_VerDocumento}               (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[4]
${botao_StatusAssinatura}           //table[contains(@class,'caption-bottom text-sm')]/tbody[1]/tr[1]/td[7]/button[1]
${botao_Rubrica}                    (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[6]
${botao_GerarAssinatura}            (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10'])[3]
${botao_VerdocumentoINATÍVO}        (//button[@data-state='closed'])[19]
${botao_GerarAssinaturaINATÍVO}     (//button[@data-state='closed'])[14]
${botao_StatusAssinaturaINATÍVO}    (//button[@data-state='closed'])[15]
${botao_Criar}                      (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2')])[1]
${botao_DocumentoOriginal}          //button[contains(.,'Documento original')]
${botao_EditarCampos}               //button[contains(.,'Editar campos')]
${botao_GerarDocumento}             //button[contains(.,'Gerar Documento')]
${botao_VerTemplate_Documentos}     //button[contains(.,'Ver template')]
${botao_PreencherDocumento}         //button[contains(.,'Preencher documento')]
${botao_BaixarTemplateEditável}     //button[contains(.,'Baixar Template editável')]
${botao_Deletar}                    (//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:text-accent-foreground h-10 w-10 hover:bg-red-900'])[1]
${botao_CancelarDocumentos}         (//button[normalize-space()='Cancelar'])[1]



${AssinaturaTradicional}            (//button[normalize-space()='Assinatura Tradicional'])[1]

${CAMINHO_ARQUIVO}                  "C:\Users\silva\Downloads\teste.pdf"
${nome_teste}                       teste
${NOME_CRIADOR}                     Fernando QA
${link_Token}                       https://dev.grupoiso.com.br/storage/uploads/docs/67ae4ad0d5083.pdf

${dia1}                             (//button[@name='day'][normalize-space()='1'])[1]
${dia28}                            (//button[@class='rdp-button_reset rdp-button inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-9 w-9 p-0 font-normal aria-selected:opacity-100 bg-accent text-accent-foreground'])[1]


*** Keywords ***

# -07.01.01
Dado que clico no menu "Documentos"
    Wait Until Element Is Visible    ${MENU_DOCUMENTOS}
    Click Element                    ${MENU_DOCUMENTOS}

Clico no menu "Documentos geradados"
    Wait Until Element Is Visible    ${menu_DocumentosGerados}
    Click Element                    ${menu_DocumentosGerados}
 
Então sistema exibe informações de documentos gerados
    Wait Until Page Contains    text=Histórico dos documentos

# -07.01.02
E preencho informações de filtro criador
    Wait Until Element Is Visible    ${input_Criador}
    Input Text                       ${input_Criador}    ${NOME_CRIADOR}

Então sistema exibe informações de filtro criador
    Wait Until Element Is Visible    //td[contains(.,'Fernando QA')]

# -07.01.03
E seleciono opção de filtro Tipo de documento
    Wait Until Element Is Visible    ${filtro_TipoDocumento}
    Sleep    2s
    Click Element                    ${filtro_TipoDocumento}
    Wait Until Element Is Visible    xpath=//div[@role="option" and normalize-space(.)="P"]
    Click Element                    xpath=//div[@role="option" and normalize-space(.)="P"]
    
Então sistema exibe informações de filtro Tipo de documento
    Wait Until Element Is Visible    //td[contains(.,'Fernando QA')]

# -07.01.04
E seleciono opção de filtro Departamento
    Wait Until Element Is Visible    ${combobox_Departamento_Documentos}    timeout=10s
    Sleep    1s
    Click Element    ${combobox_Departamento_Documentos}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${combobox_Departamento_Documentos}

    FOR    ${departamento}    IN    @{opcoes_Departamento}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            Sleep    1s 
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

# -07.01.05
E seleciono opção de filtro Data de registro
    Sleep    1s
    Click Element                     ${filtro_DataRegistro_Documentos}
    Wait Until Element Is Visible     (//button[@type='button'])[13]
    FOR    ${i}    IN RANGE    1
        Click Element    (//button[@type='button'])[13]
        Sleep    0.5s
    END
    Wait Until Page Contains          text=maio 2025
    Sleep    1s
    Click Element                    ${dia1}
    Click Element                    ${dia28}

Então sistema exibe informações de filtro Data de registro
    Wait Until Element Is Visible    (//td[contains(.,'05/05/2025')])[1]
    Sleep    1s 

# -07.01.06
E clico no botão Ver Documento
    Sleep    2s
    Wait Until Element Is Visible    ${botao_VerDocumento}
    Click Element                    ${botao_VerDocumento}

Então sistema exibe informações de botão Ver Documento
    Wait Until Page Contains    text=Documento

# -07.01.07
E preencho filtro criador em Documentos
    Wait Until Element Is Visible    //input[contains(@id,'criador')]
    Input Text                       //input[contains(@id,'criador')]    Fernando QA

# -07.01.08
E preencho informações do filtro criador
    Wait Until Element Is Visible    ${input_Criador}
    Input Text                       ${input_Criador}    Rhiva Cordeiro

E clico no botão Status da assinatura
    Execute Javascript     scrollTo(0,0)
    Wait Until Element Is Visible    ${botao_StatusAssinatura}
    Click Element                    ${botao_StatusAssinatura}

Então sistema exibe informações de botão Status da assinatura
    Wait Until Page Contains    text=Status da assinatura - 6

# -07.01.09
E clico no botão Rubrica
    Wait Until Element Is Visible    ${botao_Rubrica}
    Click Element                    ${botao_Rubrica}

Então sistema exibe informações de botão Rubrica
    Sleep    4s
    Wait Until Page Contains    text=Adicionar rubrica - 6

# -07.01.10
Quando clico no botão Próximo
    Wait Until Element Is Visible   ${Botao_Proximo_Requisicoes} 
    Click Element                   ${Botao_Proximo_Requisicoes}

Então sistema exibe informações de botão Próximo
    Wait Until Element Is Visible    //td[contains(.,'13')]

# -07.01.11
Então sistema exibe informações de botão Anterior
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Not Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    No Operation
    
# -07.01.12
E preencho filtro criador
    Wait Until Element Is Visible    ${input_Criador}
    Input Text                       ${input_Criador}    Fernando Morais da Costa Silva
    Sleep    1s

E clico no botão Ver Documento (INATÍVO)
    Sleep    1s
    Wait Until Element Is Visible    ${botao_VerdocumentoINATÍVO}
    Click Element                    ${botao_VerdocumentoINATÍVO}

Então sistema exibe informações de botão Ver Documento (INATÍVO)
    Wait Until Page Contains    text=Documento não encontrado.

# -07.01.13
E clico no botão Status da assinatura (INATÍVO)
    Wait Until Element Is Visible    ${botao_StatusAssinaturaINATÍVO}
    Click Element                    ${botao_StatusAssinaturaINATÍVO}

Então sistema exibe informações de botão Status da assinatura (INATÍVO)
    Wait Until Page Contains    text=Sem assinatura.
    
# -07.01.14
E clico no botão Gerar link de assinatura (INATÍVO)
    Wait Until Element Is Visible    ${botao_GerarAssinaturaINATÍVO}
    Click Element                    ${botao_GerarAssinaturaINATÍVO}

Então sistema exibe informações de botão Gerar link de assinatura (INATÍVO)
    Wait Until Page Contains    text=Sem assinatura.

# -07.01.15
E clico no botão Gerar link de assinatura
    Sleep    1s
    Wait Until Element Is Visible    ${botao_GerarAssinatura}
    Click Element                    ${botao_GerarAssinatura}

E clico em Assinatura Tradicional
    Sleep    1s
    Wait Until Element Is Visible    ${AssinaturaTradicional}
    Click Element                    ${AssinaturaTradicional}

Então sistema exibe informações de botão Gerar link de assinatura
    Wait Until Page Contains    text=ZapSign - 158

E clico no botão Deletar
    Sleep    1s
    Wait Until Element Is Visible    ${botao_Deletar}
    Click Element                    ${botao_Deletar} 

E clico em Cancelar
    Wait Until Element Is Visible    ${botao_CancelarDocumentos}
    Click Element                    ${botao_CancelarDocumentos}
    Sleep    1s
    
    Wait Until Element Is Visible    ${botao_CancelarDocumentos}
    Click Element                    ${botao_CancelarDocumentos}
    Sleep    1s

# -07.02.01
Clico no menu "Assinaturas"
    Wait Until Element Is Visible    ${menu_Assinaturas}
    Click Element                    ${menu_Assinaturas}
    Sleep    5s

Então sistema exibe informações de menu Assinaturas
    Wait Until Page Contains    text=Informações referentes as assinaturas gerados no sistema.

# -07.02.02
E preencho informações de filtro Origem da assinatura
    Wait Until Element Is Visible    ${filtro_OrigemAssinatura}
    Click Element                    ${filtro_OrigemAssinatura}
    Click Element                    (//div[contains(.,'Externos')])[5]

Então sistema exibe informações de filtro Origem da assinatura
    Wait Until Page Contains    text=testando sasine

# -07.02.03
E preencho informações de filtro Status
    Wait Until Element Is Visible    ${filtro_Status_Documentos}
    Click Element                    ${filtro_Status_Documentos}
    Click Element                    (//div[contains(.,'Assinado')])[5]

Então sistema exibe informações de filtro Status
    Wait Until Element Is Visible    (//p[contains(.,'Contrato ativo')])[2]

# -07.02.04
E preencho informações de filtro Assinante
    Wait Until Element Is Visible    ${filtro_Assinante}
    Input Text                       ${filtro_Assinante}    teste

Então sistema exibe informações de filtro Assinante
    Wait Until Page Contains    text=Teste homologação
    
# -07.02.05
E aguardo menu Documentos > Assinaturas
    Sleep    10s
    Wait Until Page Contains    text=Informações referentes as assinaturas gerados no sistema.


E preencho informações de filtro Observador
    Wait Until Element Is Visible    ${filtro_Observador}
    Input Text                       ${filtro_Observador}    teste123

Então sistema exibe informações de filtro Observador
    Wait Until Page Contains    text=teste123

# -07.02.06
Quando seleciono opção Cards ou Lista "Lista"
    Wait Until Element Is Visible    ${filtro_CardsLista_Documentos}
    Click Element                    ${filtro_CardsLista_Documentos}
    Click Element                    (//div[contains(.,'Lista')])[5]

# -07.02.08
Então sistema exibe próximas Assinaturas
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    No Operation
     
# -07.02.09
Então sistema exibe Assinaturas anteriores
    ${botao_anterior_visivel}    Run Keyword And Return Status    Element Should Not Be Visible    //button[contains(.,'Anterior')]
     Run Keyword If    ${botao_anterior_visivel}    No Operation

# -07.02.10
Quando clico no botão Criar
    Wait Until Element Is Visible    ${botao_Criar}
    Click Element                    ${botao_Criar}

E faço upload de arquivo teste
    Wait Until Element Is Visible    (//button[@type='button'])[9]
    Click Element                    (//button[@type='button'])[9]
    Click Element                    (//div[contains(.,'Link')])[5]
    Sleep    1s
    Execute JavaScript     Set Clipboard Text    https://dev.grupoiso.com.br/storage/uploads/docs/67ae4ad0d5083.pdf
    Click Element         //input[contains(@type,'url')]
    Press Keys            //input[contains(@type,'url')]    CTRL+v
    # # Input Text       (//input[contains(@class,'flex h-10 w-full !max-w-none rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-muted-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pr-')])[2]    ${nome_pesquisa_GruposConsumidores}                    
    # Input Text       //input[@placeholder='DD/MM/YYYY']    07062025

    # Click Element    //button[contains(.,'Enviar Doc')]
E seleciono opção "link"
    Sleep    2s
    Wait Until Element Is Visible    //button[contains(.,'Arquivo')]
    Click Element                    //button[contains(.,'Arquivo')]
    Click Element                    (//div[contains(.,'Link')])[5]

Então sistema exibe tela final de rubrica
    Wait Until Page Contains    text=Terá Rubricas?

# -07.02.11
E preencho informação de filtro Buscar
    Wait Until Element Is Visible    (//button[@type='button'])[12]
    Click Element                    (//button[@type='button'])[12]
    Wait Until Element Is Visible    ${filtro_Buscar}
    Input Text                       ${filtro_Buscar}    teste
    
Então sistema exibe informações de filtro Buscar
    Sleep    2s
    Wait Until Element Is Visible    //p[contains(.,'teste123')]

Então sistema exibe tela de edição
    Wait Until Page Contains    text=Editar contrato

# -07.02.13
E clico em Documento original
    Wait Until Element Is Visible    ${botao_DocumentoOriginal}
    Click Element                    ${botao_DocumentoOriginal}

Então sistema exibe tela de Documento original
    Wait Until Element Is Not Visible    //h1[contains(.,'Documento')]

# -07.02.14
E clico em Editar campos
    Wait Until Element Is Visible    ${botao_EditarCampos}
    Click Element                    ${botao_EditarCampos}

Então sistema exibe tela de Editar campos
    Wait Until Element Is Visible    //h1[contains(.,'Documento')]

# -07.03.01
Clico no menu "Criar documento"
    Wait Until Element Is Visible    ${menu_Criardocumentos}
    Click Element                    ${menu_Criardocumentos}

E clico em "Compras"
    Wait Until Element Is Visible    //button[contains(.,'Compras')]
    Click Element                    //button[contains(.,'Compras')]

Então sistema exibe informações de menu Criar documento
    Wait Until Page Contains    text=Escolha o tipo de documento que deseja gerar.

# -07.03.02
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

# -07.03.03
E clico em Ver template
    Wait Until Element Is Visible    ${botao_VerTemplate_Documentos}
    Click Element                    ${botao_VerTemplate_Documentos}

Então sistema exibe tela de Ver template
    Wait Until Element Is Visible    ${botao_VerTemplate_Documentos}

# -07.03.04
E clico em Preencher documento
    Wait Until Element Is Visible    ${botao_PreencherDocumento}
    Click Element                    ${botao_PreencherDocumento}

Então sistema exibe tela de Preencher documento
    Wait Until Page Contains    text=Você está preenchendo o seguinte documento:

# -07.03.05
E clico em "Comercial"
    Wait Until Element Is Visible    //button[contains(.,'Comercial')]
    Click Element                    //button[contains(.,'Comercial')]

Então sistema entra na tela de Criar Documento > Comercial
    Wait Until Page Contains    text=Escolha o tipo de documento que deseja gerar.

E preencho informações de novo documento > Comercial
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
# -07.03.06
Então sistema exibe erro de campos obrigatórios não preenchidos
    Wait Until Page Contains    text=Por favor, preencha todos os campos obrigatórios.

# -07.03.01
E clico em "Jurídico"
    Wait Until Element Is Visible    ${menu_CriarDocumento_Jurídico}
    Click Element                    ${menu_CriarDocumento_Jurídico}

E preencho informação de criar documento Jurídico
    Sleep    1s
    Click Element    (//button[contains(.,'P')])[2]
    Sleep    1.5s

    Wait Until Element Is Visible    (//input[@id='razao_social'])[1]
    Input Text                       (//input[@id='razao_social'])[1]    teste
    
    Wait Until Element Is Visible    (//input[@id='numero_uc'])[1]
    Input Text                       (//input[@id='numero_uc'])[1]    123

    Wait Until Element Is Visible    (//input[@id='dia'])[1]
    Input Text                       (//input[@id='dia'])[1]    07

    Wait Until Element Is Visible    (//input[@id='mes'])[1]
    Input Text                       (//input[@id='mes'])[1]    06
    
    Wait Until Element Is Visible    (//input[@id='ano'])[1]
    Input Text                       (//input[@id='ano'])[1]    2025
    
    Wait Until Element Is Visible    (//input[@id='cnpj'])[1]
    Input Text                       (//input[@id='cnpj'])[1]    1231231231321
    Sleep    1s

    Wait Until Element Is Visible    (//input[@id='rua_pj'])[1]
    Input Text                       (//input[@id='rua_pj'])[1]    teste
    Sleep    1s

    Wait Until Element Is Visible    (//input[@id='numero_endereco_pj'])[1]
    Input Text                       (//input[@id='numero_endereco_pj'])[1]    1231231231321
    Sleep    1s

    Wait Until Element Is Visible    (//input[@id='bairro_pj'])[1]
    Input Text                       (//input[@id='bairro_pj'])[1]    teste
    Sleep    1s

    Wait Until Element Is Visible    (//input[@id='municipio_pj'])[1]
    Input Text                       (//input[@id='municipio_pj'])[1]    teste
    Sleep    1s

    Wait Until Element Is Visible    (//input[@id='estado_pj'])[1]
    Input Text                       (//input[@id='estado_pj'])[1]    RJ
    
    Wait Until Element Is Visible    (//input[@id='cep_pj'])[1]
    Input Text                       (//input[@id='cep_pj'])[1]    28990204

    Wait Until Element Is Visible    (//input[@id='nome'])[1]
    Input Text                       (//input[@id='nome'])[1]    teste
    
    Wait Until Element Is Visible    (//input[@id='nacionalidade'])[1]
    Input Text                       (//input[@id='nacionalidade'])[1]    Brasieiro

    Wait Until Element Is Visible    (//input[@id='profissao'])[1]
    Input Text                       (//input[@id='profissao'])[1]    teste
    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='estado_civil'])[1]
    Input Text                       (//input[@id='estado_civil'])[1]    Solteiro

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='cpf'])[1]
    Input Text                       (//input[@id='cpf'])[1]    19895982771

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='rg'])[1]
    Input Text                       (//input[@id='rg'])[1]    222222222

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='rua'])[1]
    Input Text                       (//input[@id='rua'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='numero_endereco'])[1]
    Input Text                       (//input[@id='numero_endereco'])[1]    123

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='bairro'])[1]
    Input Text                       (//input[@id='bairro'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='municipio'])[1]
    Input Text                       (//input[@id='municipio'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='estado'])[1]
    Input Text                       (//input[@id='estado'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='cep'])[1]
    Input Text                       (//input[@id='cep'])[1]    28990204

    Wait Until Element Is Visible    (//input[@id='email_associado'])[1]
    Input Text                       (//input[@id='email_associado'])[1]    teste123@gmail.com

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='municip'])[1]
    Input Text                       (//input[@id='municip'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='mes_extenso'])[1]
    Input Text                       (//input[@id='mes_extenso'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='primeiro_nome'])[1]
    Input Text                       (//input[@id='primeiro_nome'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='data'])[1]
    Input Text                       (//input[@id='data'])[1]    07/06/2025

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='grupo_consumidor'])[1]
    Input Text                       (//input[@id='grupo_consumidor'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='distribuidora_local'])[1]
    Input Text                       (//input[@id='distribuidora_local'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='consumo'])[1]
    Input Text                       (//input[@id='consumo'])[1]    teste

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='login'])[1]
    Input Text                       (//input[@id='login'])[1]    teste123

    Sleep    0.5s
    Wait Until Element Is Visible    (//input[@id='senha'])[1]
    Input Text                       (//input[@id='senha'])[1]    Gi@979076609
    
#   Clicar no botão Gerar
    Sleep    0.5s
    Click Element    ${botao_GerarDocumento}


Então sistema exibe mensagem de documento criado
    Wait Until Page Contains    text=Documentos gerados com sucesso!

# -07.03.03.02
E preencho informações de novo documento > Jurídico
    Wait Until Element Is Visible    //input[@id='CLIENTE']
    Input Text                       //input[@id='CLIENTE']              ${nome_teste}
    Input Text                       //input[@id='RAZAO_SOCIAL']         ${nome_teste}
    Input Text                       //input[@id='CNPJ_CLIENTE']         12123123000112
    Input Text                       //input[@id='CPF_REPRESENTANTE']    12312312312

# -07.03.03.01