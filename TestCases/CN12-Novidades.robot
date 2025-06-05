*** Settings ***
Resource           ../Resources/SuiteSetup.robot
Resource           ../Resources/Main.robot
Suite Setup        Setup Chrome Driver
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie o menu Novidades

*** Test Cases ***
CT 12.01 - Validar menu Novidades
    [Documentation]     Caso de teste valida se Menu Novidades está funcional
    [Tags]    Novidades    Funcional        
    Dado que clico no menu "Novidades"
    Então sistema exibe página de Novidades
        
CT 12.02 - Validar menu FAQ
    [Documentation]     Caso de teste valida se Menu FAQ está funcional no Menu Novidades
    [Tags]    Novidades    Funcional        
    Dado que clico no menu "Novidades"
    Quando clico no menu FAQ
    Então sistema exibe página de FAQ
    
CT 12.03 - Validar menu Atualizações
    [Documentation]     Caso de teste valida se Menu Atualizações está funcional no Menu Novidades 
    [Tags]    Novidades    Funcional        
    Dado que clico no menu "Novidades"
    Quando clico no menu Atualizações
    Então sistema exibe página de Atualizações
    
# testerepositorio