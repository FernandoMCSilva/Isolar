*** Settings ***
Resource  Config/Libraries.robot
Resource  Config/Variables.robot
Resource  Config/Matchers.robot

Resource  Keywords/TestSetups/Setup_Teardown.robot
Resource  Keywords/01-Início.robot
Resource  Keywords/02-Requisições.robot
Resource  Keywords/03-Obras.robot
Resource  Keywords/04-Contratos.robot
Resource  Keywords/05-Proposta.robot
Resource  Keywords/06-Monitoramento.robot
Resource  Keywords/07-Documentos.robot
Resource  Keywords/08-Cadastros.robot
Resource  Keywords/09-Usuários.robot
Resource  Keywords/10-Configurações.robot
Resource  Keywords/11-Relatórios.robot
Resource  Keywords/12-Novidades.robot

*** Keywords ***
Fazer login
    [Arguments]    ${usuario}    ${senha}
    Wait Until Element Is Visible    //input[@id='email']
    Input Text                       //input[@id='email']      ${usuario}
    Input Text                       //input[@id='senha']      ${senha}
    Click Element                    //button[contains(.,'Entrar')]
