*** Settings ***
Resource           ../Resources/SuiteSetup.robot
Resource           ../Resources/Main.robot
# Suite Setup        Setup Chrome Driver
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie um resumo das informações cadastradas no sistema.

*** Test Cases ***
CT 01.01 - Validar menu Início
    [Documentation]     Caso de teste valida se Menu Início está funcional
    [Tags]    Início        
    Dado que clico no menu "Início"
    Então sistema exibe informações de requisições gerais

CT 01.02 - Validar requisições em Fila
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Fila
    [Tags]    Início        
    Dado que clico no menu "Início"
    Quando clico em "Fila"
    Então sistema exibe requisições com status "Fila"

CT 01.03 - Validar requisições em Produção
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Produção
    [Tags]    Início        
    Dado que clico no menu "Início"
    Quando clico em "Produção"
    Então sistema exibe requisições com status "Produção"

CT 01.04 - Validar requisições em Concluídas
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Concluídas
    [Tags]    Início        
    Dado que clico no menu "Início"
    Quando clico em "Concluídas"
    Então sistema exibe requisições com status "Concluídas"

CT 01.05 - Validar requisições em Paradas
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Paradas
    [Tags]    Início        
    Dado que clico no menu "Início"
    Quando clico em "Paradas"
    Então sistema exibe requisições com status "Paradas"

CT 01.06 - Validar filtros em departamento
    [Documentation]     Caso de teste valida os filtros Departamento
    [Tags]    Início       
    Dado que clico no menu "Início"
    E valido filtros de departamento
    Então sistema exibe requisições do departamento
    
CT 01.07 - Validar filtro Data inicial e Data final
    [Documentation]     Caso de teste valida as informações geradas após filtros específicos
    [Tags]    Início        
    Dado que clico no menu "Início"
    E preencho data inicial
    E preencho data final
    Então sistema exibe requisições filtradas

CT 01.08 - Validar botão Tema
    [Documentation]     Caso de teste valida se botão Tema está funcional no menu Inicio
    [Tags]    Início        
    Dado que clico no menu "Início"
    E clico no botão tema "Escuro"
    Então sistema exibe tela em tema "Escuro"

CT 01.09 - Validar botão SAC
    [Documentation]     Caso de teste valida se botão SAC está funcional no menu Inicio
    [Tags]    Início        
    Dado que clico no menu "Início"
    E clico no botão SAC
    Então sistema exibe tela de SAC

CT 01.10 - Validar botão Notificações
    [Documentation]     Caso de teste valida se botão Notificações está funcional no menu Inicio
    [Tags]    Início        
    Dado que clico no menu "Início"
    E clico no botão Notificações
    Então sistema exibe tela de Notificações


