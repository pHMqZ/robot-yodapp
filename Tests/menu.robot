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
    
    ${sideMenu}     Set Variable     xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${sideMenu}    5

    Click Element                    ${sideMenu}

    ${menuItem}    Set Variable      xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="Formulários"]

    Wait Until Element Is Visible    ${menuItem}    5

    Click Element                    ${menuItem}

