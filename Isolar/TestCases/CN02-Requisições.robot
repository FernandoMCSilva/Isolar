*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie requisições cadastradas no sistema.

*** Test Cases ***
CT 02.01 - Validar menu Requisições
    [Documentation]     Caso de teste valida se Menu Requisições está funcional
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"

CT 02.02 - Validar filtro Cliente
    [Documentation]     Caso de teste valida o filtro Cliente em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações no campo Cliente
    Então sistema exibe requisições do filtro Cliente

CT 02.03 - Validar filtro Departamento
    [Documentation]     Caso de teste valida o filtro Departamento em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Departamento em Requisições
    Então sistema exibe requisições do filtro Departamento

CT 02.04 - Validar filtro Status
    [Documentation]     Caso de teste valida o filtro Status em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Status em Requisições
    Então sistema exibe requisições do filtro Status

CT 02.05 - Validar filtro Tipo
    [Documentation]     Caso de teste valida o filtro Tipo em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Tipo em Requisições
    Então sistema exibe requisições do filtro Tipo

CT 02.06 - Validar filtro Urgente
    [Documentation]     Caso de teste valida o filtro Urgente em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Urgente em Requisições
    Então sistema exibe requisições do filtro Urgente

CT 02.07 - Validar filtro Nível de urgência
    [Documentation]     Caso de teste valida o filtro Nível de urgência em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono urgente "Sim"
    E valido todos os filtros de Nivel de urgencia em Requisições
    Então sistema exibe requisições do filtro Urgente

CT 02.08 - Validar filtro Data de entrega
    [Documentation]     Caso de teste valida o filtro Data de entrega em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações de Data de entrega
    Então sistema exibe requisições do filtro Data de entrega

CT 02.09 - Validar filtro Data de criação
    [Documentation]     Caso de teste valida o filtro Data de criação em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho informações de Data de criação
    Então sistema exibe requisições do filtro Data de Criação

CT 02.10 - Validar filtro Responsável
    [Documentation]     Caso de teste valida o filtro Responsável em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de "Responsável"
    Então sistema exibe requisições de filtro Responsável

CT 02.11 - Validar filtro Representante comercial
    [Documentation]     Caso de teste valida o filtro Representante comercial em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido filtro dentro de "Representante comercial"
    Então sistema exibe requisições de filtro Representante comercial

CT 02.12 - Validar filtro Vendedor
    [Documentation]     Caso de teste valida o filtro Vendedor em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E seleciono filtro vendedor "Todos"
    Então sistema exibe requisições de filtro vendedor "Todos"

CT 02.13 - Validar filtro Renovadas
    [Documentation]     Caso de teste valida o filtro Renovadas em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E valido todos os filtros dentro de "Renovadas"
    Então sistema exibe requisições de filtro Renovadas

CT 02.14 - Validar botão Inserir "Técnico" em Requisições
    [Documentation]     Caso de teste valida botão Inserir "Técnico" em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quanto clico no botão "Inserir/Técnico"
    E preencho informações de cadastro de requisição
    Então sistema exibe mensagem de cadastro realizado

CT 02.15 - Validar botão Editar em Requisições
    [Documentation]     Caso de teste valida botão editar em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E clico no botão "Editar"
    E preencho informações de requisição editada
    Então sistema conlcui edição de requisição

CT 02.16 - Validar botão Visualizar em Requisições
    [Documentation]     Caso de teste valida botão editar em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E clico no botao "acoes"
    E clico no botão "Visualizar"
    Então sistema exibe informações de Visualizar em requisições

CT 02.17 - Validar botão Ações em Requisições
    [Documentation]     Caso de teste valida botão Ações em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E seleciono opção "Concluído" no botão ações em requisicoes
    Então sistema verifica funcionalidade do botão ações em Requisições

CT 02.18 - Validar botão Histórico em Requisições
    [Documentation]     Caso de teste valida botão Histórico em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E clico no botão "Histórico"
    Então sistema exibe histórico em requisições

CT 02.19 - Validar botão Renovar em Requisições
    [Documentation]     Caso de teste valida botão Renovar em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E clico no botão "Renovar"
    Então sistema exibe mensagem de renovação

CT 02.20 - Validar botão Comentários em Requisições
    [Documentation]     Caso de teste valida botão Comentários em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E clico no botão "Comentários"
    E preencho informações de comentário
    Então sistema exibe mensagem de confirmação

CT 02.21 - Validar botão Inserir "Ti" em Requisições
    [Documentation]     Caso de teste valida botão Inserir "Ti" em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quanto clico no botão "Inserir/Ti"
    Então sistema exibe mensagem de cadastro TI realizado
    
CT 02.22 - Validar botão Inserir "Departamento pessoal" em Requisições
    [Documentation]     Caso de teste valida botão Inserir "Departamento pessoal" em Requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quanto clico no botão "Inserir/DP"
    E preencho informações de cadastro de requisição "Departamento Pessoal"
    Então sistema exibe mensagem de cadastro realizado

CT 02.23 - Validar excluir em requisições
    [Documentation]     Caso de teste valida funcionalidade excluir em requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Requisições"
    Quando clico em "Filtros"
    E preencho filtro Cliente
    E clico no botão "Editar"
    E clico no botão "Excluir requisição"
    Então sistema exclui e retorna para menu requisições 

CT 02.24 - Validar funcionalidade excluir cadastro de requisiçao em Cadastros > Clientes
    [Documentation]     Caso de teste valida funcionalidade excluir em requisições
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Cadastros > Clientes"
    E clico no botao buscar
    E preencho informações de pesquisa
    Quando clico em "Excluir"
    E clico no botão "Continuar" em "Excluir"


