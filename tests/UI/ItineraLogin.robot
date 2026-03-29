*** Settings ***
Documentation    This is the UI test suite for Itinera Login functionality.
Library    SeleniumLibrary
Resource    ../../pages/Login/Loginpage.robot
Test Setup      Open Browser    about:blank    ${browser}    options=add_argument("--window-size=1920,1080")
Test Teardown    Close Browser


*** Variables ***
&{User1}    username=kcadavos@gmail.com    password=123     name=Karen Two
&{User2}    username=karencadavos@gmail.com    password=123     name=Karen Anne


*** Test Cases ***
Test All Users1
    [Template]    Loginpage.LoginItinera
    ${User1}
    ${User2}


