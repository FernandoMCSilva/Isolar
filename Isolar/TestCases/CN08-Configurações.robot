*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo gerencia Configurações no sistema.

*** Test Cases ***
CT 08.01 - Validar menu Configurações > Requisições
    [Documentation]     Caso de teste valida se Menu Configurações > Requisições está funcional
    [Tags]    Configurações    Funcional        
    Dado que clico no menu "Configurações > Requisições"

CT 08.02 - Validar menu Configurações > Documentos
    [Documentation]     Caso de teste valida se Menu Configurações > Documentos está funcional
    [Tags]    Configurações    Funcional        
    Dado que clico no menu "Configurações > Documentos"

CT 08.03 - Validar menu Configurações > Estimativa
    [Documentation]     Caso de teste valida se Menu Configurações > Estimativa está funcional
    [Tags]    Configurações    Funcional        
    Dado que clico no menu "Configurações > Estimativa"

CT 08.04 - Validar menu Configurações > Sistema
    [Documentation]     Caso de teste valida se Menu Configurações > Sistema está funcional
    [Tags]    Configurações    Funcional        
    Dado que clico no menu "Configurações > Sistema"