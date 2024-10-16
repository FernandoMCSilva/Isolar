*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo gerencia Configurações no sistema.

*** Test Cases ***
CT 09.01.01 - Validar menu Configurações > Requisições
    [Documentation]     Caso de teste valida se Menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    Então sistema exibe informações de menu Requisições

CT 09.01.02 - Validar funcionalidade "inserir" no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se funcionalidade Inserir no menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    Quando clico no botão "Novo tipo"
    E preencho informações de cadastro de Novo tipo de Requisições
    E clico em "Salvar"
    Então sistema salva novo Tipo de requisição

CT 09.01.03 - Validar funcionalidade "editar" Configurações > Requisições
    [Documentation]     Caso de teste valida se funcionalidade Editar no menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional       
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de cadastro editado no menu Configurações > Requisições
    Então sistema exibe informações de "Editar" no menu Configurações > Requisições

# CT 09.01.04 - Validar filtro Status "Ligado ou Desligado" no menu Configurações > Requisições
#     [Documentation]     Caso de teste valida se filtro status "Ligado ou Desligado" está funcional
#     [Tags]    Configurações    Requisições    Funcional       
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Quando clico no filtro status
#     Então sistema exibe informações de "Editar" no menu Configurações > Requisições

CT 09.01.05 - Validar filtro "buscar" no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se filtro buscar no menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa de tipo de requisição

CT 09.01.06 - Validar botão "Cancelar" em Excluir no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional no menu Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    Quando clico em "Excluir"
    E clico no botão "Cancelar" em "Excluir"
    Então sistema exibe informações de menu Requisições

CT 09.01.07 - Validar botão "Continuar" em Excluir no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional no menu Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exclui item do menu Configurações > Requisições

CT 09.01.08 - Validar botão "Perguntas" no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se botão Perguntas no menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao "Perguntas"
    Então sistema exibe informações de "Perguntas" no menu Configurações > Requisições

CT 08.01.09 - Validar funcionalidade "Inserir" nova pergunta em perguntas no menu Configurações > Requisições
    [Documentation]     Caso de teste valida funcionalidade "Inserir" nova pergunta em perguntas no menu Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao "Perguntas"
    E preencho informações de nova pergunta
    E clico em "Salvar"
    Então sistema exibe mensagem de pergunta adicionada no menu Configurações > Requisições

CT 08.01.10 - Validar funcionalidade "Editar" em Perguntas no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se funcionalidade "Editar" em Perguntas no menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao "Perguntas"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Editar"
    E preencho informações de pergunta editada no menu Configurações > Requisições > Perguntas
    Então sistema exibe informações de "Editar" no menu Configurações > Requisições > Perguntas

CT 08.01.11 - Validar filtro "buscar" em perguntas no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se filtro "buscar" em perguntas no menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao "Perguntas"
    E clico no botao buscar
    E preencho informações de pesquisa
    Então sistema exibe informações de pesquisa de perguntas

CT 08.01.12 - Validar botão "Excluir" em perguntas no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se botão Excluir em perguntas está funcional no menu Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao "Perguntas"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    Então sistema exclui pergunta do menu Configurações > Requisições > Perguntas

CT 08.01.13 - Validar filtro "Cards ou Lista" em Perguntas no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se filtro Cards ou Lista em Perguntas no menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao "Perguntas"
    Quando clico no filtro "Cards" em perguntas
    E clico em "Lista" em perguntas
    Então sistema exibe informações com filtro "Lista"

CT 08.01.14 - Validar busca não encontrada no filtro buscar em perguntas no menu Configurações > Requisições
    [Documentation]     Caso de teste valida busca não encontrada em perguntas no menu Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao "Perguntas"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro em Perguntas

CT 08.01.15 - Validar filtro Quantidade de itens por pág em perguntas no menu Configurações > Requisições
    [Documentation]     Caso de teste valida o filtro Quantidade de itens por pág em perguntas no menu Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao "Perguntas"
    Quando clico no filtro "Cards" em perguntas
    E clico em "Lista" em perguntas
    Quando clico em "Quantidade de itens por pág"
    E preencho informações no campo quantidade em perguntas
    Então sistema exibe informações de acordo com quantidade preenchida em perguntas

CT 08.01.16 - Validar botão "Fechar" no filtro buscar em Perguntas no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar em Perguntas no menu Configurações > Requisições está funcional
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

CT 08.01.17 - Validar filtro "Cards ou Lista" no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional no menu Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    Quando clico no filtro "Cards"
    E clico em "Lista"
    Então sistema exibe informações com filtro "Lista" em Configurações > Requisições

CT 08.01.18 - Validar busca não encontrada no filtro buscar no menu Configurações > Requisições
    [Documentation]     Caso de teste valida busca não encontrada no filtro buscar em Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao buscar
    E preencho informações de busca não encontrada
    Então sistema exibe mensagem de erro em Configurações > Requisições

CT 08.01.19 - Validar botão "Fechar" no filtro buscar no menu Configurações > Requisições
    [Documentation]     Caso de teste valida se botão Fechar no filtro buscar está funcional no menu Configurações > Requisições
    [Tags]    Configurações    Requisições    Funcional        
    Dado que clico no menu "Configurações > Requisições"
    E clico no botao buscar
    E clico em "Fechar"
    Então sistema verifica se filtro buscar fechou

# - Validar menu
# - Funcionalidade Novo Tipo
# - Funcionalidade Editar
# - Funcionalidade Status (Ligar e Desligar)
# - Filtro Buscar
# - Botão Cancelar
# - Botão Continuar
# - Botão Perguntas
# - Editar perguntas
# - Buscar perguntas
# - Excluir perguntas
# - Filtro Cards ou lista em perguntas
# - Busca não encontrada em perguntas
# - Filtro quantidade por páginas
# - Validar botão Fechar na funcionalidade buscar em perguntas
# - Filtro Card ou Lista
# - Validar Busca Não encontrada
# ...
# - Validar botão fechar 

# CT 09.02.01 - Validar menu Configurações > Minerando sol 
#     [Documentation]     Caso de teste valida se Menu Configurações > Minerando sol está funcional
#     [Tags]    Configurações    Funcional        
#     Dado que clico no menu "Configurações > Minerando sol"
#     Então sistema exibe informações de menu Minerando sol

# CT 09.03.01 - Validar menu Configurações > Documentos
#     [Documentation]     Caso de teste valida se Menu Configurações > Documentos está funcional
#     [Tags]    Configurações    Funcional        
#     Dado que clico no menu "Configurações > Documentos"
#     Então sistema exibe informações de menu Documentos

    
# CT 09.04 - Validar menu Configurações > Minerando sol
#     [Documentation]     Caso de teste valida se Menu Configurações > Minerando sol está funcional
#     [Tags]    Configurações    Funcional        
#     Dado que clico no menu "Configurações > Minerando sol"

# CT 09.05 - Validar menu Configurações > Sistema
#     [Documentation]     Caso de teste valida se Menu Configurações > Sistema está funcional
#     [Tags]    Configurações    Funcional        
#     Dado que clico no menu "Configurações > Sistema"

