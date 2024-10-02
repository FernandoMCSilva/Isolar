*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie informações cadastradas no sistema.

*** Test Cases ***
CT 06.01.01 - Validar menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se Menu Cadastros Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.01.02 - Validar funcionalidade "inserir" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de pessoas
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.01.03 - Validar funcionalidade "editar" menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado
    Então sistema exibe informações de "Editar"

CT 06.01.04 - Validar filtro "buscar" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 06.01.05 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.01.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Pessoas

CT 06.01.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"


CT 06.01.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Pessoas
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro

CT 06.01.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Pessoas
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Pessoas"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

CT 06.02.01 - Validar menu Cadastros > Grupo Consumidores
    [Documentation]     Caso de teste valida se Menu Cadastros Pessoas está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    Então sistema exibe informações de cadastro de "Grupos Consumidores"

CT 06.02.02 - Validar funcionalidade "inserir" no menu Cadastros > Grupo Consumidores
    [Documentation]     Caso de teste valida se funcionalidade Inserir no menu Cadastros > Grupo Consumidores está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Grupos Consumidores
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.02.03 - Validar funcionalidade "editar" menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Grupos Consumidores está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado em Tipo de Gerador
    Então sistema exibe informações de "Editar"

CT 06.02.04 - Validar filtro "buscar" no menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa de Grupos Consumidores

CT 06.02.05 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Grupo Consumidores está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Grupo Consumidores"

CT 06.02.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Grupos Consumidores


CT 06.02.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Grupo Consumidores
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"


CT 06.02.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Gupos Consumidores
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    E clico no botao buscar
    E preencho informações de busca não escontrada em Grupos Consumidores
    Então sistema exibe mensagem de erro em Grupos Consumidores

CT 06.02.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Grupos Consumidores
    [Documentation]     Caso de teste valida botão fechar no filtro buscar no menu Cadastros > Gupos Consumidores
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Grupos Consumidores"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

CT 06.03.01 - Validar menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se Menu Cadatros > Tipo de Gerador está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    Então sistema exibe informações de cadastro de "Tipo de Gerador"

CT 06.03.02 - Validar funcionalidade "inserir" no menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se funcionalidade inserir no menu Cadastros > Tipo de Gerador está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Tipo de Gerador
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.03.03 - Validar funcionalidade "editar" menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Tipo de Gerador está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado em Tipo de Gerador
    Então sistema exibe informações de "Editar"

CT 06.03.04 - Validar filtro "buscar" no menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa de Tipo de Gerador

CT 06.03.05 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Tipo de Gerador"

CT 06.03.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Tipo de Gerador

CT 06.03.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

CT 06.03.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Tipo de Gerador
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro em Tipo de Gerador

CT 06.03.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Tipo de Gerador
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Tipo de Gerador está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Gerador"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

CT 06.04.01 - Validar menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se Menu Cadastros Tipo de Financiamento está funcional
    [Tags]    Cadastros    Funcional
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    Então sistema exibe informações de cadastro de "Tipo de Financiamento"

    
# CT 06.04.02 - Validar funcionalidade "inserir" no menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Tipo de Financiamento está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     Quando clico no botão "Inserir"
#     E preencho informações de inserir novo cadastro de Tipo de Gerador
#     E clico em "Salvar"
#     Então sistema salva novo cadastro de pessoas

# CT 06.04.03 - Validar funcionalidade "editar" menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Tipo de Financiamento está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Quando clico em "Editar"
#     E preencho informações de cadastro editado
#     Então sistema exibe informações de "Editar"

# CT 06.04.04 - Validar filtro "buscar" no menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida se filtro buscar está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Então sistema exibe informações de pesquisa

# CT 06.04.05 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     Quando clico em "Excluir"
#     E clico no botão "Cancelar" em "Excluir"
#     Então sistema exibe informações de cadastro de "Pessoas"

# CT 06.04.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Quando clico em "Excluir"
#     E clico no botão "Continuar" em "Excluir"
#     Então sistema exclui item do menu Cadastro > Pessoas

# CT 06.04.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     Quando clico no filtro "Cards"
#     E clico em "Lista"
#     Então sistema exibe informações com filtro "Lista"

# CT 06.04.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Tipo de Financiamento
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     E clico no botao buscar
#     E preencho informações de busca não encontrada
#     Então sistema exibe mensagem de erro

# CT 06.04.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Tipo de Financiamento
#     [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Tipo de Financiamento está funcional
#     [Tags]    Cadastros    Funcional        
#     Dado que clico no menu "Cadastros > Tipo de Financiamento"
#     E clico no botao buscar
#     E clico em "Fechar"
#     Então sistema verifica se filtro buscar fechou
# - Validar menu
# - Funcionalidade Inserir
# - Funcionalidade Editar
# - Filtro Buscar
# - Botão Cancelar
# - Botão Continuar
# - Filtro Card ou Lista
# - Validar Busca Não encontrada
# - Validar botão fechar 


