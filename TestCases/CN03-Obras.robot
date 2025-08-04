*** Settings ***
# Resource           ../Resources/SuiteSetup.robot
Resource           ../Resources/Main.robot
# Suite Setup        Setup Chrome Driver
Test Setup         Dado que acesse a Isolar e logue no sistema com Oseias
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.

*** Test Cases ***
CT 03.01.01 - Validar menu Obras
    [Documentation]     Caso de teste valida se Menu Obras > Dashboard está funcional
    [Tags]    Obras        
    Dado que clico no menu Obras > Dashboard
    Então sistema exibe tela de Obras > Dashboard
    
CT 03.01.02 - Validar requisições em Fila
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Fila
    [Tags]    Obras        
    Dado que clico no menu Obras > Dashboard
    Quando clico em "Fila"
    Então sistema exibe requisições com status "Fila"

CT 03.01.03 - Validar requisições em Produção
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Produção
    [Tags]    Obras        
    Dado que clico no menu Obras > Dashboard
    Quando clico em "Produção"
    Então sistema exibe requisições com status "Produção"

CT 03.01.04 - Validar requisições em Concluídas
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Concluídas
    [Tags]    Obras        
    Dado que clico no menu Obras > Dashboard
    Quando clico em "Concluídas"
    Então sistema exibe requisições com status "Concluídas"

CT 03.01.05 - Validar requisições em Paradas
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Paradas
    [Tags]    Obras        
    Dado que clico no menu Obras > Dashboard
    Quando clico em "Paradas"
    Então sistema exibe requisições com status "Paradas"

CT 03.01.06 - Validar filtros de data
    [Documentation]     Caso de teste valida se filtros de data inicial e data final está funcional
    [Tags]    Obras        
    Dado que clico no menu Obras > Dashboard
    E preencho data inicial em Obras > Dashboard
    E preencho data final em Obras > Dashboard
    Então sistema exibe informações de filtros de data

# CT 03.01.07 - Validar filtros em departamento
#     [Documentation]     Caso de teste valida os filtros Departamento
#     [Tags]    Obras       
#     Dado que clico no menu Obras > Dashboard
#     E valido filtros de departamento em Obras
#     Então sistema exibe requisições do departamento em Obras

CT 03.02.01 - Validar menu Obras > Requisições
    [Documentation]     Caso de teste valida se Menu Obras > Requisições está funcional
    [Tags]    Obras        
    Dado que clico no menu Obras > Requisições
    Então sistema exibe tela de Obras > Requisições

CT 03.02.02 - Validar filtro Cliente
    [Documentation]     Caso de teste valida o filtro Cliente em Obras > Requisições
    [Tags]    Obras        
#   Verifico se há cliente B3 (Padrão)
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho informações no campo Cliente em Obras
    Então sistema verifica se há requisição B3 (Padrão)    

#   Validar filtro Cliente
    Então sistema exibe resultado do filtro em Obras

# CT 03.02.03 - Validar filtro Departamento
#     [Documentation]     Caso de teste valida o filtro Departamento em Obras > Requisições
#     [Tags]    Obras        
#     Dado que clico no menu Obras > Requisições
#     Quando clico em "Filtros"
#     E valido filtros dentro de Departamento em Obras > Requisições
#     Então sistema exibe resultado de Departamento

#  BUG # Obras > Requisições
CT 03.02.04 - Validar filtro Tipo
    [Documentation]     Caso de teste valida o filtro Tipo em Obras > Requisições
    [Tags]    Obras        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Tipo em Obras > Requisições
    Então sistema exibe informações do filtro Tipo

CT 03.02.05 - Validar filtro Urgente
    [Documentation]     Caso de teste valida o filtro Urgente em Obras > Requisições
    [Tags]    Obras        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E seleciono urgente "Sim"
    Então sistema exibe resultado do filtro Urgente

CT 03.02.06 - Validar filtro Nível de urgência
    [Documentation]     Caso de teste valida o filtro Nível de urgência em Obras > Requisições
    [Tags]    Obras        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E seleciono urgente "Sim"
    E valido filtro Nível Urgencia em Obras > Requisições
    Então sistema exibe resultado de nível de urgência

CT 03.02.07 - Validar filtro Data de entrega
    [Documentation]     Caso de teste valida o filtro Data de entrega em Obras > Requisições
    [Tags]    Obras        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho informações de Data de entrega em Obras > Requisições
    Então sistema exibe resultado do filtro em Obras

CT 03.02.08 - Validar filtro Data de criação
    [Documentation]     Caso de teste valida o filtro Data de criação em Obras > Requisições
    [Tags]    Obras        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho informações de Data de criação em Obras > Requisições
    Então sistema exibe resultado do filtro em Obras

CT 03.02.09 - Validar filtro Responsável
    [Documentation]     Caso de teste valida o filtro Responsável em Obras > Requisições
    [Tags]    Obras        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E valido todos os filtros dentro de "Responsável" em Obras > Requisições
    Então sistema exibe resultado de filtro Responsável

CT 03.02.10 - Validar botão Inserir "Obras"
    [Documentation]     Caso de teste valida botão Inserir "Obras" em Obras > Requisições
    [Tags]    Obras   
#   Verifico se há cadastro temporario
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario" para verificação
    Então sistema verifica se há cadastro temporario

#   Inserir cadastro temporário
    E volto pra tela inicial
    Dado que clico no menu Obras > Requisições
    Quanto clico no botão "Inserir/Obras"
    E preencho informações de cadastro de requisição com cliente "temporario"
    Então sistema exibe mensagem de cadastro realizado

#   Excluir requisição temporario
    Aguardo carregamento da página 
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E clico no botão "Editar"
    E clico no botão "Excluir requisição" temporario
    Então sistema exclui e retorna para menu requisições 

CT 03.02.11 - Validar botão Editar
    [Documentation]     Caso de teste valida botão editar em Obras > Requisições
    [Tags]    Obras 
#   Verifico se há requisição temporario
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario" para verificação
    Então sistema verifica se há cadastro temporario

#   Inserir cadastro temporário
    E volto pra tela inicio
    Reload Page
    Dado que clico no menu Obras > Requisições
    Quanto clico no botão "Inserir/Obras"
    E preencho informações de cadastro de requisição com cliente "temporario"
    Então sistema exibe mensagem de cadastro realizado

#   Editar cadastro temporario
    Aguardo carregamento da página
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E clico no botão "Editar"
    E preencho informações de editar requisição em Obras
    Então sistema conlcui edição de requisição em Obras

#   Excluir requisição temporario
    Aguardo carregamento da página 
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E clico no botão "Editar"
    E clico no botão "Excluir requisição" temporario
    Então sistema exclui e retorna para menu requisições 

CT 03.02.12 - Validar botão Visualizar 
    [Documentation]     Caso de teste valida botão visualizar em Obras 
    [Tags]    Obras 
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro Cliente em Obras
    E clico no botão "Visualizar"
    Então sistema exibe informações de Visualizar em requisições

CT 03.02.13 - Validar botão Mudar Status Requisição
    [Documentation]     Caso de teste valida botão Mudar Status Requisição em Obras
    [Tags]    Obras 
#   Verificar se requisição está "fila" inicialmente
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro Cliente em Obras
    Então sistema verifica se requisição está "fila" inicialmente

#   Mudar Status da Requisição para concluído
    E volto pra tela inicio
    Reload Page
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro Cliente em Obras
    E clico no botão "Editar"
    E seleciono opção "Concluído" em editar status em Obras
    Então sistema verifica status de Requisição em Obras 

#   Verificar se status da requisição foi atualizado para Concluído
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro Cliente em Obras
    Então sitema verifica se status é concluído

#   Retornar Status da Requisição para Fila
    Aguardo carregamento da página
    E clico no botão "Editar"
    E seleciono opção "Fila" em editar status em Obras
    
#   Verificar se status da requisição foi retornado para Fila
    Aguardo carregamento da página
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro Cliente em Obras
    Então sitema verifica se status é Fila

CT 03.02.14 - Validar botão Comentários 
    [Documentation]     Caso de teste valida botão Comentários em Obras > Requisições
    [Tags]    Obras   
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho filtro Cliente em Obras
    E clico no botão "Comentários"
    E preencho informações de comentário de requisição em Obras
    Então sistema exibe mensagem de confirmação

CT 03.02.15 - Excluir requisição tipo "Técnico"
    [Documentation]     Caso de teste valida funcionalidade excluir em Obras
    [Tags]    Obras   
#   Verifico se há requisiçao temporario
    Dado que clico no menu Obras > Requisições
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
    Dado que clico no menu Obras > Requisições
    Quanto clico no botão "Inserir/Obras"
    E preencho informações de cadastro de requisição com cliente "temporario"
    Então sistema exibe mensagem de cadastro realizado

#   Excluir requisição temporario
    Aguardo carregamento da página
    Quando clico em "Filtros"
    E preencho filtro com cliente "temporario"
    E clico no botão "Editar"
    E clico no botão "Excluir requisição" em Obras
    Então sistema exclui e retorna para menu Obras > requisições 

#   Excluir cadastro temporario em Cadastros > Clientes
    Dado que clico no menu "Cadastros > Clientes"
    E clico no botao buscar
    E preencho informações de pesquisa com cliente "temporario"
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"
    Então sistema exibe mensagem de cadastro excluido

CT 03.02.16 - Tentar inserir requisição sem campos obrigatórios
    [Documentation]     Caso de teste valida inserir sem preencher campos obrigatórios (Erro) 
    [Tags]    Obras         
    Dado que clico no menu Obras > Requisições
    Quanto clico no botão "Inserir/Obras"
    E clico em próximo sem preencher campos
    Então sistema exibe mensagem de campos obrigatórios não preenchido

CT 03.02.17 - Tentar inserir requisição preenchendo somente telefone
    [Documentation]     Caso de teste valida inserir preenchendo somente o campo telefone (Erro) 
    [Tags]    Obras         
    Dado que clico no menu Obras > Requisições
    Quanto clico no botão "Inserir/Obras"
    Preencho o campo CPF
    Preencho somente campo telefone
    Então sistema exibe mensagem de CEP não preenchido em Obras 

CT 03.02.18 - Tentar inserir requisição preenchendo somente CEP
    [Documentation]     Caso de teste valida inserir preenchendo somente o campo CEP (Erro) 
    [Tags]    Obras         
    Dado que clico no menu Obras > Requisições
    Quanto clico no botão "Inserir/Obras"
    Preencho o campo CPF
    Preencho somente campo CEP
    Então sistema exibe mensagem de telefone não preenchido

# ...
# Inserir 
# Editar
# Excluir
# Comentários
# Visualizar

