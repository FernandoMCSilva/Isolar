*** Settings ***
Resource           ../Resources/SuiteSetup.robot
Resource           ../Resources/Main.robot
# Suite Setup        Setup Chrome Driver
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que gerencie as Estimativas cadastradas no sistema.

*** Test Cases ***
CT 07.01.01 - Validar menu Documentos
    [Documentation]     Caso de teste valida se Menu Documentos está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Então sistema exibe informações de documentos gerados

CT 07.01.02 - Validar filtro Criador
    [Documentation]     Caso de teste valida se filtro criador está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E preencho informações de filtro criador
    Então sistema exibe informações de filtro criador

CT 07.01.03 - Validar filtro Tipo de documento
    [Documentation]     Caso de teste valida se filtro Tipo de documento está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E seleciono opção de filtro Tipo de documento
    Então sistema exibe informações de filtro Tipo de documento

CT 07.01.04 - Validar filtro Departamento
    [Documentation]     Caso de teste valida se filtro Departamento está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E seleciono opção de filtro Departamento
    Então sistema exibe informações de filtro Departamento

CT 07.01.05 - Validar filtro Data de registro
    [Documentation]     Caso de teste valida se filtro Data de registro está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E seleciono opção de filtro Data de registro
    Então sistema exibe informações de filtro Data de registro

CT 07.01.06 - Validar botão Ver Documento
    [Documentation]     Caso de teste valida se botão Ver Documento está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    E clico no botão Ver Documento
    Então sistema exibe informações de botão Ver Documento

CT 07.01.07 - Validar botão Gerar link de assinatura
    [Documentation]     Caso de teste valida se botão Gerar link de assinatura está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Aguardo carregamento da página
    Quando clico em "Filtros"
    E preencho filtro criador em Documentos
    E clico no botão Gerar link de assinatura
    E clico em Assinatura Tradicional
    Então sistema exibe informações de botão Gerar link de assinatura

# BUG
# CT 07.01.08 - Validar botão Status da assinatura
#     [Documentation]     Caso de teste valida se botão Status da assinatura está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Documentos geradados"
#     Quando clico em "Filtros"
#     E preencho filtro criador em Documentos
#     E clico no botão Status da assinatura
#     Então sistema exibe informações de botão Status da assinatura

# CT 07.01.09 - Validar botão Rubrica
#     [Documentation]     Caso de teste valida se botão Rubrica está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Documentos geradados"
#     Quando clico em "Filtros"
#     E preencho filtro criador em Documentos
#     E clico no botão Rubrica
#     Então sistema exibe informações de botão Rubrica

CT 07.01.10 - Validar botão Próximo
    [Documentation]     Caso de teste valida se botão Próximo está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico no botão Próximo
    Então sistema exibe próximas informações

CT 07.01.11 - Validar botão Anterior
    [Documentation]     Caso de teste valida se botão Anterior está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico no botão Próximo
    E clico em "Anterior"
    Então sistema exibe informações anteriores 

#  SEM DOCUMENTO COM BOTÃO INATIVO NO SISTEMA
# CT 07.01.12 - Validar botão Ver Documento
#     [Documentation]     Caso de teste valida se botão Ver Documento (INATÍVO) está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Documentos geradados"
#     E clico no botão Ver Documento (INATÍVO)
#     Então sistema exibe informações de botão Ver Documento (INATÍVO)

# CT 07.01.13 - Validar botão Status da assinatura
#     [Documentation]     Caso de teste valida se botão Status da assinatura (INATÍVO) está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Documentos geradados"
#     Quando clico em "Filtros"
#     E preencho filtro criador em Documentos
#     E clico no botão Status da assinatura (INATÍVO)
#     Então sistema exibe informações de botão Status da assinatura (INATÍVO)

# CT 07.01.14 - Validar botão Gerar link de assinatura
#     [Documentation]     Caso de teste valida se botão Gerar link de assinatura (INATÍVO) está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Documentos geradados"
#     Quando clico em "Filtros"
#     E preencho filtro criador em Documentos
#     E clico no botão Gerar link de assinatura (INATÍVO)
    # Então sistema exibe informações de botão Gerar link de assinatura (INATÍVO)

CT 07.01.15 - Validar exclusão de documento
    [Documentation]     Caso de teste valida se funcionlidade excluir está funcional
    [Tags]    Documentos
#   Gerar documento
    Dado que clico no menu "Documentos"
    Clico no menu "Criar documento"
    E clico em "Jurídico"
    E preencho informação de criar documento Jurídico
    Então sistema exibe mensagem de documento criado

#   Excluir documento gerado
    E clico em Cancelar
    E volto pra tela inicio
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E preencho informações de filtro criador
    E clico no botão Deletar

CT 07.02.01 - Validar menu Assinaturas
    [Documentation]     Caso de teste valida se menu Assinaturas está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Assinaturas"
    Então sistema exibe informações de menu Assinaturas

# # BUG #1351
# CT 07.02.02 - Validar filtro Origem da assinatura
#     [Documentation]     Caso de teste valida se filtro Origem da assinatura está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico em "Filtros"
#     E preencho informações de filtro Origem da assinatura
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Origem da assinatura

# BUG #1351
# CT 07.02.03 - Validar filtro Status
#     [Documentation]     Caso de teste valida se filtro Status está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico em "Filtros"
#     E preencho informações de filtro Status
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Status

# BUG #1351
# CT 07.02.04 - Validar filtro Assinante
#     [Documentation]     Caso de teste valida se filtro Assinante está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico em "Filtros"
#     E preencho informações de filtro Assinante
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Assinante

CT 07.02.05 - Validar filtro Observador
    [Documentation]     Caso de teste valida se filtro Observador está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Assinaturas"
    E aguardo menu Documentos > Assinaturas
    Quando clico em "Filtros"
    E preencho informações de filtro Observador
    E clico em "Buscar"
    Então sistema exibe informações de filtro Observador

# CT 07.02.06 - Validar filtro Quantidade de itens por pág
#     [Documentation]     Caso de teste valida se filtro Quantidade de itens por pág está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando seleciono opção Cards ou Lista "Lista"
#     Quando clico em "Quantidade de itens por pág"
#     E preencho informações no campo quantidade
#     Então sistema exibe informações de acordo com quantidade preenchida

# CT 07.02.07 - Validar filtro Cards ou Lista
#     [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando seleciono opção Cards ou Lista "Lista"
#     Então sistema exibe informações com filtro "Lista"

# BUG
# CT 07.02.08 - Validar botão Próximo
#     [Documentation]     Caso de teste valida se botão Próximo está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico em "Próximo"
#     Então sistema exibe próximas Assinaturas

# CT 07.02.09 - Validar botão Anterior
#     [Documentation]     Caso de teste valida se botão Anterior está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico em "Próximo"
#     E clico em "Anterior"
#     Então sistema exibe Assinaturas anteriores

# CT 07.02.10 - Validar funcionalidade Criar
#     [Documentation]     Caso de teste valida se funcionalidade Criar está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico no botão Criar
#     E faço upload de arquivo teste
#     Então sistema exibe tela final de rubrica

# BUG
# CT 07.02.11 - Validar filtro Buscar
#     [Documentation]     Caso de teste valida se filtro Buscar está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     E preencho informação de filtro Buscar
#     E clico em "Buscar"
#     Então sistema exibe informações de filtro Buscar

# CT 07.02.12 - Validar botão Editar
#     [Documentation]     Caso de teste valida se botão Editar está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico em "Filtros"
#     E preencho informações de filtro Assinante
#     E clico em "Buscar"
#     Quando clico em "Editar"
#     Então sistema exibe tela de edição

# CT 07.02.13 - Validar botão Documento original em Editar
#     [Documentation]     Caso de teste valida se botão Documento original em Editar está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico em "Filtros"
#     E preencho informações de filtro Assinante
#     E clico em "Buscar"
#     Quando clico em "Editar"
#     E clico em Documento original
#     Então sistema exibe tela de Documento original

# CT 07.02.14 - Validar botão Editar campos em Editar
#     [Documentation]     Caso de teste valida se botão Editar campos em Editar está funcional
#     [Tags]    Documentos
#     Dado que clico no menu "Documentos"
#     Clico no menu "Assinaturas"
#     Quando clico em "Filtros"
#     E preencho informações de filtro Assinante
#     E clico em "Buscar"
#     Quando clico em "Editar"
#     E clico em Documento original
#     E clico em Editar campos
#     Então sistema exibe tela de Editar campos

CT 07.03.01 - Validar menu Criar documento > Jurídico
    [Documentation]     Caso de teste valida se menu Criar documento > Jurídico está funcional
    [Tags]    Documentos
    Dado que clico no menu "Documentos"
    Clico no menu "Criar documento"
    E clico em "Jurídico"
    E preencho informação de criar documento Jurídico
    Então sistema exibe mensagem de documento criado
