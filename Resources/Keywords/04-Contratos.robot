*** Settings ***
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_ContratosDashBoard}                //a[contains(.,'Dashboard')]
${Menu_ContratosContratos}                //a[contains(.,'Contratos')]

${botao_FiltrarContratos}                 //button[contains(.,'Filtrar')]
${botao_Resetarfiltros}                   //button[contains(.,'Resetar filtros')]
${botao_Anexos}                           (//button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10')])[4]

${Departamento_ContratosDashboard}        //button[contains(.,'Selecione um departamento')]
${Filtro_+60Dias}                         //div[@class='inline-flex justify-center items-center flex-wrap gap-2 bg-green-600 rounded-full border p-2 text-xs capitalize leading-none text-white']
${Filtro_30Dias}                          (//span[contains(@class,'mr-1 inline-flex')])[2]
${Filtro_15Dias}                          (//div[contains(@class,'mb-3 flex')])[3]
${Filtro_Vencidos}                        (//div[@class='flex-1 p-6'])[4]
${Filtro_Indefinidos}                     (//div[@class='flex-1 p-6 items-center justify-center'])[1]
${Filtro_VigenciaInicial}                 //button[@id='vigencia_inicio']
${Filtro_VigenciaFinal}                   //button[@id='vigencia_fim']
${Filtro_Indice}                          //button[@id='indice_data']
${Filtro_TipoIndice}                      //input[@id='tipo_indice']
${Filtro_StatusIndice}                    //button[@id='status_indice']
${Filtro_EmpresaContratos}                //button[@id='empresa']
${Filtro_DepartamentoContratos}           //button[@id='departament']
${Filtro_DocumentoContratos}              //input[@id='documento']
${Filtro_NomeIndividuosContratos}         //input[@id='nome']
${Filtro_StatusVigenciaContratos}         //button[@id='status_vigencia']
${Filtro_PaginaFiltro}                    //button[@id='pag']


*** Keywords ***       
# -4.1.1
Dado que clico no menu Contratos > Dashboard
    Wait Until Element Is Visible    ${MENU_CONTROLECONTRATORS}
    Click Element                    ${MENU_CONTROLECONTRATORS}
    Wait Until Element Is Visible    ${Menu_ContratosDashBoard}
    Click Element                    ${Menu_ContratosDashBoard}

Então sistema exibe tela de Contratos > Dashboard
    Wait Until Page Contains    text=Controle de contratos

# -4.1.2
Dado que clico no menu Contratos > Dashboard > Dashboard
    Wait Until Element Is Visible    locator

E preencho Vigência de:
    Sleep    1s
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[1]
    Input Text                       (//input[@placeholder='DD/MM/YYYY'])[1]    07062024
    Input Text                       (//input[@placeholder='DD/MM/YYYY'])[2]    01042024

E preencho Vigência até:
    Wait Until Element Is Visible    (//input[@placeholder='DD/MM/YYYY'])[2]
    Input Text                       (//input[@placeholder='DD/MM/YYYY'])[2]    01042026
    Click Element                    ${botao_FiltrarContratos}

Então sistema exibe número de contratos 
    Wait Until Element Is Visible    (//div[contains(.,'4')])[9]

# -4.1.3
E valido filtro departamento em Contratos > Dashboard
    Wait Until Element Is Visible    ${Departamento_ContratosDashboard}
    Click Element                    ${Departamento_ContratosDashboard}
    Click Element                    (//div[contains(.,'Administrativo')])[5]
    Click Element                    ${botao_FiltrarContratos}
Então sistema exibe requisições do departamento em Contratos > Dashboard
    Wait Until Element Is Visible    //h3[contains(.,'Administrativo')]

# -4.1.4

Quando clico no filtro "+60 dias"
    Wait Until Element Is Visible    ${Filtro_+60Dias}
    Click Element                    ${Filtro_+60Dias}

Então sistema exibe informações de filtro "+60 dias"
    Wait Until Element Is Visible    //button[contains(.,'+60 dias')]

# -4.1.5
Quando clico no filtro "30 dias"
    Wait Until Element Is Visible    ${Filtro_30Dias}
    Click Element                    ${Filtro_30Dias}

Então sistema exibe informações de filtro "30 dias"
    Wait Until Element Is Visible    //button[contains(.,'30 dias')]

# -4.1.6
Quando clico no filtro "15 dias"
    Wait Until Element Is Visible    ${Filtro_15Dias}
    Click Element                    ${Filtro_15Dias}

Então sistema exibe informações de filtro "15 dias"
    Wait Until Element Is Visible    //button[contains(.,'15 dias')]

# -4.1.7
Quando clico no filtro "Vencidos"
    Wait Until Element Is Visible    ${Filtro_Vencidos}
    Click Element                    ${Filtro_Vencidos}

Então sistema exibe informações de filtro "Vencidos"
    Wait Until Element Is Visible    //button[contains(.,'Vencidos')]

# -4.1.7
Quando clico no filtro "Indefinidos"
    Wait Until Element Is Visible    ${Filtro_Indefinidos}
    Click Element                    ${Filtro_Indefinidos}

Então sistema exibe informações de filtro "Indefinidos"
    Wait Until Element Is Visible    //button[contains(.,'Indefinidos')]

# -4.2.1
Dado que clico no menu Contratos > Contratos
    Wait Until Element Is Visible    ${MENU_CONTROLECONTRATORS}
    Click Element                    ${MENU_CONTROLECONTRATORS}
    Wait Until Element Is Visible    ${Menu_ContratosContratos}
    Click Element                    ${Menu_ContratosContratos}

Então sistema exibe informações de cadastros de Contratos 
    Wait Until Page Contains    text=Controle de Contratos

# -4.2.2
E preencho informação de filtro Vigência inicial
    Wait Until Element Is Visible    ${Filtro_VigenciaInicial}
    Click Element                    ${Filtro_VigenciaInicial}
    FOR     ${i}    IN RANGE     5
        Click Element    (//button[@type='button'])[19]
        Sleep    0.5s
    END
    Sleep    1s
    Click Element    (//button[contains(.,'1')])[2]
    Sleep    1s
    Click Element    (//button[contains(.,'31')])[3]
    Click Element    ${Filtro_VigenciaInicial}

Então sistema exibe informações de filtro Vigência inicial
    Wait Until Element Is Visible    //td[contains(.,'06/01/2025')]

# -4.2.3
E preencho informação de filtro Vigência final
    Wait Until Element Is Visible    ${Filtro_VigenciaFinal}
    Click Element                    ${Filtro_VigenciaFinal}
    # Click Element                    //table[contains(@class,'w-full border-collapse')]/tbody[1]/tr[6]/td[1]/button[1]
    Sleep    1s
    FOR     ${i}    IN RANGE     12
        Click Element    (//div[contains(@class,'space-x-1 flex')]//button)[2]
        Sleep    0.3s
    END

    Click Element    //td[normalize-space(text())='1']

Então sistema exibe informações de filtro Vigência final
    Wait Until Element Is Visible    (//td[normalize-space()='SARA MABILIA DE MATTOS'])[1]

# -4.2.4
E preencho informação de filtro Índice
    Wait Until Element Is Visible    ${Filtro_Indice}
    Click Element                    ${Filtro_Indice}
   FOR     ${i}    IN RANGE     4
        Click Element    (//button[@type='button'])[19]
        Sleep    0.3s
    END
    Click Element    (//button[contains(.,'1')])[2]
    Sleep    2.5s
    Click Element    (//button[contains(.,'28')])[3]
    Click Element    ${Filtro_Indice}

Então sistema exibe informações de filtro Índice
    Wait Until Element Is Visible    (//td[contains(.,'12/02/2025')])[1]

# -4.2.5
E preencho informação de filtro Tipo de índice
    Wait Until Element Is Visible    ${Filtro_TipoIndice}
    Input Text                       ${Filtro_TipoIndice}    IP

Então sistema exibe informações de filtro Tipo de índice
    Sleep    1s
    Wait Until Element Is Visible    //td[contains(.,'IP')]

# -4.2.6
E preencho informação de filtro Status do índice
    Wait Until Element Is Visible    ${Filtro_StatusIndice}
    Click Element                    ${Filtro_StatusIndice}
    Click Element                    (//div[contains(.,'Não atualizado')])[5]

Então sistema exibe informações de filtro Status do índice
    Wait Until Element Is Visible    (//td[@class='p-4 align-middle [&:has([role=checkbox])]:pr-0 text-center'])[5]

# -4.2.7
E preencho informação de filtro Empresa
    Wait Until Element Is Visible    ${Filtro_EmpresaContratos}
    Click Element                    ${Filtro_EmpresaContratos}
    Click Element                    xpath=//div[@role="option" and normalize-space(.)="Isolar Energy"]

Então sistema exibe informações de filtro Empresa
    Wait Until Element Is Visible    (//td[@class='p-4 align-middle [&:has([role=checkbox])]:pr-0 text-center'][normalize-space()='Isolar Energy'])[1]

# -4.2.8
E preencho informação de filtro Departamento
    Wait Until Element Is Visible    ${Filtro_DepartamentoContratos}
    Click Element                    ${Filtro_DepartamentoContratos}
    Click Element                    (//div[contains(.,'TI')])[14]

Então sistema exibe informações de filtro Departamento em Contratos
    Wait Until Element Is Visible    //td[contains(.,'TI')]

# -4.2.9
E preencho informação de filtro Documento
    Wait Until Element Is Visible    ${Filtro_DocumentoContratos}
    Input Text                       ${Filtro_DocumentoContratos}    19895982771

Então sistema exibe informações de filtro Documento
    Wait Until Element Is Visible    //td[contains(.,'teste1234')]

# -4.2.10
E preencho informação de filtro Nome de indivíduo
    Wait Until Element Is Visible    ${Filtro_NomeIndividuosContratos}
    Input Text                       ${Filtro_NomeIndividuosContratos}    teste1234

Então sistema exibe informações de filtro Nome de indivíduo
    Wait Until Element Is Visible    //td[contains(.,'teste1234')]

# -4.2.11
E preencho informação de filtro Status de vigência
    Wait Until Element Is Visible    ${Filtro_StatusVigenciaContratos}
    Click Element                    ${Filtro_StatusVigenciaContratos}
    Click Element                    (//div[contains(.,'Reincidido/Encerrado')])[5]
    
Então sistema exibe informações de filtro Status de vigência
    Wait Until Element Is Visible    (//td[normalize-space()='Anderson'])[1]

# -4.2.12
E preencho filtro nome
    Wait Until Element Is Visible    ${Filtro_NomeIndividuosContratos}
    Input Text                       ${Filtro_NomeIndividuosContratos}    teste1234
    Wait Until Element Is Visible    //input[@value='teste1234']

E clico no botão Resetar filtros
    Wait Until Element Is Visible        ${botao_Resetarfiltros}
    Click Element                        ${botao_Resetarfiltros}
    Wait Until Element Is Not Visible    //input[@value='teste1234']

Então sistema limpa todos os filtros
    Wait Until Element Is Visible    ${Filtro_NomeIndividuosContratos}

# -4.2.13
Quando seleciono filtro 30 dias
    Wait Until Element Is Visible    ${Filtro_PaginaFiltro}
    Click Element                    ${Filtro_PaginaFiltro}
    Click Element                    //span[normalize-space(text())='30 dias']

Então sistema exibe informações de filtro 30 dias
    Wait Until Element Is Visible    (//div[contains(.,'30 dias')])[12]

# -4.2.14
E preencho informações de novo Controle de contratos
# 1
    Wait Until Element Is Visible    (//div[contains(.,'Selecione um indivíduo')])[12]
    Click Element                    (//div[contains(.,'Selecione um indivíduo')])[12]
    Click Element                    (//div[contains(.,'B3 (teste) - 198.959.827-71')])[13]
    Sleep    3s

# 2
    Click Element                    //button[contains(.,'Adicionar Registro')]
    Wait Until Element Is Visible    (//input[@placeholder='CNPJ'])[2]
    Click Element                    //button[contains(.,'Apagar')]
    
    Input Text                       //input[contains(@id,'vigencia_inicio')]    07062024
    Input Text                       //input[@id='vigencia_fim']                 07062026
    Input Text                       //input[@id='indiceData']                   07062026
    Input Text                       //input[@id='indice']                       IP
    Input Text                       (//input[@type='text'])[2]                  ${valorteste}
    Click Element                    //button[contains(.,'Selecione a empresa')]
    Click Element                    (//div[contains(.,'Isolar Energy')])[5]
    Click Element                    //button[contains(.,'Selecione um departamento')]
    Click Element                    (//div[contains(.,'TI')])[18]
    Click Element                    //button[contains(.,'Selecione um responsável')]
    Click Element                    (//div[contains(.,'Fernando QA')])[5]
    Choose File                      //p[normalize-space(text())='TIPO DE ARQUIVOS ACEITÁVEIS: PDF']    C:/Users/silva/Downloads/pdf-test.pdf
    Click Element                    //button[contains(.,'Salvar')]

Então sistema realiza inserção de novo Controle de contratos
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -4.2.15
E preencho informações de Controle de contratos editado
    Sleep    1s
    Wait Until Element Is Visible    (//input[@type='text'])[2]
    Input Text                       (//input[@type='text'])[2]    123
    Click Element                    //button[contains(.,'Salvar')]


Então sistema realiza edição de Controle de contratos
    Wait Until Page Contains    text=Registro atualizado com sucesso!

# -4.2.16
E clico no botão Anexos
    Wait Until Element Is Visible    ${botao_Anexos}
    Click Element                    ${botao_Anexos}
    
Então sistema exibe informações de documento
    Wait Until Page Contains    text=Anexos do Contrato #35

# -4.2.17
E faço download de documento
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Documento 1')]
    Click Element                    //button[@type='button'][contains(.,'Documento 1')]
    Sleep                            1s
    Click Element                    //button[contains(.,'Baixar Documento 1')]

# -4.2.18
E mudo status de vigência
    Sleep    1s
    Wait Until Element Is Visible    //button[contains(.,'Selecione o status da vigência')]
    Click Element                    //button[contains(.,'Selecione o status da vigência')]
    Click Element                    (//div[contains(.,'Reincidido/Encerrado')])[5]
    Click Element                    //button[contains(.,'Salvar')]

Então sistema realiza mudança de vigência
    Wait Until Page Contains    text=Registro atualizado com sucesso!
    

# -4.2.11