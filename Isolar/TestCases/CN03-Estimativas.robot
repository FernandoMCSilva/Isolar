*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que Gerencie Estimativas cadastradas no sistema.

*** Test Cases ***
CT 03.01 - Validar menu Estimativas
    [Documentation]     Caso de teste valida se Menu Estimativas está funcional
    [Tags]    Requisições    Funcional        
    Dado que clico no menu "Estimativas"

CT 03.02 - Validar filtro Vendedor
    [Documentation]     Caso de teste valida o filtro Vendedor em Estimativas
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Filtros"
    E preencho informações no campo Vendendor
    E clico em "Buscar"
    Então sistema exibe estimativas de filtro Vendedor

CT 03.03 - Validar filtro Cliente
    [Documentation]     Caso de teste valida o filtro Cliente em Estimativas
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Filtros"
    E preencho informações no campo Cliente
    E clico em "Buscar"
    Então sistema exibe informações do filtro Cliente

CT 03.04 - Validar filtro Tipo de usina
    [Documentation]    Caso de teste valida o filtro Tipo de usina "Todos"
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico em "Filtros"
    E seleciono Tipo de usina "Todos"
    E clico em "Buscar"
    Então sistema exibe informações de estimativas do filtro Tipo de usina

CT 03.05 - Validar filtro Tipo de usina
    [Documentation]    Caso de teste valida o filtro Tipo de usina "Autoconsumo"
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico em "Filtros"
    E seleciono Tipo de usina "Autoconsumo"
    E clico em "Buscar"
    Então sistema exibe informações de estimativas do filtro Tipo de usina

CT 03.06 - Validar filtro Tipo de usina
    [Documentation]    Caso de teste valida o filtro Tipo de usina "Aluguel"
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico em "Filtros"
    E seleciono Tipo de usina "Aluguel"
    E clico em "Buscar"
    Então sistema exibe informações de estimativas do filtro Tipo de usina

CT 03.07 - Validar filtro Data de registro
    [Documentation]     Caso de teste valida o filtro Data de registro
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Filtros"
    E preencho com informações data de registro
    E clico em "Buscar"
    Então sistema exibe estimativas do filtro Data de registro

CT 03.08 - Validar filtro Quantidade de itens por pág
    [Documentation]     Caso de teste valida o filtro Quantidade de itens por pág
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Quantidade de itens por pág"
    E preencho informações no campo quantidade
    Então sistema exibe informações de acordo com quantidade preenchida

CT 03.09 - Validar botão Próximo
    [Documentation]     Caso de teste valida o botão próximo
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Próximo"
    Então sistema exibe próximas estimativas

CT 03.10 - Validar botão Anterior
    [Documentation]     Caso de teste valida o botão Anterior
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Próximo"
    E clico em "Anterior"
    Então sistema exibe estimativas anteriores

CT 03.11 - Validar botão Gerar link de assinatura inativo
    [Documentation]     Caso de teste valida botão Gerar link de assinatura inativo
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Gerar link de assinatura"
    Então sistema não executa nenhuma ação
   
CT 03.12 - Validar botão Não em Gerar link de assinatura
    [Documentation]     Caso de teste valida botão Gerar link de assinatura
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Gerar link de assinatura"
    E clico em "Não"
    Então sistema volta para menu estimativas

CT 03.13 - Validar botão Gerar link de assinatura
    [Documentation]     Caso de teste valida botão Gerar link de assinatura    
    [Tags]    Início    Funcional        
    Dado que clico no menu "Estimativas"
    Quando clico em "Gerar link de assinatura"
    E clico em "Sim"
    Então sistema exibe informações para criar assinaturas


CT 03.14 Validar botão Ver PDF
    [Documentation]    Caso de teste valida botão Ver PDF
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico no botão "Ver PDF"
    Então sistema exibe informações em aquivo PDF

CT 03.15 Validar botão Fechar PDF 
    [Documentation]    Caso de teste valida botão Fechar PDF
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico no botão "Ver PDF"
    E clico em "Fechar PDF"
    Então sistema retorna e exibe informações do menu Estimativas

CT 03.16 Teste botão Imprimir Estimativa em Ver PDF
    [Documentation]    Caso de teste testa botão Imprimir Estimativa em "Ver PDF"
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico no botão "Ver PDF"
    E clico em "imprimir Estimativa"
    Então sistema exibe informações de estimativa em arquivo PDF

CT 03.17 Validar botão Cancelar em Aplicar desconto
    [Documentation]    Caso de teste valida botão Cancelar em Aplicar desconto
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico no botão "Aplicar desconto"
    E clico em "Cancelar"
    Então sistema retorna e exibe informações do menu Estimativas

CT 03.18 Validar botão Aplicar desconto 
    [Documentation]    Caso de teste valida botão Aplicar desconto
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico no botão "Aplicar desconto"
    E preencho informações de desconto
    E clico em "Confirmar"
    Então sistema aplica desconto e exibe informações em arquivo PDF

CT 03.19 Teste aplicar desconto acima do valor permitido
    [Documentation]    Caso de teste testa aplicar desconto acima do valor permitido
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico no botão "Aplicar desconto"
    E preencho informações de desconto acima do limite
    E clico em "Confirmar"
    Então sistema exibe mensagem de erro de desconto máximo permitido


# BOTÃO GERAR (ESTIMATIVA)

CT 03.20 Validar botão Gerar 
    [Documentation]    Caso de teste valida botão gerar em estimativas
    [Tags]    Início    Funcional
    Dado que clico no menu "Estimativas"
    Quando clico no botão "Gerar"
    Então sistema exibe informações do botão Gerar
    