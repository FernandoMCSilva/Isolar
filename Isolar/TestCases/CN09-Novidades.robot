*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie o menu Novidades

*** Test Cases ***
CT 09.01 - Validar menu Novidades
    [Documentation]     Caso de teste valida se Menu Novidades está funcional
    [Tags]    Novidades    Funcional        
    Dado que clico no menu "Novidades"