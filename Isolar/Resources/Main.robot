*** Settings ***
Resource  Config/Libraries.robot
Resource  Config/Variables.robot
Resource  Config/Matchers.robot

Resource  Keywords/TestSetups/Setup_Teardown.robot
Resource  Keywords/01-Início.robot
Resource  Keywords/02-Requisições.robot
Resource  Keywords/05-Cadastros.robot
Resource  Keywords/06-Usuários.robot
Resource  Keywords/07-Configurações.robot
Resource  Keywords/08-Relatórios.robot
Resource  Keywords/09-Novidades.robot
Resource  Keywords/10-Perfil.robot


*** Keywords ***
Fazer login
    [Arguments]    ${usuario}    ${senha}
    Wait Until Element Is Visible    //input[@id='email']
    Input Text                       //input[@id='email']      ${usuario}
    Input Text                       //input[@id='senha']      ${senha}
    Click Element                    //button[contains(.,'Entrar')]