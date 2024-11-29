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
CT 10.01.02 - Validar filtro Cliente 
    [Documentation]     Caso de teste valida se filtro cliente no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E preencho informações de filtro "Cliente"
    E clico em "Buscar"
    Então sistema exibe informações de filtro "Cliente"

CT 10.01.03 - Validar filtro Status
    [Documentation]     Caso de teste valida se filtro status no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Status "Fila"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Status "Fila"

CT 10.01.04 - Validar filtro Responsável 
    [Documentation]     Caso de teste valida se filtro Responsável no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Responsável "suporte"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Responsável "suporte"

CT 10.01.05 - Validar filtro Vendedor Técnico 
    [Documentation]     Caso de teste valida se filtro Vendedor Técnico no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Vendedor Técnico "Todos"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Vendedor Técnico "Todos"

CT 10.01.06 - Validar filtro Representante comercial 
    [Documentation]     Caso de teste valida se filtro Representante comercial no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Representante comercial "B3 (teste)"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Representante comercial "B3 (teste)"
    
CT 10.01.07 - Validar filtro Renovadas 
    [Documentation]     Caso de teste valida se filtro Renovadas no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono o filtro Renovadas "Renovadas"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Renovadas "Renovadas"

CT 10.01.08 - Validar filtro Unidade consumidora 
    [Documentation]     Caso de teste valida se filtro Unidade consumidora no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E preencho informações de filtro Unidade consumidora
    E clico em "Buscar"
    Então sistema exibe informações de filtro Unidade Consumidora

CT 10.01.09 - Validar filtro Tipo de requisição 
    [Documentation]     Caso de teste valida se filtro Tipo de requisição no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Tipo de requisição "Estimativa"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Tipo de requisição "Estimativa"

CT 10.01.10 - Validar filtro Data de criação 
    [Documentation]     Caso de teste valida se filtro Data de criação no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Data de criação
    E clico em "Buscar"
    Então sistema exibe informações de filtro Data de criação

CT 10.01.11 - Validar filtro Promotor 
    [Documentation]     Caso de teste valida se filtro Promotor no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Promotor "Todos"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Promotor "Todos"

CT 10.01.12 - Validar filtro Indicador 
    [Documentation]     Caso de teste valida se filtro Indicador no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono filtro Indicador "Todos"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Indicador "Todos"
    
CT 10.01.13 - Validar filtro Departamento 
    [Documentation]     Caso de teste valida se filtro Departamento no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    E seleciono fitro Departamento "TI"
    E clico em "Buscar"
    Então sistema exibe informações de filtro Departamento "TI"

CT 10.01.14 - Validar filtro Quantidade de itens por pág 
    [Documentation]     Caso de teste valida se filtro Quantidade de itens por pág no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Filtros"
    Quando clico em "Quantidade de itens por pág"
    E preencho informações no campo quantidade
    Então sistema exibe informações de acordo com quantidade preenchida

CT 10.01.15 - Validar botão Exportar para Excel 
    [Documentation]     Caso de teste valida se botão Exportar para Excel no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico no botão Exportar para Excel
    Então sistema exporta para excel

CT 10.01.16 - Validar botão Exportar para PDF 
    [Documentation]     Caso de teste valida se botão Exportar para PDF no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico no botão Exportar para PDF
    Então sistema exporta para PDF

CT 10.01.17 - Validar botão Próximo 
    [Documentation]     Caso de teste valida se botão Próximo no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Próximo"
    Então sistema exibe próximas informações

CT 10.01.18 - Validar botão Anterior 
    [Documentation]     Caso de teste valida se botão Anterior no Menu Relatórios > Relatórios está funcional
    [Tags]    Relatórios    Relatórios    Funcional        
    Dado que clico no menu "Relatórios > Relatórios"
    Quando clico em "Próximo"
    E clico em "Anterior"
    Então sistema exibe informações anteriores   

CT 10.02.01 - Validar menu Relatórios > Homologatórias
    [Documentation]     Caso de teste valida se Menu Relatórios > Homologatórias está funcional
    [Tags]    Relatórios    Homologatórias    Funcional        
    Dado que clico no menu "Relatórios > Homologatórias"
    Então sistema exibe informações do menu Relatórios > Homologatórias

CT 10.02.12 - Validar filtro quantidade de itens > Homologatórias
    [Documentation]     Caso de teste valida se Menu Relatórios > Homologatórias está funcional
    [Tags]    Relatórios    Homologatórias    Funcional        
    Dado que clico no menu "Relatórios > Homologatórias"
    Quando clico em "Filtros"
    Quando clico em "Quantidade de itens por pág"
    E preencho informações no campo quantidade
    Então sistema exibe quantidade de itens preenchida em Relatórios

CT 10.02.13 - Validar botão Próximo > Homologatórias
    [Documentation]     Caso de teste valida se Menu Relatórios > Homologatórias está funcional
    [Tags]    Relatórios    Homologatórias    Funcional        
    Dado que clico no menu "Relatórios > Homologatórias"
    Quando clico em "Próximo"
    Então sistema exibe próximas informações

CT 10.02.14 - Validar botão Anterior > Homologatórias
    [Documentation]     Caso de teste valida se Menu Relatórios > Homologatórias está funcional
    [Tags]    Relatórios    Homologatórias    Funcional        
    Dado que clico no menu "Relatórios > Homologatórias"
    Quando clico em "Próximo"
    E clico em "Anterior"
    Então sistema exibe informações anteriores   



# Quantidade de itens por pág
# Botão Próximo 
# Botão Anterior 
# ...
# Resolução ANEEL
# Concessionária
# Acessante
# Classe
# Detalhe
# Posto
# Ano
# Subgrupo
# Modalidade
# SubClasse
# Outorga
