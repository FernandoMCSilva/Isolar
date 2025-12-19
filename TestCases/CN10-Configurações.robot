*** Settings ***
# Resource           ../Resources/SuiteSetup.robot
Resource           ../Resources/Main.robot
# Suite Setup        Setup Chrome Driver
Test Setup         Dado que acesse a Isolar e logue no sistema
Test Teardown      Fechar navegador
Documentation      Modúlo gerencia Configurações no sistema.

*** Test Cases ***
# CT 10.01.01 - Validar menu Configurações > Requisições
#     [Documentation]     Caso de teste valida se Menu Configurações > Requisições está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     Então sistema exibe informações de menu Requisições   
    
# CT 10.01.02 - Validar botão Inserir Novo tipo 
#     [Documentation]     Caso de teste valida se funcionalidade Inserir no menu Configurações > Requisições está funcional
#     [Tags]    Configurações        
# #   Inserir
#     Dado que clico no menu "Configurações > Requisições"
#     Quando clico no botão "Novo tipo"
#     E preencho informações de cadastro de Novo tipo de Requisições
#     E clico em "Salvar"
#     Então sistema salva novo Tipo de requisição

# #   Excluir
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Quando clico em "Excluir" em configurações
#     E clico no botão "Continuar" em "Excluir"
#     Então sistema exclui item do menu Configurações > Requisições

# CT 10.01.03 - Validar botão Editar
#     [Documentation]     Caso de teste valida se funcionalidade Editar no menu Configurações > Requisições está funcional
#     [Tags]    Configurações       
# #   Inserir
#     Dado que clico no menu "Configurações > Requisições"
#     Quando clico no botão "Novo tipo"
#     E preencho informações de cadastro de Novo tipo de Requisições
#     E clico em "Salvar"
#     Então sistema salva novo Tipo de requisição

# #   Editar
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Quando clico em "Editar" em configuracoes
#     E preencho informações de cadastro editado no menu Configurações > Requisições
#     Então sistema exibe informações de "Editar" no menu Configurações > Requisições

# #   Excluir
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Quando clico em "Excluir" em configurações
#     E clico no botão "Continuar" em "Excluir"
#     Então sistema exclui item do menu Configurações > Requisições

# # CT 10.01.04 - Validar filtro Status "Ligado ou Desligado" 
# #     [Documentation]     Caso de teste valida se filtro status "Ligado ou Desligado" está funcional
# #     [Tags]    Configurações       
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao buscar
# #     E preencho informações de pesquisa em Configurações
# #     Quando clico no filtro status
# #     Então sistema exibe mensagem de status atualizado

# CT 10.01.05 - Validar filtro "buscar" 
#     [Documentation]     Caso de teste valida se filtro buscar no menu Configurações > Requisições está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E preencho informações de pesquisa em Configurações
#     Então sistema exibe informações de pesquisa de tipo de requisição

# CT 10.01.06 - Validar botão Cancelar em "Excluir" 
#     [Documentation]     Caso de teste valida se botão Cancelar em Excluir está funcional no menu Configurações > Requisições
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E preencho informações de pesquisa em Configurações
#     Quando clico em "Excluir" em configurações
#     E clico no botão "Cancelar" em "Excluir"
#     Então sistema exibe informações de menu Requisições

# CT 10.01.07 - Validar botão Continuar em "Excluir" 
#     [Documentation]     Caso de teste valida se botão Continuar em Excluir está funcional no menu Configurações > Requisições
#     [Tags]    Configurações        
# #   Inserir
#     Dado que clico no menu "Configurações > Requisições"
#     Quando clico no botão "Novo tipo"
#     E preencho informações de cadastro de Novo tipo de Requisições
#     E clico em "Salvar"
#     Então sistema salva novo Tipo de requisição

# #   Excluir
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Quando clico em "Excluir" em configurações
#     E clico no botão "Continuar" em "Excluir"
#     Então sistema exclui item do menu Configurações > Requisições

# CT 10.01.08 - Validar botão "Perguntas" 
#     [Documentation]     Caso de teste valida se botão Perguntas no menu Configurações > Requisições está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao "Perguntas"
#     Então sistema exibe informações da pagina perguntas

# # CT 10.01.09 - Validar botão Inserir perguntas 
# #     [Documentation]     Caso de teste valida funcionalidade "Inserir" nova pergunta em perguntas no menu Configurações > Requisições
# #     [Tags]    Configurações        
# # #   Inserir pergunta
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao "Perguntas"
# #     E preencho informações de nova pergunta
# #     E clico em "Salvar"
# #     Então sistema exibe mensagem de pergunta adicionada no menu Configurações > Requisições

# # #   Excluir pergunta
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao "Perguntas"
# #     E clico no botao buscar
# #     E preencho informações de pesquisa
# #     Quando clico em "Excluir" em configurações
# #     Então sistema exclui pergunta do menu Configurações > Requisições > Perguntas

# # CT 10.01.10 - Validar botão Editar perguntas
# #     [Documentation]     Caso de teste valida se funcionalidade "Editar" em Perguntas no menu Configurações > Requisições está funcional
# #     [Tags]    Configurações        
# # #   Inserir pergunta 
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao "Perguntas"
# #     E preencho informações de nova pergunta
# #     E clico em "Salvar"
# #     Então sistema exibe mensagem de pergunta adicionada no menu Configurações > Requisições

# # #   Editar Pergunta
# #     Aguardo carregamento da página
# #     E clico no botao buscar
# #     E preencho informações de pesquisa em Configurações
# #     Rolar para o fim da página
# #     Quando clico em "Editar" em configurações
# #     E preencho informações de pergunta editada no menu Configurações > Requisições > Perguntas
# #     Então sistema exibe informações de "Editar" no menu Configurações > Requisições > Perguntas

# # #   Excluir pergunta
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao "Perguntas"
# #     E clico no botao buscar
# #     E preencho informações de pesquisa em Configurações
# #     Quando clico em "Excluir" em configurações
# #     Então sistema exclui pergunta do menu Configurações > Requisições > Perguntas

# CT 10.01.11 - Validar filtro "buscar" perguntas
#     [Documentation]     Caso de teste valida se filtro "buscar" em perguntas no menu Configurações > Requisições está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao "Perguntas"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Então sistema exibe informações de pesquisa de perguntas

# # CT 10.01.12 - Validar botão "Excluir" perguntas
# #     [Documentation]     Caso de teste valida se botão Excluir em perguntas está funcional no menu Configurações > Requisições
# #     [Tags]    Configurações        
# # #   Inserir pergunta
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao "Perguntas"
# #     E preencho informações de nova pergunta
# #     E clico em "Salvar"
# #     Então sistema exibe mensagem de pergunta adicionada no menu Configurações > Requisições

# # #   Excluir pergunta
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao "Perguntas"
# #     E clico no botao buscar
# #     E preencho informações de pesquisa
# #     Quando clico em "Excluir" em configurações
# #     Então sistema exclui pergunta do menu Configurações > Requisições > Perguntas

# # CT 10.01.13 - Validar filtro "Cards ou Lista" em Perguntas 
# #     [Documentation]     Caso de teste valida se filtro Cards ou Lista em Perguntas no menu Configurações > Requisições está funcional
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao "Perguntas"
# #     Quando clico no filtro "Cards" em perguntas
# #     E clico em "Lista" em perguntas
# #     Então sistema exibe informações com filtro "Lista"

# CT 10.01.14 - Validar busca não encontrada no filtro buscar em perguntas 
#     [Documentation]     Caso de teste valida busca não encontrada em perguntas no menu Configurações > Requisições
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao "Perguntas"
#     E clico no botao buscar
#     E preencho informações de busca não encontrada
#     Então sistema exibe mensagem de erro em Perguntas

# # CT 10.01.15 - Validar filtro Quantidade de itens por pág em perguntas 
# #     [Documentation]     Caso de teste valida o filtro Quantidade de itens por pág em perguntas no menu Configurações > Requisições
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Requisições"
# #     E clico no botao "Perguntas"
# #     Quando clico no filtro "Cards" em perguntas
# #     E clico em "Lista" em perguntas
# #     Quando clico em "Quantidade de itens por pág"
# #     E preencho informações no campo quantidade em perguntas
# #     Então sistema exibe informações de acordo com quantidade preenchida em perguntas

# CT 10.01.16 - Validar botão Fechar no filtro "buscar" em Perguntas 
#     [Documentation]     Caso de teste valida se botão Fechar no filtro buscar em Perguntas no menu Configurações > Requisições está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E clico em "Fechar"
#     Então sistema verifica se filtro buscar fechou

# CT 10.01.17 - Validar filtro "Cards ou Lista" 
#     [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional no menu Configurações > Requisições
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     Quando clico no filtro "Cards"
#     E clico em "Lista"
#     Então sistema exibe informações com filtro "Lista" em Configurações > Requisições

# CT 10.01.18 - Validar busca não encontrada no filtro buscar 
#     [Documentation]     Caso de teste valida busca não encontrada no filtro buscar em Configurações > Requisições
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E preencho informações de busca não encontrada
#     Então sistema exibe mensagem de erro em Configurações > Requisições

# CT 10.01.19 - Validar botão Fechar no filtro "buscar" 
#     [Documentation]     Caso de teste valida se botão Fechar no filtro buscar está funcional no menu Configurações > Requisições
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Requisições"
#     E clico no botao buscar
#     E clico em "Fechar"
#     Então sistema verifica se filtro buscar fechou

# CT 10.02.01 - Validar menu Configurações > Documentos
#     [Documentation]     Caso de teste valida se Menu Configurações > Documentos está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Documentos"
#     Então sistema exibe informações de menu Documentos

# CT 10.02.02 - Validar filtro Tipo de documento
#     [Documentation]     Caso de teste valida se filtro "Tipo de documento" no menu Configurações > Documentos está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Documentos"
#     Quando clico em "Filtros"
#     E seleciono filtro "Tipo de documento"
#     Então sistema exibe informações de filtro selecionado

# CT 10.02.03 - Validar filtro Departamento
#     [Documentation]     Caso de teste valida se filtro "Departamento" no menu Configurações > Documentos está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Documentos"
#     Quando clico em "Filtros"
#     E seleciono filtro "Departamento"
#     Então sistema exibe informações de filtro selecionado

CT 10.02.04 - Validar botão Ver template
    [Documentation]     Caso de teste valida se botão Ver template está funcional em Configurações > Documentos
    [Tags]    Configurações        
    Dado que clico no menu "Configurações > Documentos"
    E aguardo 20 segundos para carregamento de assinaturas
    E clico no botão Ver template
    Então sistema exibe informações de template selecionado

CT 10.02.05 - Validar botão Ver histórico 
    [Documentation]     Caso de teste valida se botão Ver histórico está funcional em Configurações > Documentos
    [Tags]    Configurações        
    Dado que clico no menu "Configurações > Documentos"
    E aguardo 20 segundos para carregamento de assinaturas
    E clico no botão Ver histórico
    Então sistema exibe histórico de template selecionado

# # CT 10.02.06 - Validar botão Atualizar template 
# #     [Documentation]     Caso de teste valida se botão Atualizar template está funcional em Configurações > Documentos
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Documentos"
# #     E clico no botão Atualizar template
# #     E faço upload de arquivo teste de template
# #     Então sistema atualiza template selecionado
# # # Upload / Anexo

# # CT 10.02.07 - Validar botão Editar template e campos 
# #     [Documentation]     Caso de teste valida se botão Editar template e campos está funcional em Configurações > Documentos
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Documentos"
# #     E clico no botão Editar template e campos
# #     Então sistema exibe confirmação de edição
# # # Não temos permição para editar

# # CT 10.02.08 - Validar botão Criar 
# #     [Documentation]     Caso de teste valida se botão Criar está funcional em Configurações > Documentos
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Documentos"
# #     Quando clico no botão Criar em Configurações > Documentos
# #     E clico em Anexar Template
# #     E faço upload de arquivo teste em Configurações > Documentos
# #     Então sistema cria novo template de documentos
# # # Upload / anexo

# CT 10.04.01 - Validar menu Configurações > Proposta
#     [Documentation]     Caso de teste valida se Menu Configurações > Proposta está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Proposta"
#     Então sistema exibe informações de menu Estimativa

# CT 10.04.02 - Validar campos em Constantes ambientais
#     [Documentation]     Caso de teste valida se campos em Constantes ambientais estão funcionais
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Proposta"
#     Quando clico em Constantes ambientais
#     E altero informações de Constantes ambientais
#     E clico em Atualizar valores das contanstes
#     E restauro informações originais de Constantes ambientais
#     Então sistema exibe atualiza valores das constantes

# CT 10.04.03 - Validar campos em Constantes Impostos
#     [Documentation]     Caso de teste valida se campos em Constantes Impostos estão funcionais
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Proposta"
#     Quando clico em Constantes Impostos
#     E altero informações de Constantes Impostos
#     E clico em Atualizar valores das contanstes
#     E restauro informações originais de Constantes Impostos
#     Então sistema exibe atualiza valores das constantes

# CT 10.04.04 - Validar campos em Constantes técnicas
#     [Documentation]     Caso de teste valida se campos em Constantes técnicas estão funcionais
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Proposta"
#     Quando clico em Constantes técnicas
#     E altero informações de Constantes técnicas
#     E clico em Atualizar valores das contanstes
#     E restauro informações originais de Constantes técnicas
#     Então sistema exibe atualiza valores das constantes

# # CT 10.04.05 - Validar campos de Preço para Investimento > Solo
# #     [Documentation]     Caso de teste valida se campos em Preço para Investimento > Solo estão funcionais
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Proposta"
# #     Quando clico em Preço para Investimento > Solo 
# #     E adiciono novo Registro de Preço para Investimento > Solo
# #     E altero informações de Preço para Investimento > Solo
# #     E clico em Atualizar valores das contanstes
# #     E restauro informações originais de Preço para Investimento > Solo
# #     Então sistema exibe atualiza valores das constantes

# CT 10.05.01 - Validar menu Configurações > Sistema
#     [Documentation]     Caso de teste valida se Menu Configurações > Sistema > Logo está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Logo
#     Então sistema exibe informações de menu Sistema > Logo

# # CT 10.05.02 - Validar edição de Logo
# #     [Documentation]     Caso de teste valida se edição de Logo está funcional
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Sistema"
# #     E clico em Logo
# #     Quando faço upload no campo de Logo
# #     E clico em "Salvar" Logo
# #     Então sistema atualiza logo do sistema

# CT 10.05.03 - Validar edição de Mensagens padrão
#     [Documentation]     Caso de teste valida se edição de Mensagens padrão está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Mensagens padrão
#     Quando faço edição do campo de Mensagens padrão
#     E clico em "Salvar" Mensagens padrão
#     Então sistema atualiza Mensagens padrão do sistema

# CT 10.05.04 - Restaurar Mensagens padrão original
#     [Documentation]     Caso de teste restaura Mensagens padrão original
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Mensagens padrão
#     Quando restauro Mensagens padrão original
#     E clico em "Salvar" Mensagens padrão
#     Então sistema atualiza Mensagens padrão do sistema

# CT 10.05.05 - Validar Menu Histórico das requisições
#     [Documentation]     Caso de teste valida se Histórico das requisições está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Histórico das requisições
#     Então sistema exibe informações de menu Sistema > Histórico das requisições

# CT 10.05.06 - Validar filtro responsável
#     [Documentation]     Caso de teste valida se filtro responsável está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Histórico das requisições
#     Quando clico em "Filtros"
#     E preencho filtro responsável
#     E clico em Buscar
#     Então sistema exibe informações de filtro Responsável em Histórico das requisições

# CT 10.05.07 - Validar filtro Requisição
#     [Documentation]     Caso de teste valida se filtro Requisição está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Histórico das requisições
#     Quando clico em "Filtros"
#     E preencho filtro Requisição
#     E clico em Buscar
#     Então sistema exibe informações de filtro Requisição em Histórico das requisições

# CT 10.05.08 - Validar filtro Tipo de registro
#     [Documentation]     Caso de teste valida se filtro Tipo de registro está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Histórico das requisições
#     Quando clico em "Filtros"
#     E seleciono filtro Tipo de registro
#     E clico em Buscar
#     Então sistema exibe informações de filtro Tipo de registro em Histórico das requisições

# CT 10.05.09 - Validar filtro Data do registro
#     [Documentation]     Caso de teste valida se filtro Data do registro está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Histórico das requisições
#     Quando clico em "Filtros"
#     E seleciono filtro Data do registro
#     E clico em Buscar
#     Então sistema exibe informações de filtro Data do registro em Histórico das requisições

# # CT 10.05.10 - Validar botão visualizar
# #     [Documentation]     Caso de teste valida se botão visualizar está funcional
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Sistema"
# #     E clico em Histórico das requisições
# #     Quando clico em "Filtros"
# #     E preencho filtro responsável
# #     E clico em Buscar
# #     E clico no botão visualizar
# #     Então sistema visualiza informações de requisições

# CT 10.05.11 - Validar botão Próximo
#     [Documentation]     Caso de teste valida se botão Próximo está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Histórico das requisições
#     E clico no botão Próximo
#     Então sistema exibe informações de próxima tela

# CT 10.05.12 - Validar botão Anterior
#     [Documentation]     Caso de teste valida se botão Anterior está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Sistema"
#     E clico em Histórico das requisições
#     E clico no botão Próximo
#     E clico no botão Anterior
#     Então sistema exibe informações de tela anterior

# CT 10.06.01 - Validar menu Configurações > Monitoramento
#     [Documentation]     Caso de teste valida se Menu Configurações > Monitoramento está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Monitoramento"
#     Então sistema exibe informações de menu Configurações > Monitoramento

# CT 10.06.02 - Validar filtro de busca
#     [Documentation]     Caso de teste valida se filtro de busca está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Monitoramento"
#     Quando clico no filtro busca
#     E preencho filtro busca
#     E clico em Buscar
#     Então sistema exibe informações de filtro de busca

# # CT 10.06.03 - Validar filtro quantidade de item por pág
# #     [Documentation]     Caso de teste valida se filtro quantidade de item por pág está funcional
# #     [Tags]    Configurações        
# #     Dado que clico no menu "Configurações > Monitoramento"
# #     E seleciono opção Cards ou Lista "Lista"
# #     Quando clico em "Quantidade de itens por pág"
# #     E preencho informações no campo quantidade
# #     Então sistema exibe informações de quantidade preenchida

# CT 10.06.04 - Validar filtro Cards ou Lista
#     [Documentation]     Caso de teste valida se filtro Cards ou Lista está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Monitoramento"
#     E seleciono opção Cards ou Lista "Lista"
#     Então sistema exibe informações com filtro "Lista"

# # CT 10.06.05 - Validar inserção
# #     [Documentation]     Caso de teste valida se inserção de novo cliente em Configurações > Monitoramento está funcional
# #     [Tags]    Configurações        
# # #   Inserir
# #     Dado que clico no menu "Configurações > Monitoramento"
# #     Quando clico no botão "Inserir"
# #     E preencho informações de dados
# #     E clico em "Salvar"
# #     Então sistema realiza inserção de novo cliente em Configurações > Monitoramento

# # #   Excluir
# #     Dado que clico no menu "Configurações > Monitoramento"
# #     Quando clico no filtro busca
# #     E preencho filtro busca em configurações
# #     E clico em Buscar
# #     Quando clico em "Excluir" em configurações
# #     E clico no botão "Continuar" em "Excluir"
# #     Então sistema realiza exclusão de novo cliente em Configurações > Monitoramento

# # CT 10.06.06 - Validar edição
# #     [Documentation]     Caso de teste valida se edição de cliente em Configurações > Monitoramento está funcional
# #     [Tags]    Configurações        
# # #   Inserir
# #     Dado que clico no menu "Configurações > Monitoramento"
# #     Quando clico no botão "Inserir"
# #     E preencho informações de dados
# #     E clico em "Salvar"
# #     Então sistema realiza inserção de novo cliente em Configurações > Monitoramento

# # #   Editar
# #     Aguardo carregamento da página
# #     Dado que clico no menu "Configurações > Monitoramento"
# #     Quando clico no filtro busca
# #     E preencho filtro de busca em configurações
# #     E clico em Buscar
# #     Quando clico em "Editar"
# #     E edito dados de cliente
# #     E clico em Atualizar
# #     Então sistema realiza edição de novo cliente em Configurações > Monitoramento

# # #   Excluir
# #     Dado que clico no menu "Configurações > Monitoramento"
# #     Quando clico no filtro busca
# #     E preencho filtro busca em configurações
# #     E clico em Buscar
# #     Quando clico em "Excluir" em configurações
# #     E clico no botão "Continuar" em "Excluir"
# #     Então sistema realiza exclusão de novo cliente em Configurações > Monitoramento

# # CT 10.06.07 - Validar exclusão
# #     [Documentation]     Caso de teste valida se exclusão de cliente em Configurações > Monitoramento está funcional
# #     [Tags]    Configurações        
# # #   Inserir
# #     Dado que clico no menu "Configurações > Monitoramento"
# #     Quando clico no botão "Inserir"
# #     E preencho informações de dados
# #     E clico em "Salvar"
# #     Então sistema realiza inserção de novo cliente em Configurações > Monitoramento

# # #   Excluir
# #     Dado que clico no menu "Configurações > Monitoramento"
# #     Quando clico no filtro busca
# #     E preencho filtro busca em configurações
# #     E clico em Buscar
# #     Quando clico em "Excluir" em configurações
# #     E clico no botão "Continuar" em "Excluir"
# #     Então sistema realiza exclusão de novo cliente em Configurações > Monitoramento

# CT 10.07.01 - Validar menu Configurações > Obras
#     [Documentation]     Caso de teste valida se Menu Configurações > Obras está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Obras"
#     Então sistema exibe informações de menu Configurações > Obras

# CT 10.07.02 - Validar inserção de Novo tipo
#     [Documentation]     Caso de teste valida se Inserção de Novo tipo está funcional
#     [Tags]    Configurações        
# #   Inserir
#     Dado que clico no menu "Configurações > Obras"
#     Quando clico no botão "Novo tipo"
#     E preencho informações de Novo tipo de Requisições
#     E clico em "Salvar"
#     Então sistema exibe informações de menu botao Novo tipo

# #   Excluir
#     Dado que clico no menu "Configurações > Obras"
#     Quando clico no filtro busca
#     E preencho filtro busca em configurações
#     Quando clico em "Excluir" em configurações
#     E clico no botão "Continuar" em "Excluir"
#     Então sistema realiza exclusão de novo cliente em Configurações > Monitoramento

# CT 10.07.03 - Validar ediçao de tipo de requisição
#     [Documentation]     Caso de teste valida se Edição de tipo de requisição está funcional
#     [Tags]    Configurações        
# #   Inserir
#     Dado que clico no menu "Configurações > Obras"
#     Quando clico no botão "Novo tipo"
#     E preencho informações de Novo tipo de Requisições
#     E clico em "Salvar"
#     Então sistema exibe informações de menu botao Novo tipo

# #   Editar
#     E volto pra tela inicio
#     Dado que clico no menu "Configurações > Obras"
#     E clico no botao buscar
#     E preencho informações de pesquisa
#     Quando clico em "Editar" em configuracoes
#     E edito informações de tipo de requisição em Configurações > Obras
#     E clico em "Salvar"
#     Então sistema exibe informações de "Editar" no menu Configurações > Requisições

# #   Excluir
#     Dado que clico no menu "Configurações > Obras"
#     Quando clico no filtro busca
#     E preencho filtro busca em configurações
#     Quando clico em "Excluir" em configurações
#     E clico no botão "Continuar" em "Excluir"
#     Então sistema realiza exclusão de novo cliente em Configurações > Monitoramento

# CT 10.07.04 - Validar filtro "Cards ou Lista"
#     [Documentation]     Caso de teste valida se filtro Cards ou Lista no menu Configurações > Requisições está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Obras"
#     E seleciono opção Cards ou Lista "Lista"
#     Então sistema exibe informações com filtro "Lista" em Configurações > Requisições

# CT 10.07.05 - Validar filtro de busca
#     [Documentation]     Caso de teste valida se filtro de busca está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Obras"
#     Quando clico no filtro busca
#     E preencho filtro busca em Configurações > Obras
#     Então sistema exibe informações de filtro de busca em Configurações > Obras

# CT 10.07.06 - Validar botão Perguntas
#     [Documentation]     Caso de teste valida se botão Perguntas está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Obras"
#     E clico no botao "Perguntas"
#     Então sistema exibe informações de tela de Perguntas

# CT 10.07.07 - Validar exclusão
#     [Documentation]     Caso de teste valida se exclusão de cliente em Configurações > Obras está funcional
#     [Tags]    Configurações        
# #   Inserir
#     Dado que clico no menu "Configurações > Obras"
#     Quando clico no botão "Novo tipo"
#     E preencho informações de Novo tipo de Requisições
#     E clico em "Salvar"
#     Então sistema exibe informações de menu botao Novo tipo

# #   Excluir
#     Dado que clico no menu "Configurações > Obras"
#     Quando clico no filtro busca
#     E preencho filtro busca em configurações
#     Quando clico em "Excluir" em configurações
#     E clico no botão "Continuar" em "Excluir"
#     Então sistema realiza exclusão de novo cliente em Configurações > Monitoramento

# CT 10.08.01 - Validar menu Configurações > Contratos
#     [Documentation]     Caso de teste valida se Menu Configurações > Contratos está funcional
#     [Tags]    Configurações        
#     Dado que clico no menu "Configurações > Contratos"
#     Então sistema exibe informações de menu Configurações > Contratos





