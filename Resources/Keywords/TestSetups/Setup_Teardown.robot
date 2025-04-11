*** Settings ***
Documentation    Abre e fecha navegador
Resource    ../../Main.robot
# Resource    ../Config/Variables.robot

*** Keywords ***
Abrir navegador
    [Arguments]     ${url}
    ${options}=    Evaluate    __import__('selenium.webdriver.chrome.options', fromlist=['Options']).Options()    modules=selenium.webdriver.chrome.options
    Evaluate    options.add_argument("--headless")    options=${options}
    Evaluate    options.add_argument("--no-sandbox")    options=${options}
    Evaluate    options.add_argument("--disable-dev-shm-usage")    options=${options}
    Open Browser    ${url}    chrome    options=${options}
    Maximize Browser Window
    # Set Window Size    1920    1080
    Wait Until Element Is Visible    ${LOGO}    timeout=10s

Dado que acesse a Isolar e logue no sistema
    Abrir navegador    ${URLISO}
    Fazer login        ${EmailAdmin}    ${SenhaAdmin}
    Sleep    3s
    Reload Page

Dado que acesse a Isolar e logue no sistema com Oseias
    Abrir navegador    ${URLISO}
    Fazer login        ${EmailOseias}    ${SenhaOseias}
    Sleep    3s
    # Reload Page

Fechar navegador
    Close Browser
