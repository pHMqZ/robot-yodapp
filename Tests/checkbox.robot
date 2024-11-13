*** Settings ***
Documentation        Ações e elementos do menu do aplicativo


Resource            ../Resources/Base.resource

Test Setup          Start session

Test Teardown       Finish session



*** Test Cases ***
Marcação de linguagens que usam appium
    Get started

    Navigate to    Check e Radio

    Go to item     Checkbox    Marque as techs que usam Appium

    @{techs}    Create List    Ruby    Python    Java    Javascript    C#    Robot Framework

    FOR  ${tech}  IN  @{techs}
        Click Element  xpath=//android.widget.CheckBox[contains(@text, "${tech}")]
    END

    Sleep    3
    

    
