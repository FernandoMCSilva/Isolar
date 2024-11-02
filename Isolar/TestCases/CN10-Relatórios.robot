*** Settings ***
Resource           ../Resources/Main.robot
Resource    ../Resources/Keywords/SuiteSetups/Authentication.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo gerencia Relatórios no sistema.

*** Test Cases ***
CT 10.01.01 - Validar menu Relatórios > Relatórios
    [Documentation]     Caso de teste valida se Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Então sistema exibe informações de menu Relatórios > Relatórios
CT 10.01.02 - Validar filtro Cliente no menu Relatórios > Relatórios
    [Documentation]     Caso de teste valida se filtro cliente no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E preencho informações de filtro "Cliente"
    E clico em "Buscar"
    Então sistema exibe informações de filtro "Cliente"

CT 10.01.03 - Validar filtro Status no menu Relatórios > Relatórios
    [Documentation]     Caso de teste valida se filtro status no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Status "Fila"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Status "Fila"

CT 10.01.04 - Validar filtro Responsável no menu Relatórios > Relatórios
    [Documentation]     Caso de teste valida se filtro Responsável no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Responsável "suporte"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Responsável "suporte"

# CT 10.01.05 - Validar filtro Vendedor Técnico no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Vendedor Técnico no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E seleciono filtro Vendedor Técnico "Todos"
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Vendedor Técnico "Todos"

# CT 10.01.06 - Validar filtro Representante comercial no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Representante comercial no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E seleciono filtro Representante comercial "Todos"
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Representante comercial "Todos"
    
# CT 10.01.07 - Validar filtro Renovadas no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Renovadas no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E seleciono o filtro Renovadas "Renovadas"
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Renovadas "Renovadas"

# CT 10.01.08 - Validar filtro Unidade consumidora no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Unidade consumidora no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E preencho informações de filtro Unidade consumidora
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Unidade Consumidora

# CT 10.01.09 - Validar filtro Tipo de requisição no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Tipo de requisição no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E seleciono filtro Tipo de requisição "Estimativa"
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Tipo de requisição "Estimativa"

# CT 10.01.10 - Validar filtro Data de criação no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Data de criação no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E seleciono filtro Data de criação
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Data de criação

# CT 10.01.11 - Validar filtro Promotor no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Promotor no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E seleciono filtro Promotor "Todos"
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Promotor "Todos"

# CT 10.01.12 - Validar filtro Indicador no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Indicador no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E seleciono filtro Indicador "Todos"
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Indicador "Todos"
    
# CT 10.01.13 - Validar filtro Departamento no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Departamento no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E seleciono fitro Departamento "Comercial"
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Departamento "Comercial"

# CT 10.01.14 - Validar filtro Quantidade de itens por pág no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se filtro Quantidade de itens por pág no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico em "Filtros"
#     E clico em Quantidade de itens por pág
#     E preencho informações de quantidade de itens
#     E clico em "Buscar"
#     Então sistema exibe informações de quantidade de itens por pág


# CT 10.01.15 - Validar botão Exportar para Excel no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se botão Exportar para Excel no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico no botão Exportar para Excel
#     Então sistema realiza download de arquivo para Excel

# CT 10.01.16 - Validar botão Exportar para PDF no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se botão Exportar para PDF no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico no botão Exportar para PDF
#     Então sistema realiza download de arquivo para PDF

# CT 10.01.17 - Validar botão Próximo no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se botão Próximo no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico no botão Próximo
#     Então sistema exibe informações de botão Próximo

# CT 10.01.18 - Validar botão Anterior no menu Relatórios > Relatórios
#     [Documentation]     Caso de teste valida se botão Anterior no Menu Relatórios > Relatórios está funcional
#     [Tags]    Relatórios    Relatórios    Funcional        
#     Dado que clico no menu "Relatórios > Relatórios"
#     Quando clico no botão Anterior
#     Então sistema exibe informações de botão Anterior 


CT 10.02.01 - Validar menu Relatórios > Homologatórias
    [Documentation]     Caso de teste valida se Menu Relatórios > Homologatórias está funcional
    [Tags]    Relatórios    Homologatórias    Funcional        
    Dado que clico no menu "Relatórios > Homologatórias"