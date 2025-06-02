*** Settings ***
Resource           ../Resources/SuiteSetup.robot
Resource           ../Resources/Main.robot
Suite Setup        Setup Chrome Driver
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Gerenciar informações de rede direto pelo sistema.

*** Test Cases ***
CT 06.01 - Validar menu Monitoramento
    [Documentation]     Caso de teste valida se Menu Monitoramento está funcional
    [Tags]    Perfil    Funcional        
    Dado que clico no menu "Monitoramento"
    Então sistema entra na página Monitoramento
