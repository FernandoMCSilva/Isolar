*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie informações cadastradas no sistema.

*** Test Cases ***
CT 05.01 - Validar menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se Menu Cadastros Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"

CT 05.02 - Validar menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida se Menu Cadastros Grupos Consumidores está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"

CT 05.03 - Validar menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se Menu Cadastros Tipo de Gerador está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"

CT 05.04 - Validar menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se Menu Cadastros Tipo de Financiamento está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"

CT 05.05 - Validar menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se Menu Cadastros Classificações está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"

CT 05.06 - Validar menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se Menu Cadastros Motivos de Urgência está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"

CT 05.07 - Validar menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se Menu Cadastros Concessionárias está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Concessionárias"

CT 05.08 - Validar menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se Menu Cadastros Departamentos está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"

CT 05.09 - Validar menu Cadastros > Origem da Indicação
    [Documentation]     Caso de teste valida se Menu Cadastros Origem da Indicação está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Origem da Indicação"






