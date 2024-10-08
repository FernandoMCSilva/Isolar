*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie usuários cadastrados no sistema.

*** Test Cases ***
CT 07.01 - Validar menu Usuários
    [Documentation]     Caso de teste valida se Menu Usuário está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    Então sistema exibe usuários

CT 07.02 - Validar funcionalidade "inserir" no Usuários
    [Documentation]     Caso de teste valida se funcionalidade Editar no Usuários está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    Quando clico no botão "Inserir"
    E preencho informações de inserir novo cadastro de Usuários
    E clico em "Salvar"
    Então sistema salva novo cadastro de Usuários

CT 07.03 - Validar funcionalidade "editar" Usuários
    [Documentation]     Caso de teste valida se funcionalidade Editar no Usuários está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado no menu Usuários
    E preencho campo de senha
    Então sistema exibe informações de "Editar"

CT 07.04 - Validar filtro "buscar" no Usuários
    [Documentation]     Caso de teste valida se filtro buscar está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa

CT 07.05 - Validar botão "Cancelar" em "Excluir" no Usuários
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de cadastro de "Usuários"

CT 07.06- Validar botão "Continuar" em "Excluir" no Usuários
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Usuários

CT 07.07 - Validar filtro "Cards ou Lista" no Usuários
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista"


CT 07.08 - Validar busca não encontrada no filtro buscar no Usuários
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar no Usuários
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro em Usuários

CT 07.09 - Validar botão "Fechar" no filtro buscar Usuários
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar Usuários está funcional
    [Tags]    Usuários    Funcional        
    Dado que clico no menu "Usuários"
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
