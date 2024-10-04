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

    
CT 06.04.02 - Validar funcionalidade "inserir" no menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Tipo de Financiamento está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Tipo de Gerador
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.04.03 - Validar funcionalidade "editar" menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Tipo de Financiamento está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado em Tipo de Gerador
    Então sistema exibe informações de "Editar"

CT 06.04.04 - Validar filtro "buscar" no menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 06.04.05 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.04.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Pessoas

CT 06.04.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

CT 06.04.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Tipo de Financiamento
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro de Tipo de Financiamento

CT 06.04.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Tipo de Financiamento
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Tipo de Financiamento está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Tipo de Financiamento"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou


CT 06.05.01 - Validar menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se Menu Cadastros Classificações está funcional
    [Tags]    Cadastros    Funcional
    Dado que clico no menu "Cadastros > Classificações"
    Então sistema exibe informações de cadastro de "Classificações"

    
CT 06.05.02 - Validar funcionalidade "inserir" no menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Classificações está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Tipo de Gerador
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.05.03 - Validar funcionalidade "editar" menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Classificações está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado em Tipo de Gerador
    Então sistema exibe informações de "Editar"

CT 06.05.04 - Validar filtro "buscar" no menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 06.05.05 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.05.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Pessoas

CT 06.05.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

CT 06.05.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Classificações
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Classificações
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro de Classificações

CT 06.05.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Classificações
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Classificações está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Classificações"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

CT 06.06.01 - Validar menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se Menu Cadastros Motivos de Urgência está funcional
    [Tags]    Cadastros    Funcional
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    Então sistema exibe informações de cadastro de "Motivos de Urgência"

    
CT 06.06.02 - Validar funcionalidade "inserir" no menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Motivos de Urgência está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Motivos de Urgência
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.06.03 - Validar funcionalidade "editar" menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Motivos de Urgência está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado em Tipo de Gerador
    Então sistema exibe informações de "Editar"

CT 06.06.04 - Validar filtro "buscar" no menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 06.06.06 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.06.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Pessoas

CT 06.06.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

CT 06.06.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Motivos de Urgência
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro de Motivos de Urgência

CT 06.06.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Motivos de Urgência
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Motivos de Urgência está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Motivos de Urgência"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

CT 06.07.01 - Validar menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se Menu Cadastros Concessionárias está funcional
    [Tags]    Cadastros    Funcional
    Dado que clico no menu "Cadastros > Concessionárias"
    Então sistema exibe informações de cadastro de "Concessionárias"
    
CT 06.07.02 - Validar funcionalidade "inserir" no menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Concessionárias está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Concessionárias"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Concessionárias
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.07.03 - Validar funcionalidade "editar" menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Concessionárias está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Concessionárias"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado em Concessionárias
    Então sistema exibe informações de "Editar"

CT 06.07.04 - Validar filtro "buscar" no menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Concessionárias"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 06.07.06 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Concessionárias"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.07.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Concessionárias"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Pessoas

CT 06.07.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Concessionárias"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

CT 06.07.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Concessionárias
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Concessionárias"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro de Concessionárias

CT 06.07.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Concessionárias
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Concessionárias está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

CT 06.08.01 - Validar menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se Menu Cadastros Departamentos está funcional
    [Tags]    Cadastros    Funcional
    Dado que clico no menu "Cadastros > Departamentos"
    Então sistema exibe informações de cadastro de "Departamentos"
    
CT 06.08.02 - Validar funcionalidade "inserir" no menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Departamentos está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Departamentos
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.08.03 - Validar funcionalidade "editar" menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Departamentos está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado em Departamentos
    Então sistema exibe informações de "Editar"

CT 06.08.04 - Validar filtro "buscar" no menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 06.08.05 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.08.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Pessoas

CT 06.08.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

CT 06.08.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Departamentos
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro de Departamentos

CT 06.08.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Departamentos
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Departamentos está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

CT 06.09.01 - Validar menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida se Menu Cadastros Origem da indicação está funcional
    [Tags]    Cadastros    Funcional
    Dado que clico no menu "Cadastros > Origem da indicação"
    Então sistema exibe informações de cadastro de "Origem de indicação"
    
CT 06.09.02 - Validar funcionalidade "inserir" no menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Origem da indicação está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Origem da indicação"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Origem da indicação
    E clico em "Salvar"
    Então sistema salva novo cadastro de pessoas

CT 06.09.03 - Validar funcionalidade "editar" menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Cadastros > Origem da indicação está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Origem da indicação"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado em Origem da indicação
    Então sistema exibe informações de "Editar"

CT 06.09.04 - Validar filtro "buscar" no menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Origem da indicação"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 06.09.06 - Validar botão "Cancelar" em "Excluir" no menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Origem da indicação"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Pessoas"

CT 06.09.06- Validar botão "Continuar" em "Excluir" no menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Origem da indicação"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Cadastro > Pessoas

CT 06.09.07 - Validar filtro "Cards ou Lista" no menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Origem da indicação"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"

CT 06.09.08 - Validar busca não encontrada no filtro buscar no menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no menu Cadastros > Origem da indicação
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Origem da indicação"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro de Origem da indicação

CT 06.09.09 - Validar botão "Fechar" no filtro buscar menu Cadastros > Origem da indicação
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar menu Cadastros > Origem da indicação está funcional
    [Tags]    Cadastros    Funcional        
    Dado que clico no menu "Cadastros > Departamentos"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou    


# - Validar menu
# - Funcionalidade Inserir
# - Funcionalidade Editar
# - Filtro Buscar
# - Botão Cancelar
# - Botão Continuar
# - Filtro Card ou Lista
# - Validar Busca Não encontrada
# - Validar botão fechar 


