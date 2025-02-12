*** Settings ***
Documentation      Modúlo que Gerencie as requisições do tipo Obras cadastradas no sistema.
Resource           ../Main.robot

*** Variables ***
${Menu_ObrasDashboard}                 //a[contains(.,'Dashboard')]
${Menu_ObrasRequisicoes}               (//a[contains(.,'Requisições')])[2]

${filtro_Departamento_administrativo}  (//div[contains(.,'Administrativo')])[5]
${filtro_NivelUrgencia}                //button[contains(@id,'urgencia')]


*** Keywords ***                
# -3.1.1
Dado que clico no menu Obras > Dashboard
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_OBRAS}
    Click Element                    ${MENU_OBRAS}
    Wait Until Element Is Visible    ${Menu_ObrasDashboard}
    Click Element                    ${Menu_ObrasDashboard}

Então sistema exibe tela de Obras > Dashboard
    Wait Until Page Contains    text=Obras
    Wait Until Page Contains    text=Gerencie um resumo das informações cadastradas no sistema.

# -3.1.6
Então sistema exibe informações de filtros de data
    Wait Until Element Is Visible    (//span[contains(.,'1')])[3]

# -3.1.7
E valido filtros de departamento em Obras
    Wait Until Element Is Visible    ${Btn_Departamentos}
    Click Element                    ${Btn_Departamentos}
    Click Element                    (//div[contains(.,'Obras')])[19]

Então sistema exibe requisições do departamento em Obras
    Wait Until Page Contains    text=Gerencie um resumo das informações cadastradas no sistema.

# -3.2.1
Dado que clico no menu Obras > Requisições
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_OBRAS}
    Click Element                    ${MENU_OBRAS}
    Wait Until Element Is Visible    ${Menu_ObrasRequisicoes}
    Click Element                    ${Menu_ObrasRequisicoes}

Então sistema exibe tela de Obras > Requisições
    Wait Until Page Contains    text=Gerencie informações cadastradas no sistema.

# -3.2.2
Então sistema exibe resultado do filtro em Obras
    Wait Until Page Contains    text=Nenhuma requisição encontrada.

# -3.2.3
E valido filtros dentro de Departamento em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_DEPARTAMENTO}
    Click Element                    ${COMBOBOX_DEPARTAMENTO}
    Click Element                    ${filtro_Departamento_administrativo}
    Click Element                    ${Botao_Buscar}

Então sistema exibe resultado de Departamento
    Wait Until Element Is Visible    //td[contains(.,'2115')]

# -3.2.4
E valido todos os filtros dentro de Tipo em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_TIPO}
    Click Element                    ${COMBOBOX_TIPO}
    Click Element                    (//div[contains(.,'Todos')])[21]
    Click Element                    ${Botao_Buscar}

Então sistema exibe informações do filtro Tipo
    Wait Until Page Contains    text=Concluído

# -3.2.5
E seleciono filtro urgente "sim" em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_URGENTE}
    Click Element                    ${COMBOBOX_URGENTE}
    Click Element                    (//div[contains(.,'Sim')])[5]

Então sistema exibe resultado do filtro Urgente
    Wait Until Element Is Visible    ${filtro_NivelUrgencia}
    
# -3.2.6
E valido todos os filtros de Nivel de urgencia em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_URGENTE}    timeout=10s
    Click Element    ${COMBOBOX_URGENTE}
    # Pega todas as opções dentro do dropdown
    ${departamentos}    Get WebElements    ${COMBOBOX_URGENTE}

    FOR    ${departamento}    IN    @{OPCOES_COMBOBOX_NIVELDEURGENCIA}
            # Clica na opção de departamento atual
            Click Element    ${departamento}
            
            # Clica no botão de buscar
            Click Element    ${Btn_Buscar}
            
            # Espera pela atualização e valida que a página foi atualizada
            Wait Until Element Is Visible      //input[@id='cliente']      timeout=10s
            # Log do departamento testado
            ${departamento_text}    Get Text    ${departamento}
            Log    Departamento ${departamento_text} validado com sucesso
            Wait Until Element Is Visible    ${COMBOBOX_URGENTE}
            Execute JavaScript    window.scrollTo(0, 0)
            # Reabre a combobox para a próxima iteração
            Click Element    ${COMBOBOX_URGENTE}
        END

Então sistema exibe resultado de nível de urgência    
    Sleep    1.5s
    Click Element                    (//div[contains(.,'Alto')])[19]
    Wait Until Element Is Visible    //th[contains(.,'Cliente')]

# -3.2.7
E preencho informações de Data de entrega em Obras > Requisições
    Wait Until Element Is Visible    //button[@id='data_entrega']
    Click Element                    //button[@id='data_entrega']
    Wait Until Element Is Visible    (//button[@type='button'])[16]
    FOR    ${i}    IN RANGE    5
        Click Element    (//button[@type='button'])[16]
        Sleep    0.5s
    END
    Sleep    2s
    Click Element                    (//button[contains(.,'1')])[1]
    Click Element                    //button[contains(.,'31')]
    Click Element                    ${Botao_Buscar} 

# -3.2.8
E preencho informações de Data de criação em Obras > Requisições
    Wait Until Element Is Visible      //button[@id='data_criacao']
    Click Element                      //button[@id='data_criacao']
    Wait Until Element Is Visible    (//button[@type='button'])[16]
    FOR     ${i}    IN RANGE    5
    Click Element    (//button[@type='button'])[16]
    Sleep    0.5s
    END

    Click Element                      (//button[contains(.,'1')])[1]
    Click Element                      //button[contains(.,'31')]

    Click Element                      //button[@id='data_criacao']
    Click Element                      ${Botao_Buscar}

# -3.2.9
E valido todos os filtros dentro de "Responsável" em Obras > Requisições
    Wait Until Element Is Visible    ${COMBOBOX_RESPONSAVEL}
    Click Element                    ${COMBOBOX_RESPONSAVEL}
    Click Element                    (//div[contains(.,'OSEAS')])[5]

# -3.2.1