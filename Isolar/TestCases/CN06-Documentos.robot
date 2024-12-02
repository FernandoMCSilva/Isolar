*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que gerencie as Estimativas cadastradas no sistema.

*** Test Cases ***

CT 06.01.01 - Validar menu Documentos
    [Documentation]     Caso de teste valida se Menu Documentos está funcional
    [Tags]    Documentos    Documentos gerados    Funcional
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Então sistema exibe informações de documentos gerados

CT 06.01.02 - Validar filtro Criador
    [Documentation]     Caso de teste valida se filtro criador está funcional
    [Tags]    Documentos    Documentos gerados    Funcional
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E preencho informações de filtro criador
    Então sistema exibe informações de filtro criador

CT 06.01.03 - Validar filtro Tipo de documento
    [Documentation]     Caso de teste valida se filtro Tipo de documento está funcional
    [Tags]    Documentos    Documentos gerados    Funcional
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E seleciono opção de filtro Tipo de documento
    Então sistema exibe informações de filtro Tipo de documento

CT 06.01.04 - Validar filtro Departamento
    [Documentation]     Caso de teste valida se filtro Departamento está funcional
    [Tags]    Documentos    Documentos gerados    Funcional
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E seleciono opção de filtro Departamento
    Então sistema exibe informações de filtro Departamento

CT 06.01.05 - Validar filtro Data de registro
    [Documentation]     Caso de teste valida se filtro Data de registro está funcional
    [Tags]    Documentos    Documentos gerados    Funcional
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E seleciono opção de filtro Data de registro
    Então sistema exibe informações de filtro Data de registro

CT 06.01.06 - Validar botão Ver Documento
    [Documentation]     Caso de teste valida se botão Ver Documento está funcional
    [Tags]    Documentos    Documentos gerados    Funcional
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    E clico no botão Ver Documento
    Então sistema exibe informações de botão Ver Documento

# CT 06.01.07 - Validar botão Gerar link de assinatura
#     [Documentation]     Caso de teste valida se botão Gerar link de assinatura está funcional
#     [Tags]    Documentos    Documentos gerados    Funcional
#     Dado que clico no menu "Documentos"
#     Clico no menu "Documentos geradados"
#     E clico no botão Gerar link de assinatura
#     Então sistema exibe informações de botão Gerar link de assinatura

CT 06.01.08 - Validar botão Status da assinatura
    [Documentation]     Caso de teste valida se botão Status da assinatura está funcional
    [Tags]    Documentos    Documentos gerados    Funcional
    Dado que clico no menu "Documentos"
    Clico no menu "Documentos geradados"
    Quando clico em "Filtros"
    E preencho informações do filtro criador
    E clico no botão Status da assinatura
    Então sistema exibe informações de botão Status da assinatura



# Teste Filtros
# Botão Ver Documento
# Botão Status de Assinatura 
# ...
# Botão Gerar link de assinatura
# Botão Rubrica
# Botão Próximo
# Botão Anterior
# Botão Ver Documento (ERROR: Documento não encontrado)
# Botão Status da assinatura  (ERROR: Sem assinatura)
# Botão Gerar link de assinatura (ERROR: Link já foi gerado.)
