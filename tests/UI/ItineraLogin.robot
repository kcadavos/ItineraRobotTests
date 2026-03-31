*** Settings ***
Documentation    This is the UI test suite for Itinera Login functionality.
Resource    ../../variables/common_vars.robot
Resource    ../../variables/users.robot
# Resource     ../../resources/UICommon.robot
Resource    ../../resources/UI/UILogin.robot


Test Setup      Open Browser    about:blank    ${browser}    options=add_argument("--window-size=1920,1080")
Test Teardown    Close Browser



*** Test Cases ***
Valid Users Can Login
    [Template]    Login Valid User
    ${User1}
    ${User2}

Invalid Users Cannot Login
    [Template]    Login Invalid User
    ${User3}
    ${User4}
