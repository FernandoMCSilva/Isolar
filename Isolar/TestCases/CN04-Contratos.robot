*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie os Controle de Contratos cadastrados no sistema.

*** Test Cases ***

CT 04.01.01 - Validar menu Contratos > Dashboard
    [Documentation]     Caso de teste valida se Menu Contratos > Dashboard está funcional
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    Então sistema exibe tela de Contratos > Dashboard > Dashboard
    
CT 04.01.02 - Validar filtros de data
    [Documentation]     Caso de teste valida se filtros de data inicial e data final está funcional
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    E preencho Vigência de:
    E preencho Vigência até:
    Então sistema exibe número de contratos 

CT 04.01.03 - Validar filtro departamento
    [Documentation]     Caso de teste valida o filtro Departamento
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    E valido filtro departamento em Contratos > Dashboard
    Então sistema exibe requisições do departamento em Contratos > Dashboard

CT 04.01.04 - Validar filtro +60 dias
    [Documentation]     Caso de teste valida filtro "+60 dias"
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    Quando clico no filtro "+60 dias"
    Então sistema exibe informações de filtro "+60 dias"

CT 04.01.05 - Validar filtro 30 dias
    [Documentation]     Caso de teste valida o filtro "30 dias" 
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    Quando clico no filtro "30 dias"
    Então sistema exibe informações de filtro "30 dias"

    
CT 04.01.06 - Validar filtro 15 dias
    [Documentation]     Caso de teste valida o filtro "15 dias" 
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    Quando clico no filtro "15 dias"
    Então sistema exibe informações de filtro "15 dias"

CT 04.01.07 - Validar filtro Vencidos
    [Documentation]     Caso de teste valida o filtro "Vencidos" 
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    Quando clico no filtro "Vencidos"
    Então sistema exibe informações de filtro "Vencidos"

CT 04.01.08 - Validar filtro Indefinidos
    [Documentation]     Caso de teste valida o filtro "Indefinidos" 
    [Tags]    Contratos    Dashboard    Funcional        
    Dado que clico no menu Contratos > Dashboard
    Quando clico no filtro "Indefinidos"
    Então sistema exibe informações de filtro "Indefinidos"

CT 04.02.01 - Validar menu Contratos > Contratos
    [Documentation]     Caso de teste valida menu Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Então sistema exibe informações de cadastros de Contratos

CT 04.02.02 - Validar filtro Vigência inicial
    [Documentation]     Caso de teste valida o filtro "Vigência inicial" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Vigência inicial
    Então sistema exibe informações de filtro Vigência inicial

CT 04.02.03 - Validar filtro Vigência final
    [Documentation]     Caso de teste valida o filtro "Vigência final" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Vigência final
    Então sistema exibe informações de filtro Vigência final

CT 04.02.04 - Validar filtro Índice
    [Documentation]     Caso de teste valida o filtro "Índice" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Índice
    Então sistema exibe informações de filtro Índice

CT 04.02.05 - Validar filtro Tipo de índice
    [Documentation]     Caso de teste valida o filtro "Tipo de índice" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Tipo de índice
    Então sistema exibe informações de filtro Tipo de índice

CT 04.02.06 - Validar filtro Status do índice
    [Documentation]     Caso de teste valida o filtro "Status do índice" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Status do índice
    Então sistema exibe informações de filtro Status do índice

CT 04.02.07 - Validar filtro Empresa
    [Documentation]     Caso de teste valida o filtro "Empresa" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Empresa
    Então sistema exibe informações de filtro Empresa

CT 04.02.08 - Validar filtro Departamento
    [Documentation]     Caso de teste valida o filtro "Departamento" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Departamento
    Então sistema exibe informações de filtro Departamento em Contratos

CT 04.02.09 - Validar filtro Documento
    [Documentation]     Caso de teste valida o filtro "Documento" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Documento
    Então sistema exibe informações de filtro Documento

CT 04.02.10 - Validar filtro Nome de indivíduo
    [Documentation]     Caso de teste valida o filtro "Nome de indivíduo" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Nome de indivíduo
    Então sistema exibe informações de filtro Nome de indivíduo

CT 04.02.11 - Validar filtro Status de vigência
    [Documentation]     Caso de teste valida o filtro "Status de vigência" em Contratos > Contratos
    [Tags]    Contratos    Contratos    Funcional        
    Dado que clico no menu Contratos > Contratos
    Quando clico em "Filtros"
    E preencho informação de filtro Status de vigência
    Então sistema exibe informações de filtro Status de vigência




