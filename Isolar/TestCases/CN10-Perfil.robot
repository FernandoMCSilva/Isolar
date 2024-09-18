*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo gerencia Perfil no sistema.

*** Test Cases ***
CT 10.01 - Validar menu Perfil > Gráficos
    [Documentation]     Caso de teste valida se Menu Perfil > Gráficos está funcional
    [Tags]    Perfil    Funcional        
    Dado que clico no menu "Perfil > Gráficos"

CT 10.02 - Validar menu Perfil > Configurações
    [Documentation]     Caso de teste valida se Menu Perfil > Configurações está funcional
    [Tags]    Perfil    Funcional        
    Dado que clico no menu "Perfil > Configurações"

CT 10.03 - Validar menu Perfil > ☼ (Ero)
    [Documentation]     Caso de teste valida se Menu Perfil > ☼ está funcional
    [Tags]    Perfil    Funcional        
    Dado que clico no menu "Perfil > ☼"