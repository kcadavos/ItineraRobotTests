*** Settings ***
Documentation    This is the E2E test suite for Itinera Login functionality. This compares the API response VS the UI data
# Library    SeleniumLibrary
# Library    RequestsLibrary
Resource       ../../resources/api/LoginAPI.robot  
Resource        ../../pages/Login/Loginpage.robot
Resource       ../../resources/UIKeywords.robot
Resource        ../../variables/common_vars.robot
Test Setup      Open Browser    about:blank    ${browser}    options=add_argument("--window-size=1920,1080")
Test Teardown    Close Browser

*** Variables ***
&{User1}    username=karencadavos@gmail.com    password=123     

*** Test Cases ***
E2E Login Test
    UIKeywords.Open the url    ${LoginURL}
    ${apiUserName}=      LoginAPI.Get User Name    ${User1}[username]
    Log To Console    message: ${apiUserName}
    ${UIUserName}=      Loginpage.Get User Name From UI    ${User1}