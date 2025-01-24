*** Settings ***
Library    SeleniumLibrary
*** Keywords ***

I navigate to the login page
    [Arguments]    ${URL}
    Go to    ${URL}


