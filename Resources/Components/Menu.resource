*** Settings ***
Documentation        Ações do menu lateral do aplicativo

Library              AppiumLibrary



*** Keywords ***
Navigate to 
    [Arguments]    ${itemText}
    ${sideMenu}     Set Variable     xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${sideMenu}    5

    Click Element                    ${sideMenu}

    ${menuItem}    Set Variable      xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${itemText}"]

    Wait Until Element Is Visible    ${menuItem}    5

    Click Element                    ${menuItem}