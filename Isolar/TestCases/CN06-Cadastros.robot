*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie informações cadastradas no sistema.

*** Test Cases ***
CT 06.01 - Validar menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se Menu Cadastros Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Então sistema exibe informações de cadastro de "Pessoas"
    
CT 06.02 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.03 - Validar botão "Confirmar" em "Excluir" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se botão Confirmar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico em "Excluir"
    E clico no botão "Confirmar" em "Excluir"
    Então sistema exlcui item do menu Cadastro > Pessoas

CT 06.04 - Validar filtro "Cards ou Lista" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

CT 06.05 - Validar filtro "buscar" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico no botão "Pesquisar"
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 06.06 - Validar busca não encontrada no filtro buscar no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Pessoas
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico no botão "Pesquisar"
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro

CT 06.07 - Validar botão "Fechar" no filtro buscar menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico no botão "Pesquisar"
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou


CT 06.08 - Validar funcionalidade "editar" menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico em "Editar"
    E preencho informações de cadastro editado
    Então sistema exibe informações de "Editar"

CT 06.09 - Validar funcionalidade "inserir" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de pessoas
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.10 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Grupo Consumidores está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Grupo Consumidores"

CT 06.11 - Validar botão "Confirmar" em "Excluir" no menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida se botão Confirmar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    Quando clico em "Excluir"
    E clico no botão "Confirmar" em "Excluir"
    Então sistema exlcui item do menu Cadastro > Grupos Consumidores


CT 06.12 - Validar filtro "Cards ou Lista" no menu Cadastros > Grupo Consumidores
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

# CT 06.13 - Validar filtro "buscar" no menu Cadastros > Grupos Consumidores
#     [Documentation]     Caso de teste valida se filtro buscar está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Grupos Consumidores"
#     Quando clico no botão "Pesquisar"
#     E preencho informações de pesquisa
#     Então sistema exibe informações de pesquisa 

# CT 06.03 - Validar menu Cadastros > Grupos Consumidores
#     [Documentation]     Caso de teste valida se Menu Cadastros Grupos Consumidores está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Grupos Consumidores"
#     Então sistema exibe informações de cadastro de "Grupo Consumidores"

# CT 06.05 - Validar menu Cadastros > Tipo de Gerador
#     [Documentation]     Caso de teste valida se Menu Cadastros Tipo de Gerador está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Gerador"
#     Então sistema exibe informações de cadastro de "Tipo de Gerador"

# CT 06.04 - Validar menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida se Menu Cadastros Tipo de Financiamento está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     Então sistema exibe informações de cadastro de "Tipo de Financiamento"

# CT 06.05 - Validar menu Cadastros > Classificações
#     [Documentation]     Caso de teste valida se Menu Cadastros Classificações está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Classificações"
#     Então sistema exibe informações de cadastro de "Classificações"

# CT 06.06 - Validar menu Cadastros > Motivos de Urgência
#     [Documentation]     Caso de teste valida se Menu Cadastros Motivos de Urgência está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Motivos de Urgência"
#     Então sistema exibe informações de cadastro de "Motivos de Urgência"

# CT 06.07 - Validar menu Cadastros > Concessionárias
#     [Documentation]     Caso de teste valida se Menu Cadastros Concessionárias está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Concessionárias"
#     Então sistema exibe informações de cadastro de "Concessionárias"

# CT 06.08 - Validar menu Cadastros > Departamentos
#     [Documentation]     Caso de teste valida se Menu Cadastros Departamentos está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Departamentos"
#     Então sistema exibe informações de cadastro de "Departamentos"

# CT 06.09 - Validar menu Cadastros > Origem de Indicação
#     [Documentation]     Caso de teste valida se Menu Cadastros Origem da Indicação está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Origem da Indicação"
#     Então sistema exibe informações de cadastro de "Origem de Indicação"






