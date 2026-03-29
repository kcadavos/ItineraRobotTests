*** Settings ***
Documentation    This is the E2E test suite for Itinera Login functionality. This compares the API response VS the UI data
Library    SeleniumLibrary
Library    RequestsLibrary
Resource    ../../resources/api/LoginAPI.robot    
Resource    ../../pages/Login/Loginpage.robot
Resource    ../../variables/common_vars.robot

Test Setup      Open Browser    about:blank    ${browser}    options=add_argument("--window-size=1920,1080")
Test Teardown    Close Browser

*** Variables ***
&{User1}    username=kcadavos@gmail.com    password=123     

*** Tests  Cases ***
E2E Login Test
    [Arguments]     ${UserToLogin}
    ${apiUserName}=     LoginAPI.Get User Name    ${UserToLogin}[username]
    ${UIUserName}=     LoginValidUsers    ${UserToLogin}