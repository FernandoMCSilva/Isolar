*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie usuários cadastrados no sistema.

*** Test Cases ***
CT 06.01 - Validar menu Usuários
    [Documentation]     Caso de teste valida se Menu Usuário está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"