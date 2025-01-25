
*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Test Setup    Open Browser    ${URL}    ${Browser}

*** Variables ***
${URL}    https://www.saucedemo.com/
${Browser}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Successful Login
    I navigate to the login page    ${URL}    
    I input correct Credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    ${location}    Get Location
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html
    I am able view the home page
    Close Browser

Unsuccessful Login - No Credentials
    I navigate to the login page    ${URL}    


    I input no credentials        
    I click on the login button
    I am able to the expected error message   Epic sadface: Username is required
    Close Browser
    

Unsuccessful Login - No Username
    I navigate to the login page    ${URL}    
    I input only the password    ${PASSWORD}
    
    I click on the login button
    I am able to the expected error message   Epic sadface: Username is required
    Close Browser

Unsuccessful Login - No Password
    I navigate to the login page    ${URL}    
    I input only the username    ${USERNAME}
    I click on the login button
    I am able to the expected error message   Epic sadface: Password is required
    Close Browser

Unsuccessful Login - Wrong Credentials
    I navigate to the login page    ${URL}    
    I input wrong Credentials    kljuul    HJJKKLL    
    I click on the login button
    I am able to the expected error message    Epic sadface: Username and password do not match any user in this service
    Close Browser
