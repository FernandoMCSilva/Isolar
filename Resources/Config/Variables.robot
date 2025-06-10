*** Variables ***
${URLISO}                   https://teste.grupoiso.com.br/
# ...    https://teste.grupoiso.com.br/
# ...    https://validacao.grupoiso.com.br/
# ...    https://sistemas.grupoiso.com.br/

${BROWSER}                  chrome
${LOGO}                     //img[@alt='Logo Grupo ISO']

# suporte@gerenciadores.com
# suporte@gerenciadores.com

${EmailAdmin}                qa@grupoiso.com.br
${SenhaAdmin}                Isolar@2023
${EmailOseias}               compras@grupoiso.com.br
${SenhaOseias}               Isolar@2023
${EmailVendedor}             joice@isolarenergy.com.br
${SenhaVendedor}             Isolar@2023
${EmailTecnico}              projetos6@isolarenergy.com.br
${SenhaTecnico}              Isolar@2023

# Início
${MENU_INICIO}               //a[contains(.,'Início')]
${MENU_REQUISICOES}          //a[contains(.,'Requisições')]
${MENU_OBRAS}                //button[contains(.,'Obras')]
${MENU_CONTROLECONTRATOS}   //button[contains(.,'Controle de contratos')]
${MENU_PROPOSTAENERGY}       (//a[@href='/estimativa'])[1]
${MENU_MISOL}                //a[contains(.,'Mi Sol')]
${MENU_MONITORAMENTO}        //a[contains(.,'Monitoramento')]
${MENU_DOCUMENTOS}           (//div[contains(.,'Documentos')])[8]
${MENU_CADASTROS}            //p[contains(.,'Cadastros')]
${MENU_USUARIOS}             //a[contains(.,'Usuários')]
${MENU_CONFIGURACOES}        (//div[contains(.,'Configurações')])[7]
${MENU_RELATORIOS}           (//div[contains(.,'Relatórios')])[7]
${MENU_MONITORAMENTO}        //a[contains(.,'Monitoramento')]
${MENU_NOVIDADES}            //a[contains(.,'Novidades')]
