*** Settings ***

Resource            ../Resources/Base.resource

Test Setup          Start session

Test Teardown       Finish session



*** Test Cases ***
Marcação de linguagem favorita
    Get started

    Navigate to    Check e Radio

    Go to item     Botões de radio    Escolha sua linguagem preferida

    Click Element  xpath=//android.widget.RadioButton[contains(@text, "Java")]
    
    Sleep    3
    

    
