*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie um resumo das informações cadastradas no sistema.

*** Test Cases ***
CT 01.01 - Validar menu Início
    [Documentation]     Caso de teste valida se Menu Início está funcional
    [Tags]    Início    Funcional        
    Dado que clico no menu "Início"
    Então sistema exibe informações de requisições gerais


CT 01.02 - Validar requisições em Fila
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Fila
    [Tags]    Início    Funcional        
    Dado que clico no menu "Início"
    Quando clico em "Fila"
    Então sistema exibe requisições com status "Fila"

CT 01.03 - Validar requisições em Produção
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Produção
    [Tags]    Início    Funcional        
    Dado que clico no menu "Início"
    Quando clico em "Produção"
    Então sistema exibe requisições com status "Produção"

CT 01.04 - Validar requisições em Concluídas
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Concluídas
    [Tags]    Início    Funcional        
    Dado que clico no menu "Início"
    Quando clico em "Concluídas"
    Então sistema exibe requisições com status "Concluídas"

CT 01.05 - Validar requisições em Paradas
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Paradas
    [Tags]    Início    Funcional        
    Dado que clico no menu "Início"
    Quando clico em "Paradas"
    Então sistema exibe requisições com status "Paradas"

CT 01.06 - Validar filtros em departamento
    [Documentation]     Caso de teste valida os filtros Departamento
    [Tags]    Início    Funcional       
    Dado que clico no menu "Início"
    E valido todos os filtros de departamento
    Então sistema exibe requisições do departamento
    
CT 01.07 - Validar filtro Data inicial e Data final
    [Documentation]     Caso de teste valida as informações geradas após filtros específicos
    [Tags]    Início    Funcional        
    Dado que clico no menu "Início"
    E preencho data inicial
    E preencho data final
    # E clico em Buscar
    Então sistema exibe requisições filtradas
