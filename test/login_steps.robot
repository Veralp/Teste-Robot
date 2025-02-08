*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Suite Setup     Open Browser    browser=chrome


#*** Variables ***
#${URL}    https://www.saucedemo.com/


*** Test Cases ***
Successful Login
    I navigate to the login page      
    I input correct Credentials    
    I click on the login button
    ${location}    Get Location
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html
    I am able view the home page
    Close Browser

Unsuccessful Login - No Credentials
    I navigate to the login page    
    I input no credentials        
    I click on the login button
    I am able to see the expected error message for no credentials    
    Close Browser
    

Unsuccessful Login - No Username
    I navigate to the login page    
    I input only the password    
    
    I click on the login button
    I am able to see the expected error message for no username 
    Close Browser

Unsuccessful Login - No Password
    I navigate to the login page     
    I input only the username 
    I click on the login button
    I am able to see the expected error message for no password 
    Close Browser

Unsuccessful Login - Wrong Credentials
    I navigate to the login page      
    I input wrong Credentials     
    I click on the login button
    I am able to see the expected error message for wrong credentials    
    Close Browser


