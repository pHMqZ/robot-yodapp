*** Settings ***
Documentation        Ações e elementos do menu do aplicativo

Library              AppiumLibrary


Resource            ../Resources/Base.resource

Test Setup          Start session

Test Teardown       Finish session

*** Variables ***
${START}    QAX

*** Test Cases ***
Clicar no menu lateral
    
    Wait Until Page Contains    ${START} 

    Click Text                  ${START} 
    
    ${SIDEMENU}     Set Variable       xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${SIDEMENU}    5

    Click Element    ${SIDEMENU}