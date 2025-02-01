*** Settings ***
Resource           ../Resources/Main.robot
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo que gerencie as Estimativas cadastradas no sistema.

*** Test Cases ***
CT 04.01 - Validar menu Estimativa
    [Documentation]     Caso de teste valida se Menu Estimativa está funcional
    [Tags]    Estimativa    Funcional        
    Dado que clico no menu "Estimativa"
    Então sistema exibe informações de estimativas
    
CT 04.02 - Validar filtro Vendedor
    [Documentation]     Caso de teste valida o filtro Vendedor em Estimativa
    [Tags]    Estimativa    Funcional        
    Dado que clico no menu "Estimativa"
    Quando clico em "Filtros"
    E preencho informações no campo Vendedor
    E clico em "Buscar"
    Então sistema exibe estimativas de filtro Vendedor

CT 04.03 - Validar filtro Cliente
    [Documentation]     Caso de teste valida o filtro Cliente em Estimativa
    [Tags]    Estimativa    Funcional        
    Dado que clico no menu "Estimativa"
    Quando clico em "Filtros"
    E preencho informações no campo Cliente
    E clico em "Buscar"
    Então sistema exibe estimativas do filtro Cliente

CT 04.04 - Validar filtro Tipo de usina "Todos"
    [Documentation]    Caso de teste valida o filtro Tipo de usina "Todos"
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico em "Filtros"
    E seleciono Tipo de usina "Todos"
    E clico em "Buscar"
    Então sistema exibe informações de Estimativa do filtro Tipo de usina "Todos"

CT 04.05 - Validar filtro Tipo de usina "Autoconsumo"
    [Documentation]    Caso de teste valida o filtro Tipo de usina "Autoconsumo"
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico em "Filtros"
    # E seleciono Tipo de usina "Autoconsumo"
    # E clico em "Buscar"
    # Então sistema exibe informações de Estimativa do filtro Tipo de usina "Autoconsumo"

CT 04.06 - Validar filtro Tipo de usina "Aluguel"
    [Documentation]    Caso de teste valida o filtro Tipo de usina "Aluguel"
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico em "Filtros"
    # E seleciono Tipo de usina "Aluguel"
    # E clico em "Buscar"
    # Então sistema exibe informações de Estimativa do filtro Tipo de usina "Aluguel"

CT 04.07 - Validar filtro Data de registro
    [Documentation]     Caso de teste valida o filtro Data de registro
    [Tags]    Estimativa    Funcional        
    Dado que clico no menu "Estimativa"
    Quando clico em "Filtros"
    E preencho com informações data de registro
    Então sistema exibe Estimativa do filtro Data de registro

CT 04.08 - Validar filtro Quantidade de itens por pág
    [Documentation]     Caso de teste valida o filtro Quantidade de itens por pág
    [Tags]    Estimativa    Funcional        
    Dado que clico no menu "Estimativa"
    Quando clico em "Quantidade de itens por pág"
    E preencho informações no campo quantidade
    Então sistema exibe informações de acordo com quantidade preenchida

 CT 04.09 - Validar botão Próximo
    [Documentation]     Caso de teste valida o botão próximo
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico em "Próximo"
    Então sistema exibe próximas Estimativa

CT 04.10 - Validar botão Anterior
    [Documentation]     Caso de teste valida o botão Anterior
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico em "Próximo"
    E clico em "Anterior"
    Então sistema exibe Estimativa anteriores   
CT 04.12 - Validar botão Não em Gerar link de assinatura
    [Documentation]     Caso de teste valida botão Não em confirmação do Gerar link de assinatura
    [Tags]    Estimativa    Funcional  
    Dado que clico no menu "Estimativa"
    Quando clico em "Gerar link de assinatura"
    E clico em "Não"
    Então sistema volta para menu Estimativa

CT 04.13 - Validar botão Gerar link de assinatura
    [Documentation]     Caso de teste valida botão Gerar link de assinatura    
    [Tags]    Estimativa    Funcional    SmokeTest
    Dado que clico no menu "Estimativa"
    Quando clico em "Gerar link de assinatura"
    E clico em "Sim"
    Então sistema exibe informações para criar assinaturas

CT 04.14 - Validar botão Ver PDF
    [Documentation]    Caso de teste valida botão Ver PDF
    [Tags]    Estimativa    Funcional    SmokeTest
    Dado que clico no menu "Estimativa"
    Quando clico em "Filtros"
    E preencho informações no campo Cliente
    E clico em "Buscar"
    Quando clico no botão "Ver PDF"
    Então sistema exibe informações em aquivo PDF

CT 04.15 - Validar impressão de estimativa
    [Documentation]    Caso de teste testa botão Imprimir Estimativa em "Ver PDF"
    [Tags]    Estimativa    Funcional    SmokeTest
    Dado que clico no menu "Estimativa"
    Quando clico em "Filtros"
    E preencho informações no campo Cliente
    E clico em "Buscar"
    Quando clico no botão "Ver PDF"
    E clico em "imprimir Estimativa"
    Então sistema exibe informações de estimativa em arquivo PDF

CT 04.16 - Validar botão Cancelar em Aplicar desconto
    [Documentation]    Caso de teste valida botão Cancelar em Aplicar desconto
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Aplicar desconto"
    E clico em "Cancelar"
    Então sistema retorna e exibe informações do menu Estimativa

CT 04.17 - Validar botão aplicar desconto
    [Documentation]    Caso de teste valida botão Aplicar desconto
    [Tags]    Estimativa    Funcional    SmokeTest
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Aplicar desconto"
    E preencho informações de desconto
    Então sistema aplica desconto e exibe informações em arquivo PDF

CT 04.18 - Validar botão aplicar desconto com valor acima do limite
    [Documentation]    Caso de teste testa aplicar desconto acima do valor permitido
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Aplicar desconto"
    E preencho informações de desconto acima do limite
    Então sistema exibe mensagem de erro de desconto máximo permitido
CT 04.19 - Validar botão e funcionalidade "Gerar"
    [Documentation]    Caso de teste valida botao gerar em estimativa
    [Tags]    Estimativa    Funcional    SmokeTest
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E seleciono Local de instalação "Solo"
    E seleciono Autoconsumo ou Aluguel "Autoconsumo"
    E seleciono GD1 ou GD2 "GD1"
    E seleciono Local de geração "Junto a carga"
    E seleciono Estimativa pôr "Gasto mensal em R$" 
    E seleciono valor da classificação "Trifásico"
    E preencho valor de Gasto mensal
    E seleciono valor de tensão FF "220v"
    E seleciono valor de tensão FN "220v"
    E clico em Gerar cálculos
    Então sistema exibe resultado dos cálculos

CT 04.20 - Validar botão Constantes personalizadas
    [Documentation]    Caso de teste valida botão Constantes personalizadas em Gerar nova estimativa
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E clico no botão "Constantes personalizadas"
    Então sistema exibe aba de Constantes personalizadas
    
CT 04.21 - Validar exportação para Excel
    [Documentation]    Caso de teste valida botão Exportar para Excel no menu Estimativas
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico no botão Exportar para Excel
    Então sistema exporta para excel

CT 04.22 - Gerar estimativa sem preencher campos obrigatórios
    [Documentation]    Caso de teste valida gerar sem preencher nenhum dos campos obrigatórios
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E clico em Gerar cálculos
    Então sistema exibe mensagem de campos obrigatórios não preenchido em estimativa

CT 04.23 - Validar botão ações após gerar cálculos
    [Documentation]    Caso de teste valida botão ações após gerar cálculos
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E preencho informações de calculos
    E clico em Gerar cálculos
    E clico no botão Ações
    Então sistema exibe tela de botão ações 

CT 04.24 - Validar impressão de estimativa 
    [Documentation]    Caso de teste valida botão Baixar/Imprimir em Acões após gerar cálculos
    [Tags]    Estimativa    Funcional    SmokeTest
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E preencho informações de calculos
    E clico em Gerar cálculos
    E preencho informações do cliente
    E clico no botão Ações
    E clico no botão Baixar/Imprimir
    Então sistema Baixa/Imprime Estimativa

CT 04.25 - Validar botão Iniciar conversa no Whatsapp
    [Documentation]    Caso de teste valida botão Iniciar conversa no Whatsapp em Acões após gerar cálculos
    [Tags]    Estimativa    Funcional    SmokeTest
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E preencho informações de calculos
    E clico em Gerar cálculos
    E preencho informações do cliente
    E clico no botão Ações
    E clico no botão Iniciar conversa no WhatsApp
    Então sistema redireciona para Whatsapp

CT 04.26 - Validar botão Enviar por email
    [Documentation]    Caso de teste valida botão Enviar por email em Acões após gerar cálculos
    [Tags]    Estimativa    Funcional    SmokeTest
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E preencho informações de calculos
    E clico em Gerar cálculos
    E preencho informações do cliente
    E clico no botão Ações
    E clico no botão Enviar por email
    Então sistema abre informações do email

CT 04.27 - Validar botão Salvar informarções no sistema
    [Documentation]    Caso de teste valida botão Salvar informarções no sistema em Acões após gerar cálculos
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E preencho informações de calculos
    E clico em Gerar cálculos
    E preencho informações do cliente
    E clico no botão Ações
    E clico no botão Salvar informarções no sistema
    Então sistema salva informações no sistema

CT 04.28 - Validar botão Baixar/Imprimir (Inatívo)
    [Documentation]    Caso de teste valida botão Baixar/Imprimir (Inatívo) após gerar cálculos
    [Tags]    Estimativa    Funcional
    Dado que clico no menu "Estimativa"
    Quando clico no botão "Gerar"
    E preencho informações de calculos
    E clico em Gerar cálculos
    E clico no botão Ações
    E clico no botão Baixar/Imprimir desabilitado
    Então sistema sai da tela do botão Ações

# CT 04.30 - Validar funcionalidade Constantes personalizadas
#     [Documentation]    Caso de teste valida funcionalidade Constantes personalizadas
#     [Tags]    Estimativa    Funcional
#     Dado que clico no menu "Estimativa"
#     Quando clico no botão "Gerar"
#     E preencho informações de calculos
#     E clico no botão "Constantes personalizadas"
#     E preencho informações de constantes personalizadas
#     E clico em Gerar cálculos
#     # Então sistema calcula estimativa com constantes personalizadas

