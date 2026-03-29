*** Settings ***
Documentation    This is the UI test suite for Itinera Login functionality.
Library    SeleniumLibrary
Resource    ../../variables/common_vars.robot
Resource    ../../pages/Login/Loginpage.robot
Test Setup      Open Browser    about:blank    ${browser}    options=add_argument("--window-size=1920,1080")
Test Teardown    Close Browser


*** Variables ***

&{User1}    username=kcadavos@gmail.com    password=123     name=Karen Two
&{User2}    username=karencadavos@gmail.com    password=123     name=Karen Anne
&{User3}    username=invalidEmail@gmail.com    password=123     name=Karen Two
&{User4}    username=karencadavos@gmail.com    password=invalid123     name=Karen Anne  

*** Test Cases ***
Test Valid Users
    [Template]    LoginValidUsers
    ${User1}
    ${User2}

Test Invalid Users
    [Template]    LoginInvalidUsers
    ${User3}
    ${User4}

*** Keywords ***
LoginValidUsers
    [Arguments]     ${user}
    UIKeywords.Open the url    ${LoginURL}
    Loginpage.LoginOnly    ${user}[username]    ${user}[password]
    Loginpage.Verify Login Successful     ${user} 


LoginInvalidUsers
    [Arguments]     ${user}
    UIKeywords.Open the url    ${LoginURL}
    Loginpage.LoginOnly    ${user}[username]    ${user}[password]
    Loginpage.Verify Login Not Successful      ${user}

