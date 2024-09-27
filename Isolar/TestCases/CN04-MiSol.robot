*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que gerencie as Estimativas cadastradas no sistema.

*** Test Cases ***
# CT 04.01 - Validar menu MiSol
#     [Documentation]     Caso de teste valida se Menu MiSol está funcional
#     [Tags]    MiSol    Funcional
#     Dado que clico no menu "MiSol"
#     Então sistema exibe informações de economia da Minerando Sol

# CT 04.02 - Validar Filtro Vendedor
#     [Documentation]     Caso de teste valida se Filtro Vendedor está funcional
#     [Tags]    MiSol    Funcional
#     Dado que clico no menu "MiSol"
#     E clico em "Filtros"
#     E preencho informações de filtro vendedor
#     Quando clico em "Buscar"
#     Então sistema exibe informações de filtro vendedor

# CT 04.03 - Validar Filtro Data do registro
#     [Documentation]     Caso de teste valida se Filtro Data do registro está funcional
#     [Tags]    MiSol    Funcional
#     Dado que clico no menu "MiSol"
#     E clico em "Filtros"
#     E preencho informações de Data do registro
#     Quando clico em "Buscar"
#     Então sistema exibe informações do filtro Data do registro

# CT 04.04 - Validar Filtro Associado
#     [Documentation]     Caso de teste valida se Filtro Associado está funcional
#     [Tags]    MiSol    Funcional
#     Dado que clico no menu "MiSol"
#     E clico em "Filtros"
#     E preencho informações de filtro Associado
#     Quando clico em "Buscar"
#     Então sistema exibe informações do filtro Associado


