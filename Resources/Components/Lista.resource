*** Settings ***
Documentation      Ações da tela de testes de lista

Library            AppiumLibrary

*** Keywords ***
Item exclusion
    [Arguments]     ${character}
    ${positions}    Get Element Location   xpath=//android.widget.TextView[contains(@text, "${character}")]/../../..//*[contains(@resource-id, "indicator")]

    ${startX}     Set Variable    ${positions}[x]
    ${startY}     Set Variable    ${positions}[y]
    ${offsetX}    Evaluate        ${positions}[x] - 600
    ${offsety}    Set Variable    ${positions}[y]


    Swipe    ${startX}    ${startY}    ${offsetX}    ${offsety}

    Click Element    xpath=//android.widget.FrameLayout[@resource-id="com.qaxperience.yodapp:id/btnRemove"]

    Wait Until Page Does Not Contain    ${character}