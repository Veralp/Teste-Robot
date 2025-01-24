
*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    https://www.saucedemo.com/
${Browser}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce



*** Test Cases ***
*** Test Cases ***
Successful Login
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button    id=login-button
    &{location}    Get Location
    Should Be Equal    ${location}    ttps://www.saucedemo.com/inventory
    Close Browser

Unsuccessful Login - No Credentials
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Element Is Visible    id=user-name
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    Epic sadface: Username is required
    Close Browser

Unsuccessful Login - No Username
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    Epic sadface: Username is required
    Close Browser

Unsuccessful Login - No Password
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    Epic sadface: Password is required
    Close Browser

Unsuccessful Login - Wrong Credentials
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    standard
    Input Text    id=password     secret_
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    Epic sadface: Username and password do not match any user in this service
    Close Browser
