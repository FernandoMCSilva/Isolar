*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie requisições cadastradas no sistema.

*** Test Cases ***
CT 02.01 - Validar menu Requisições
    [Documentation]     Caso de teste valida se Menu Requisições está funcional
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"

CT 02.02 - Validar filtro Cliente
    [Documentation]     Caso de teste valida o filtro Cliente em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações no campo Cliente
    Então sistema exibe requisições do filtro Cliente

CT 02.03 - Validar filtro Departamento
    [Documentation]     Caso de teste valida o filtro Departamento em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono departamento "Técnico"
    Então sistema exibe requisições do filtro Departamento

CT 02.04 - Validar filtro Status
    [Documentation]     Caso de teste valida o filtro Status em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono status "Parado"
    Então sistema exibe requisições do filtro Status

CT 02.05 - Validar filtro Tipo
    [Documentation]     Caso de teste valida o filtro Tipo em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono tipo "Técnico"
    Então sistema exibe requisições do filtro Tipo

CT 02.06 - Validar filtro Urgente
    [Documentation]     Caso de teste valida o filtro Urgente em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono urgente "Sim"
    Então sistema exibe requisições do filtro Urgente

CT 02.07 - Validar filtro Nível de urgência
    [Documentation]     Caso de teste valida o filtro Nível de urgência em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono urgente "Sim"
    E seleciono Nível de urgência "Alto"
    Então sistema exibe requisições do filtro Urgente