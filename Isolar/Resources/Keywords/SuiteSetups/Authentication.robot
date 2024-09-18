*** Settings ***
Documentation    Essa suite roda a autenticação no Siscob
Resource    ../../Main.robot

*** Keywords ***
Dado que já realizei a autenticação no Siscob
    [Documentation]    Esse teste acessa o Siscob
    [Tags]             Teste de Acesso    Siscob
    Dado que estou na página de acesso ao Siscob
    Quando informar Usuário e Senha
    Então clicar no botão "Entrar"

# --
Dado que estou na página de acesso ao Siscob
    Start Video Recording
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=${URLHML}
    Wait Until Element Is Visible    //input[contains(@name,'username')]

Quando informar Usuário e Senha
    Input Text       locator=${OPCUSUARIO}   text=${USUARIO}
    Input Text       locator=${OPCSENHA}     text=${SENHA}

Então clicar no botão "Entrar"
    Click Element    //button[@type='submit'][contains(.,'Entrar')]
    Wait Until Element Is Visible    locator=${TELAPRINCIPAL}       timeout=10
    # Close Browser