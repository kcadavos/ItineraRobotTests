*** Settings ***
Documentation    This is the  page resource file for Itinera Login functionality.
Library    SeleniumLibrary
Library     XML
Resource    ../../resources/UIKeywords.robot

*** Variables ***
${user}     validUser
${pass}    validPassword
${img_locator}     img[alt="Menu"]
${UserToLogin}    User1
&{User1}    username=kcadavos@gmail.com    password=123     name=Karen Two
&{User2}    username=karencadavos@gmail.com    password=123     name=Karen Anne
# &{CustomerList}   User1=${User1}    User2=${User2}


#XPATH LOCATORS
${email_locator}         xpath=//div[@id="login-desktop"]//input[@id="email-input"]
${password_locator}      xpath=//div[@id="login-desktop"]//input[@id="password-input"]
${loginbtn_locator}      xpath=//div[@id="login-desktop"]//button[@id="login-btn"]

*** Keywords ***
# Access Login  
#     [Arguments]     ${UserToLogin}
#     ${user}=     Set Variable    ${CustomerList}[${UserToLogin}]
#     Log To Console   USERBEINGTESTED:${user}[username]
#     LoginItinera    ${user}


LoginOnly
    [Arguments]     ${username}    ${password}
        Wait Until Element Is Visible    ${email_locator}    10s
        Input Text     ${email_locator}      ${username}
        Wait Until Element Is Visible    ${password_locator}     10s
        Input Text     ${password_locator}   ${password}
        Wait Until Element Is Enabled    ${loginbtn_locator}   10s
        Click Button   ${loginbtn_locator} 



Verify Login Successful
    [Arguments]    ${user}
        Wait Until Element Is Visible    id:greetingname-desktop   10s
        ${userInUI}=  Get Text     id:greetingname-desktop
        Should Be Equal    ${userInUI}   ${user}[name]


Verify Login Not Successful 
    [Arguments]    ${user}
        Page Should Not Contain    Hi ${user}[name]

Get User Name From UI
    [Arguments]    ${UserToLogin}
        Log To Console    LoginPage Username: ${UserToLogin}[username]
        LoginOnly    ${UserToLogin}[username]    ${UserToLogin}[password]
        Wait Until Element Is Visible    id:greetingname-desktop   10s
        ${userInUI}=  Get Text     id:greetingname-desktop
        RETURN     ${userInUI}
