*** Variables ***
${URLISO}                   https://teste.grupoiso.com.br/
# ...    https://teste.grupoiso.com.br/
# ...    https://validacao.grupoiso.com.br/
# ...    https://sistemas.grupoiso.com.br/

${BROWSER}                  chrome
${LOGO}                     //img[@alt='Logo Isolar Energy']

# suporte@gerenciadores.com
# suporte@gerenciadores.com

${EmailAdmin}                qa@grupoiso.com.br
${SenhaAdmin}                24455090 
${EmailVendedor}             joice@isolarenergy.com.br
${SenhaVendedor}             Isolar@2023
${EmailTecnico}              projetos6@isolarenergy.com.br
${SenhaTecnico}              Isolar@2023

# Início
${MENU_INICIO}               //a[contains(.,'Início')]
${MENU_REQUISICOES}          //a[contains(.,'Requisições')]
${MENU_ESTIMATIVA}           //p[contains(.,'Estimativa')]
${MENU_CADASTROS}            //p[contains(.,'Cadastros')]
${MENU_USUARIOS}             //a[contains(.,'Usuários')]
${MENU_CONFIGURACOES}        (//div[contains(.,'Configurações')])[7]
${MENU_RELATORIOS}           (//div[contains(.,'Relatórios')])[7]
${MENU_PERFIL}               (//div[contains(.,'Perfil')])[7]
${MENU_NOVIDADES}            //a[contains(.,'Novidades')]
