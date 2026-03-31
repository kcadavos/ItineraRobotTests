*** Settings*** 
Resource    ../../pages/Login/Loginpage.robot
Resource     ../../resources/UICommon.robot
Resource     ../../variables/common_vars.robot

*** Keywords ***
Login Valid User
    [Arguments]     ${user}
    UICommon.Open the url    ${LoginURL}
    Loginpage.LoginOnly    ${user}[username]    ${user}[password]
    Loginpage.Verify Login Successful     ${user} 


Login Invalid User
    [Arguments]     ${user}
    UICommon.Open the url    ${LoginURL}
    Loginpage.LoginOnly    ${user}[username]    ${user}[password]
    Loginpage.Verify Login Not Successful      ${user}

Login User
    [Arguments]     ${user}
    UICommon.Open the url    ${LoginURL}
    Loginpage.LoginOnly    ${user}[username]    ${user}[password]


