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
    E valido todos os filtros de departamento em Requisições
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

CT 02.08 - Validar filtro Data de entrega
    [Documentation]     Caso de teste valida o filtro Data de entrega em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações de Data de entrega
    Então sistema exibe requisições do filtro Data de entrega

CT 02.09 - Validar filtro Data de criação
    [Documentation]     Caso de teste valida o filtro Data de criação em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações de Data de criação
    Então sistema exibe requisições do filtro Data de Criação

CT 02.10 - Validar filtro Responsável
    [Documentation]     Caso de teste valida o filtro Responsável em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de "Responsável"
    Então sistema exibe requisições de filtro Responsável

CT 02.11 - Validar filtro Representante comercial
    [Documentation]     Caso de teste valida o filtro Representante comercial em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de "Representante comercial"
    Então sistema exibe requisições de filtro Representante comercial

CT 02.12 - Validar filtro Vendedor
    [Documentation]     Caso de teste valida o filtro Vendedor em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono filtro vendedor "Todos"
    Então sistema exibe requisições de filtro vendedor "Todos"

CT 02.13 - Validar filtro Renovadas
    [Documentation]     Caso de teste valida o filtro Renovadas em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de "Renovadas"
    Então sistema exibe requisições de filtro Renovadas



