*** Settings ***
# Resource           ../Resources/SuiteSetup.robot
Resource           ../Resources/Main.robot
# Suite Setup        Setup Chrome Driver
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie usuários cadastrados no sistema.

*** Test Cases ***
CT 09.01 - Validar menu Usuários
    [Documentation]     Caso de teste valida se Menu Usuário está funcional
    [Tags]    Usuários        
    Dado que clico no menu "Usuários"
    Então sistema exibe usuários

CT 09.02 - Validar botão Inserir 
    [Documentation]     Caso de teste valida se funcionalidade Inserir no Usuários está funcional
    [Tags]    Usuários        
#   Inserir cadastro
    Dado que clico no menu "Usuários"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Usuários
    E clico em "Salvar" em Usuários
    Então sistema salva novo cadastro de Usuários

#   Excluir cadastro em Cadastros > Clientes
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Usuários

CT 09.03 - Validar botão Editar
    [Documentation]     Caso de teste valida se funcionalidade Editar no Usuários está funcional
    [Tags]    Usuários      
#   Inserir cadastro
    Dado que clico no menu "Usuários"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Usuários
    E clico em "Salvar" em Usuários
    # Então sistema salva novo cadastro de Usuários

#   Editar cadastro de Usuário
    Aguardo carregamento da página
    E clico no botao buscar
    E preencho informações de pesquisa
    E clico no botao "acoes"
    Quando clico em "Editar"
    E preencho informações de cadastro editado no menu Usuários
    E clico em "Salvar" em Usuários
    E preencho campo de senha
    Então sistema exibe mensagem de informações editadas

#   Excluir cadastro em Usuários
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Usuários

CT 09.04 - Validar filtro "buscar" 
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Usuários   
#   Verifico se há cadastro B3 (teste)
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de pesquisa para verificação
    Então sistema verifica se há cadastro B3 (teste) em Usuarios

#   Inserir cadastro
    Dado que clico no menu "Usuários"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Usuários
    E clico em "Salvar" em Usuários
    Então sistema salva novo cadastro de Usuários     

#   buscar usuário
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

#   Excluir cadastro em Usuários
    Aguardo carregamento da página
    E volto pra tela inicio
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Usuários

CT 09.05 - Validar botão Cancelar em "Excluir" 
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Usuários        
    Dado que clico no menu "Usuários"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Usuários"

CT 09.06 - Validar botão Continuar em "Excluir" 
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Usuários        
#   Inserir cadastro
    Dado que clico no menu "Usuários"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Usuários
    E clico em "Salvar" em Usuários
    # Então sistema salva novo cadastro de Usuários

#   Excluir cadastro em Usuários
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Usuários

CT 09.07 - Validar filtro "Cards ou Lista" 
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Usuários        
    Dado que clico no menu "Usuários"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"


CT 09.08 - Validar busca não encontrada no filtro buscar 
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no Usuários
    [Tags]    Usuários        
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro em Usuários

CT 09.09 - Validar botão Fechar no filtro "buscar" 
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar Usuários está funcional
    [Tags]    Usuários        
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou
    
#