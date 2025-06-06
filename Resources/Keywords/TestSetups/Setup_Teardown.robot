*** Settings ***
Documentation    Abre e fecha navegador
Resource    ../../Main.robot
# Resource    ../Config/Variables.robot

*** Keywords ***
Abrir navegador
    [Arguments]     ${url}
    ${options}=    Evaluate    options_module.create_options()    modules=options_module
    Open Browser    ${url}     chrome    options=${options}
    Maximize Browser Window
    # Set Window Size    1920    1080
    Wait Until Element Is Visible    ${LOGO}    timeout=10s

Dado que acesse a Isolar e logue no sistema
    Abrir navegador    ${URLISO}
    Fazer login        ${EmailAdmin}    ${SenhaAdmin}
    Sleep    3s
    Reload Page
    Set Window Size    1920    1080

Dado que acesse a Isolar e logue no sistema com Oseias
    Abrir navegador    ${URLISO}
    Fazer login        ${EmailOseias}    ${SenhaOseias}
    Sleep    3s
    # Reload Page

Fechar navegador
    Close Browser
