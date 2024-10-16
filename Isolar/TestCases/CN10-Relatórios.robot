*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo gerencia Relatórios no sistema.

*** Test Cases ***
CT 10.01 - Validar menu Relatórios > Relatórios
    [Documentation]     Caso de teste valida se Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"

CT 10.02 - Validar menu Relatórios > Homologatórias
    [Documentation]     Caso de teste valida se Menu Relatórios > Homologatórias está funcional
    [Tags]    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Homologatórias"