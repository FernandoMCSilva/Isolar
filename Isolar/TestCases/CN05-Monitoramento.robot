*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Gerenciar informações de rede direto pelo sistema.

*** Test Cases ***
CT 05.01 - Validar menu Monitoramento
    [Documentation]     Caso de teste valida se Menu Monitoramento está funcional
    [Tags]    Perfil    Funcional        
    Dado que clico no menu "Monitoramento"
    Então sistema entra na página Monitoramento
