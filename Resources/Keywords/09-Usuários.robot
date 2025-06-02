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
# -9.1
Dado que clico no menu "Usuários"
    Wait Until Element Is Visible    ${MENU_USUARIOS}
    Click Element                    ${MENU_USUARIOS}

Então sistema exibe usuários
    Wait Until Element Is Visible    ${Tela_Usuarios}

# -9.2
E preencho informações de inserir novo cadastro de Usuários
    Sleep    1s
    Input Text                       //input[contains(@id,'nome')]    ${nome_pesquisa_GruposConsumidores}
    Input Text                       //input[contains(@id,'email')]   ${EmailLocal}   
    Sleep    1s
    Click Element                    (//button[@type='button'])[9]
    Click Element                    (//div[contains(.,'Isolar Energy')])[15]
    Sleep    1s
    Click Element                    (//button[@type='button'])[10]
    Click Element                    (//div[contains(.,'TI')])[15]
    Sleep    1s
    Click Element                    (//button[@type='button'])[11]
    Click Element                    (//div[contains(.,'Desenvolvedor(a)')])[15]
    Sleep    1s
    Input Text                       //input[@id='telefone']    22222222222
    Sleep    1s
    Click Element                    (//button[@type='button'])[12]
    Click Element                    (//div[contains(.,'Sim')])[15]
    Input Text                       //input[@id='senha']    ${SenhaLocal}
    Sleep    1s
    Click Element                    ${Botao_Proximo_Requisicoes}
    Sleep    1s
    Execute Javascript    window.scrollTo(0,0)
E clico em "Salvar" em Usuários
    Wait Until Element Is Visible    ${botao_SalvarUsuários}
    Click Element                    ${botao_SalvarUsuários}
Então sistema salva novo cadastro de Usuários
    Sleep    1s
    Wait Until Page Contains    text=Registro adicionado com sucesso!

# -9.3
E preencho informações de cadastro editado no menu Usuários
    Sleep    3s
    Input Text       //input[@id='nome']    ${nome_pesquisa}
    Input Text       //input[@id='telefone']    99999999999
    Input Text       //input[@id='email']    ${EmailLocal}
    Input Text       //input[@id='senha']    ${SenhaLocal}
    Sleep    1s
    Click Element    ${Botao_Proximo_Requisicoes}   
    Sleep    1s
    Execute Javascript    window.scrollTo(0,0)

E preencho campo de senha
    Wait Until Element Is Visible    //input[@id='confirm-password']
    Input Text    //input[@id='confirm-password']    ${SenhaLocal} 
    Click Element    //button[contains(.,'Confirmar')]

# -9.4
Então sistema verifica se há cadastro B3 (teste) em Usuarios
    ${temporario_encontrado}=    Run Keyword And Return Status    Element Should Be Visible    (//td[normalize-space()='B3 (teste)'])[1]

    WHILE    ${temporario_encontrado}
        Log    Requisição temporária encontrada. Irá excluir...
        Sleep    2s
        Wait Until Element Is Visible    ${botao_acoes_Clientes}
        Sleep    2s
        Click Element                    ${botao_acoes_Clientes}
        Sleep    0.5s
        Wait Until Element Is Visible    ${botao_Excluir_CadastrosGruposConsumidores}
        Click Element                    ${botao_Excluir_CadastrosGruposConsumidores}
        Sleep    1s
        Wait Until Element Is Visible    ${botao_continuar_Excluir}
        Click Element                    ${botao_continuar_Excluir}
        Sleep    2s
        Wait Until Page Contains    text=Gerenciar informações cadastradas no sistema
    
    #   voltar para menu inicio
        Sleep    1s
        E volto pra tela inicio

    #   Retorno para menu Usuários
        Sleep    1s
        Dado que clico no menu "Usuários"

        Sleep    3s
        Click Element    ${botao_buscarPerguntas}
        Input Text    //input[@placeholder='Buscar...']    ${nome_pesquisa_GruposConsumidores}
        Sleep    1s

        # Atualiza a variável usada no WHILE
        ${temporario_encontrado}=    Run Keyword And Return Status    Element Should Be Visible    (//td[normalize-space()='B3 (teste)'])[1]
    END



# -9.5
Então sistema exibe informações de cadastro de "Usuários"
    Wait Until Page Contains    text=Gerenciar informações cadastradas no sistema

# -9.6
Então sistema exclui item do menu Usuários
    Wait Until Page Contains    text=Registro excluído com sucesso!

# -9.8
Então sistema exibe mensagem de erro em Usuários
    Wait Until Page Contains    text=Nenhum usuário encontrado.


