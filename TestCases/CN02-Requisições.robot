*** Settings ***
# Resource           ../Resources/SuiteSetup.robot
Resource           ../Resources/Main.robot
# Suite Setup        Setup Chrome Driver
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie requisições cadastradas no sistema.

*** Test Cases ***
CT 02.01 - Validar menu Requisições
    [Documentation]     Caso de teste valida se Menu Requisições está funcional
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"

CT 02.02 - Validar filtro Cliente
    [Documentation]     Caso de teste valida o filtro Cliente em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações no campo Cliente
    Então sistema exibe requisições do filtro Cliente

CT 02.03 - Validar filtro Departamento
    [Documentation]     Caso de teste valida o filtro Departamento em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido filtros dentro de Departamento em Requisições
    Então sistema exibe requisições do filtro Departamento

CT 02.04 - Validar filtro Status
    [Documentation]     Caso de teste valida o filtro Status em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Status em Requisições
    Então sistema exibe requisições do filtro Status

CT 02.05 - Validar filtro Tipo
    [Documentation]     Caso de teste valida o filtro Tipo em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Tipo em Requisições
    Então sistema exibe requisições do filtro Tipo

CT 02.06 - Validar filtro Urgente
    [Documentation]     Caso de teste valida o filtro Urgente em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Urgente em Requisições
    Então sistema exibe requisições do filtro Urgente

CT 02.07 - Validar filtro Nível de urgência
    [Documentation]     Caso de teste valida o filtro Nível de urgência em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono urgente "Sim"
    E valido todos os filtros de Nivel de urgencia em Requisições
    Então sistema exibe requisições do filtro Urgente

CT 02.08 - Validar filtro Data de entrega
    [Documentation]     Caso de teste valida o filtro Data de entrega em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações de Data de entrega
    Então sistema exibe requisições do filtro Data de entrega

CT 02.09 - Validar filtro Data de criação
    [Documentation]     Caso de teste valida o filtro Data de criação em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações de Data de criação
    Então sistema exibe requisições do filtro Data de Criação
    
CT 02.10 - Validar filtro Responsável
    [Documentation]     Caso de teste valida o filtro Responsável em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de "Responsável"
    Então sistema exibe requisições de filtro Responsável

CT 02.11 - Validar filtro Representante comercial
    [Documentation]     Caso de teste valida o filtro Representante comercial em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido filtro dentro de "Representante comercial"
    Então sistema exibe requisições de filtro Representante comercial

CT 02.12 - Validar filtro Vendedor
    [Documentation]     Caso de teste valida o filtro Vendedor em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono filtro vendedor "Todos"
    Então sistema exibe requisições de filtro vendedor "Todos"

CT 02.13 - Validar filtro Renovadas
    [Documentation]     Caso de teste valida o filtro Renovadas em Requisições
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de "Renovadas"
    Então sistema exibe requisições de filtro Renovadas

CT 02.14 - Validar botão Inserir "Técnico"
    [Documentation]     Caso de teste valida botão Inserir "Técnico" em Requisições
    [Tags]    Requisições   
#   Verifico se há Requisição B3 (teste)
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro com cliente "B3 (teste)" para verificação
    Então sistema verifica se há requisição B3 (teste)

#   Verifico se há cadastro B3 (teste)
    Dado que clico no menu "Cadastros > Clientes"
    E clico no botao buscar
    E preencho informações de pesquisa para verificação
    Então sistema verifica se há cadastro B3 (teste)

#   Inserir cadastro
    Dado que clico no menu "Requisições"
    Quando clico no botão "Inserir/Técnico"
    E preencho informações de cadastro de requisição
    Então sistema exibe mensagem de cadastro realizado

#   Excluir requisição
    Aguardo carregamento da página 
    Quando clico em "Filtros"
    E preencho filtro com cliente
    E clico no botão "Editar"
    E clico no botão "Excluir requisição"
    Então sistema exclui e retorna para menu requisições 

#   Excluir cadastro em Cadastros > Clientes
    Dado que clico no menu "Cadastros > Clientes"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exibe mensagem de cadastro excluido

CT 02.15 - Validar botão Editar
    [Documentation]     Caso de teste valida botão editar em Requisições
    [Tags]    Requisições    SmokeTest
#   Verifico se há cadastro temporario
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario" para verificação
    Então sistema verifica se há cadastro temporario

#   Inserir cadastro temporário
    Dado que clico no menu "Requisições"
    Quando clico no botão "Inserir/Técnico"
    E preencho informações de cadastro de requisição com cliente "temporario"
    Então sistema exibe mensagem de cadastro realizado

#   Editar cadastro temporario
    Aguardo carregamento da página
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E clico no botão "Editar"
    E preencho informações de requisição editada
    Então sistema conlcui edição de requisição

#   Excluir cadastro temporario
    Aguardo carregamento da página
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E clico no botão "Editar"
    E clico no botão "Excluir requisição" temporario
    Então sistema exclui e retorna para menu requisições 

#   Excluir cadastro temporario em Cadastros > Clientes
    Aguardo carregamento da página
    Dado que clico no menu "Cadastros > Clientes"
    E clico no botao buscar
    E preencho informações de pesquisa com cliente "temporario"
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exibe mensagem de cadastro excluido

CT 02.16 - Validar botão Visualizar 
    [Documentation]     Caso de teste valida botão visualizar 
    [Tags]    Requisições    SmokeTest 
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente 
    E clico no botão "Visualizar"
    Então sistema exibe informações de Visualizar em requisições

CT 02.17 - Validar botão Mudar Status Requisição
    [Documentation]     Caso de teste valida botão Mudar Status Requisição
    [Tags]    Requisições    SmokeTest
#   Verifica se requisição padrão está "Fila" 
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    Então sistema verifica se Requisição padrão está em "Fila"

#   Mudar status para Concluido
    E volto pra tela inicio
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E seleciono opção "Concluído" no botão Mudar Status Requisição em requisicoes
    Então sistema verifica status de requisição alterado
    
#   Retornar status para Fila
    Aguardo carregamento da página 
    E seleciono opção "Fila" no botão Mudar Status Requisição em requisicoes
    Então sistema verifica status de requisição alterado para fila
    
CT 02.18 - Validar botão Histórico 
    [Documentation]     Caso de teste valida botão Histórico 
    [Tags]    Requisições     
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E clico no botão "Histórico"
    Então sistema exibe histórico em requisições

CT 02.19 - Validar botão Renovar
    [Documentation]     Caso de teste valida botão Renovar em Requisições
    [Tags]    Requisições    SmokeTest
#   Verifico se há requisiçao temporario
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario" para verificação
    Então sistema verifica se há cadastro temporario
    
#   Verifico se há cadastro temporario em Clientes
    Aguardo carregamento da página
    Dado que clico no menu "Cadastros > Clientes"
    E clico no botao buscar
    E preencho informações de pesquisa para verificação de temporario
    Então sistema verifica se existe cadastro temporario

#   Inserir cadastro temporário
    Dado que clico no menu "Requisições"
    Quando clico no botão "Inserir/Técnico"
    E preencho informações de cadastro de requisição com cliente "temporario"
    Então sistema exibe mensagem de cadastro realizado

#   Muda status para concluido
    Aguardo carregamento da página
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E seleciono opção "Concluído" no botão Mudar Status Requisição em requisicoes
    Então sistema verifica status de requisição renovada alterado

#   Renovar requisição
    Aguardo carregamento da página
    E clico no botão "Renovar"

#   Excluir requisição Renovada
    Aguardo carregamento da página 
    E clico no botão "Excluir requisição" temporario em Obras
    Então sistema exclui e retorna para menu requisições 

#   Excluir requisição temporario
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E clico no botão "Editar"
    E clico no botão "Excluir requisição" temporario
    Então sistema exclui e retorna para menu requisições 

#   Excluir cadastro temporario em Cadastros > Clientes
    Dado que clico no menu "Cadastros > Clientes"
    E clico no botao buscar
    E preencho informações de pesquisa com cliente "temporario"
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exibe mensagem de cadastro excluido

CT 02.21 - Validar botão Comentários 
    [Documentation]     Caso de teste valida botão Comentários 
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E clico no botão "Comentários"
    E preencho informações de comentário
    Então sistema exibe mensagem de confirmação

CT 02.22 - Excluir requisição tipo "Técnico"
    [Documentation]     Caso de teste valida funcionalidade excluir 
    [Tags]    Requisições    SmokeTest
#   Inserir cadastro temporario
    Dado que clico no menu "Requisições"
    Quando clico no botão "Inserir/Técnico"
    E preencho informações de cadastro de requisição com cliente "temporario"
    Então sistema exibe mensagem de cadastro realizado

#   Excluir requisição temporario
    Aguardo carregamento da página
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E clico no botão "Editar"
    E clico no botão "Excluir requisição" temporario
    Então sistema exclui e retorna para menu requisições 

#   Excluir cadastro temporario em Cadastros > Clientes
    Dado que clico no menu "Cadastros > Clientes"
    E clico no botao buscar
    E preencho informações de pesquisa com cliente "temporario"
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exibe mensagem de cadastro excluido

CT 02.23 - Tentar inserir requisição sem campos obrigatórios
    [Documentation]     Caso de teste valida inserir sem preencher campos obrigatórios (Erro) 
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico no botão "Inserir/Técnico"
    E clico em próximo sem preencher campos
    Então sistema exibe mensagem de campos obrigatórios não preenchido

CT 02.24 - Tentar inserir requisição preenchendo somente telefone
    [Documentation]     Caso de teste valida inserir preenchendo somente o campo telefone (Erro) 
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico no botão "Inserir/Técnico"
    Preencho o campo CPF
    Preencho somente campo telefone
    Então sistema exibe mensagem de CEP não preenchido
    
CT 02.25 - Tentar inserir requisição preenchendo somente CEP
    [Documentation]     Caso de teste valida inserir preenchendo somente o campo CEP (Erro) 
    [Tags]    Requisições        
    Dado que clico no menu "Requisições"
    Quando clico no botão "Inserir/Técnico"
    Preencho o campo CPF
    Preencho somente campo CEP
    Então sistema exibe mensagem de telefone não preenchido
    
