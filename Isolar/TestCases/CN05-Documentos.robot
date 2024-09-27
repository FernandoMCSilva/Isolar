*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que gerencie as Estimativas cadastradas no sistema.

*** Test Cases ***
# CT 04.01 - Validar menu Documentos
#     [Documentation]     Caso de teste valida se Menu Documentos está funcional
#     [Tags]    Documentos    Funcional
#     Dado que clico no menu "Documentos"
#     Quando clico no menu "Documentos geradados"
#     Então sistema exibe informações de documentos gerados