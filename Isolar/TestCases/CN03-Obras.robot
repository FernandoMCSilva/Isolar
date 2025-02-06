*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema com Oseias
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.

*** Test Cases ***

CT 03.01.01 - Validar menu Obras
    [Documentation]     Caso de teste valida se Menu Obras > Dashboard está funcional
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Dashboard
    Então sistema exibe tela de Obras > Dashboard
    
CT 03.01.02 - Validar requisições em Fila
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Fila
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu "Início"
    Quando clico em "Fila"
    Então sistema exibe requisições com status "Fila"

CT 03.01.03 - Validar requisições em Produção
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Produção
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu "Início"
    Quando clico em "Produção"
    Então sistema exibe requisições com status "Produção"

CT 03.01.04 - Validar requisições em Concluídas
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Concluídas
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu "Início"
    Quando clico em "Concluídas"
    Então sistema exibe requisições com status "Concluídas"

CT 03.01.05 - Validar requisições em Paradas
    [Documentation]     Caso de teste valida todas as requisições que estão com status Em Paradas
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu "Início"
    Quando clico em "Paradas"
    Então sistema exibe requisições com status "Paradas"

CT 03.01.06 - Validar filtros de data
    [Documentation]     Caso de teste valida se filtros de data inicial e data final está funcional
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Dashboard
    E preencho data inicial
    E preencho data final
    Então sistema exibe informações de filtros de data

CT 03.01.07 - Validar filtros em departamento
    [Documentation]     Caso de teste valida os filtros Departamento
    [Tags]    Obras    Dashboard    Funcional       
    Dado que clico no menu Obras > Dashboard
    E valido filtros de departamento em Obras
    Então sistema exibe requisições do departamento em Obras

CT 03.02.01 - Validar menu Obras > Requisições
    [Documentation]     Caso de teste valida se Menu Obras > Requisições está funcional
    [Tags]    Obras    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Requisições
    Então sistema exibe tela de Obras > Requisições

CT 03.02.02 - Validar filtro Cliente
    [Documentation]     Caso de teste valida o filtro Cliente em Obras > Requisições
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho informações no campo Cliente
    Então sistema exibe resultado do filtro em Obras

CT 03.02.03 - Validar filtro Departamento
    [Documentation]     Caso de teste valida o filtro Departamento em Obras > Requisições
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E valido filtros dentro de Departamento em Obras > Requisições
    Então sistema exibe resultado de Departamento

CT 03.02.04 - Validar filtro Tipo
    [Documentation]     Caso de teste valida o filtro Tipo em Obras > Requisições
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E valido todos os filtros dentro de Tipo em Obras > Requisições
    Então sistema exibe resultado do filtro em Obras

# CT 03.02.05 - Validar filtro Urgente
#     [Documentation]     Caso de teste valida o filtro Urgente em Obras > Requisições
#     [Tags]    Obras    Dashboard    Funcional        
#     Dado que clico no menu Obras > Requisições
#     Quando clico em "Filtros"
#     E seleciono urgente "Sim"
#     Então sistema exibe resultado do filtro Urgente

# CT 03.02.06 - Validar filtro Nível de urgência
#     [Documentation]     Caso de teste valida o filtro Nível de urgência em Obras > Requisições
#     [Tags]    Obras    Dashboard    Funcional        
#     Dado que clico no menu Obras > Requisições
#     Quando clico em "Filtros"
#     E seleciono urgente "Sim"
#     E valido todos os filtros de Nivel de urgencia em Obras > Requisições
#     Então sistema exibe resultado do filtro em Obras

CT 03.02.07 - Validar filtro Data de entrega
    [Documentation]     Caso de teste valida o filtro Data de entrega em Obras > Requisições
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho informações de Data de entrega em Obras > Requisições
    Então sistema exibe resultado do filtro em Obras

CT 03.02.08 - Validar filtro Data de criação
    [Documentation]     Caso de teste valida o filtro Data de criação em Obras > Requisições
    [Tags]    Obras    Dashboard    Funcional        
    Dado que clico no menu Obras > Requisições
    Quando clico em "Filtros"
    E preencho informações de Data de criação em Obras > Requisições
    Então sistema exibe resultado do filtro em Obras

# CT 03.02.09 - Validar filtro Responsável
#     [Documentation]     Caso de teste valida o filtro Responsável em Obras > Requisições
#     [Tags]    Obras    Dashboard    Funcional        
#     Dado que clico no menu Obras > Requisições
#     Quando clico em "Filtros"
#     E valido todos os filtros dentro de "Responsável" em Obras > Requisições
#     Então sistema exibe resultado do filtro em Obras


# Inserir 
# Editar
# Excluir
# Comentários
# Visualizar

