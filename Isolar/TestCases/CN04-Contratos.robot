*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie os Controle de Contratos cadastrados no sistema.

*** Test Cases ***

CT 04.01.01 - Validar menu Contratos > Dashboard
    [Documentation]     Caso de teste valida se Menu Contratos > Dashboard está funcional
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    Então sistema exibe tela de Contratos > Dashboard > Dashboard
    
CT 04.01.02 - Validar filtros de data
    [Documentation]     Caso de teste valida se filtros de data inicial e data final está funcional
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard > Dashboard
    # E preencho data inicial
    # E preencho data final
    # Então sistema exibe informações de filtros de data

CT 04.01.03 - Validar filtros em departamento
    [Documentation]     Caso de teste valida os filtros Departamento
    [Tags]    Obras    Dashboard    Funcional       
    Dado que clico no menu Contratos > Dashboard > Dashboard
    # E valido filtros de departamento em Obras
    # Então sistema exibe requisições do departamento em Obras

