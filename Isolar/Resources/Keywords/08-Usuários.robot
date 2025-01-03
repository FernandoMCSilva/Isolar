*** Settings ***
Documentation      Modúlo que Gerencie usuários cadastrados no sistema.
Resource           ../Main.robot

*** Variables ***
${Tela_Usuarios}              //h1[contains(.,'Usuários')]

${nome_pesquisa}              B3 (teste)
${nome_BuscaNaoEncontrada}    1234
${botao_Editar}               (//a[contains(.,'Editar')])[1]
${botao_Excluir}              //button[contains(@class,'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-destructive text-destructive-foreground hover:bg-destructive/90 h-10 px-4 py-2')]
${botao_inserir}              //button[contains(.,'Inserir')]
${botao_continuar_Excluir}    //button[contains(.,'Continuar')]
${botao_Cancelar_Excluir}     //button[contains(.,'Cancelar')]
${botao_salvar}               //button[contains(.,'Salvar')]
${botao_atualizar}            //button[contains(.,'Atualizar')]
${botao_SalvarUsuários}       //button[contains(.,'Salvar')]
${input_buscar}               //input[contains(@placeholder,'Buscar...')]
${input_descricao}            //input[@id='descricao']
${input_buscar}               xpath=//input[contains(@class, 'flex h-10')]
${filtro_cards/Lista}         (//button[@type='button'])[7]
${filtro_botaoLista}          xpath=//div[@role='option'][contains(.,'Lista')]
${EmailLocal}                 teste123@gmail.com
${SenhaLocal}                 Q@grupoiso123

*** Keywords ***                
# -8.1
Dado que clico no menu "Usuários"
    Wait Until Element Is Visible    ${MENU_USUARIOS}
    Click Element                    ${MENU_USUARIOS}

Então sistema exibe usuários
    Wait Until Element Is Visible    ${Tela_Usuarios}

# -8.2
E preencho informações de inserir novo cadastro de Usuários
    Sleep    2s
    Input Text       //input[@id='nome']    ${nome_pesquisa}
    Input Text       //input[@id='telefone']    99999999999
    Input Text       //input[@id='email']    ${EmailLocal}
    Input Text       //input[@id='senha']    ${SenhaLocal}
    Click Element    (//button[@type='button'])[7]
    Click Element    (//div[contains(.,'Isolar Energy')])[15]
    Click Element    (//button[@type='button'])[8]
    Sleep    2s
    Click Element    (//div[contains(.,'Departamento pessoal')])[15]
    Click Element    //button[contains(.,'Próximo')]

E clico em "Salvar" em Usuários
    Click Element    ${botao_SalvarUsuários}
Então sistema salva novo cadastro de Usuários
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -8.3
E preencho informações de cadastro editado no menu Usuários
    Sleep    3s
    Input Text       //input[@id='nome']    ${nome_pesquisa}
    Input Text       //input[@id='telefone']    99999999999
    Input Text       //input[@id='email']    ${EmailAdmin}
    Input Text       //input[@id='senha']    ${SenhaLocal}
    Click Element    (//button[@type='button'])[7]
    Click Element    //span[contains(.,'Vendedor')]
    Click Element    ${botao_atualizar}
E preencho campo de senha
    Wait Until Element Is Visible    (//input[@type='password'])[2]
    Input Text    (//input[@type='password'])[2]    ${SenhaLocal} 
    Click Element    //button[contains(.,'Confirmar')]

# -8.3
Então sistema exibe informações de cadastro de "Usuários"
    Wait Until Page Contains    text=Gerenciar informações cadastradas no sistema

# -8.6
Então sistema exclui item do menu Usuários
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -8.3
Então sistema exibe mensagem de erro em Usuários
    Wait Until Page Contains    text=Nenhum usuário encontrado.


