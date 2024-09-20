*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie usuários cadastrados no sistema.

*** Test Cases ***
CT 07.01 - Validar menu Usuários
    [Documentation]     Caso de teste valida se Menu Usuário está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    Então sistema exibe usuários

CT 07.02 - Validar visão dos Usuários "Lista"
    [Documentation]     Caso de teste valida visão dos Usuários
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    Quando clico em combo "Lista"
    # Então sistema exibe usuários como lista

CT 07.03 - Validar visão dos Usuários "Cards"
    [Documentation]     Caso de teste valida visão dos Usuários
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    Quando clico em combo "Cards"
    # Então sistema exibe usuários como cards
