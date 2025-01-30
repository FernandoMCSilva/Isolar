*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.

*** Test Cases ***

CT 03.01.01 - Validar menu Obras
    [Documentation]     Caso de teste valida se Menu Obras > Dashboard está funcional
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Dashboard
    Então sistema exibe tela de Obras > Dashboard

CT 03.01.02 - Validar filtros de data
    [Documentation]     Caso de teste valida se filtros de data inicial e data final está funcional
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Dashboard
    E preencho data inicial
    E preencho data final
    Então sistema exibe informações de filtros de data

